<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use App\Models\Setting;

class SettingsController extends Controller
{
    /**
     * Get all settings
     */
    public function index()
    {
        try {
            // Try to get from cache first (for performance)
            $settings = Cache::remember('app_settings', 3600, function () {
                return $this->getSettingsFromDatabase();
            });
            
            // Get versions for conflict detection
            $versions = [];
            $dbSettings = Setting::all();
            foreach ($dbSettings as $setting) {
                $versions[$setting->key] = $setting->version;
            }
            
            return response()->json([
                'status' => 200,
                'message' => 'Settings fetched successfully',
                'data' => $settings,
                'versions' => $versions
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Error fetching settings: ' . $e->getMessage());
            return response()->json([
                'status' => 500,
                'message' => 'Error fetching settings: ' . $e->getMessage()
            ], 500);
        }
    }
    
    /**
     * Get settings history
     */
    public function history(Request $request)
    {
        try {
            $settingKey = $request->query('key');
            $limit = $request->query('limit', 50);
            
            $query = \App\Models\SettingHistory::with('changedBy')
                ->orderBy('changed_at', 'desc');
            
            if ($settingKey) {
                $query->where('key', $settingKey);
            }
            
            $history = $query->limit($limit)->get();
            
            return response()->json([
                'status' => 200,
                'message' => 'Settings history fetched successfully',
                'data' => $history
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Error fetching settings history: ' . $e->getMessage());
            return response()->json([
                'status' => 500,
                'message' => 'Error fetching settings history: ' . $e->getMessage()
            ], 500);
        }
    }


    /**
     * Update settings
     */
    public function update(Request $request)
    {
        try {
            DB::beginTransaction();
            
            $userId = $request->user()->id ?? null;
            $updatedSettings = [];
            
            // Get all request data
            $data = $request->all();
            
            // Define setting configurations
            $settingConfigs = $this->getSettingConfigs();
            
            // Process each setting
            foreach ($settingConfigs as $key => $config) {
                if (isset($data[$key])) {
                    $value = $data[$key];
                    
                    // Handle file uploads (logo and favicon)
                    if (in_array($key, ['logo_url', 'favicon_url'])) {
                        // If it's a base64 image, save it
                        if (is_string($value) && strpos($value, 'data:image') === 0) {
                            try {
                                $value = $this->saveBase64Image($value, str_replace('_url', '', $key));
                            } catch (\Exception $e) {
                                \Log::error("Failed to save {$key}: " . $e->getMessage());
                                continue; // Skip this field if save fails
                            }
                        }
                    }
                    
                    // Get or create setting
                    $setting = Setting::firstOrNew(['key' => $key]);
                    
                    // Check for concurrent edits
                    if ($setting->exists && isset($data['version_' . $key])) {
                        if ($setting->version != $data['version_' . $key]) {
                            DB::rollBack();
                            return response()->json([
                                'status' => 409,
                                'message' => "Conflict detected: Setting '{$key}' was modified by another user. Please refresh and try again.",
                                'conflicted_key' => $key
                            ], 409);
                        }
                    }
                    
                    $oldValue = $setting->value ?? null;
                    
                    // Update setting
                    $setting->key = $key;
                    $setting->type = $config['type'];
                    $setting->group = $config['group'];
                    $setting->description = $config['description'] ?? null;
                    $setting->is_encrypted = $config['encrypted'] ?? false;
                    $setting->updated_by = $userId;
                    $setting->version = ($setting->version ?? 0) + 1;
                    
                    // Set value (will be encrypted automatically if is_encrypted is true)
                    $setting->value = $value;
                    $setting->save();
                    
                    // Record change in history
                    if ($oldValue != $value) {
                        $setting->recordChange($oldValue, $value, $userId, $setting->wasRecentlyCreated ? 'create' : 'update');
                    }
                    
                    $updatedSettings[$key] = $setting->value;
                }
            }
            
            DB::commit();
            
            // Clear cache to force refresh
            Cache::forget('app_settings');
            
            // Get updated settings with versions for conflict detection
            $settingsWithVersions = $this->getSettingsWithVersions();
            
            return response()->json([
                'status' => 200,
                'message' => 'Settings updated successfully',
                'data' => $settingsWithVersions['data'],
                'versions' => $settingsWithVersions['versions']
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Settings update error: ' . $e->getMessage());
            return response()->json([
                'status' => 500,
                'message' => 'Error updating settings: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get settings from database or initialize defaults
     */
    private function getSettingsFromDatabase()
    {
        $settings = [];
        $defaultSettings = $this->getDefaultSettings();
        
        // Initialize defaults if database is empty
        if (Setting::count() === 0) {
            foreach ($this->getSettingConfigs() as $key => $config) {
                $setting = Setting::create([
                    'key' => $key,
                    'value' => $defaultSettings[$key] ?? '',
                    'type' => $config['type'],
                    'group' => $config['group'],
                    'description' => $config['description'] ?? null,
                    'is_encrypted' => $config['encrypted'] ?? false,
                    'version' => 1
                ]);
                
                $settings[$key] = $setting->value;
            }
        } else {
            // Get all settings from database
            $dbSettings = Setting::all();
            
            foreach ($dbSettings as $setting) {
                $settings[$setting->key] = $setting->value;
            }
            
            // Fill in any missing settings with defaults
            foreach ($defaultSettings as $key => $value) {
                if (!isset($settings[$key])) {
                    $settings[$key] = $value;
                }
            }
        }
        
        return $settings;
    }
    
    /**
     * Get settings with version numbers for conflict detection
     */
    private function getSettingsWithVersions()
    {
        $settings = $this->getSettingsFromDatabase();
        $versions = [];
        
        $dbSettings = Setting::all();
        foreach ($dbSettings as $setting) {
            $versions[$setting->key] = $setting->version;
        }
        
        return [
            'data' => $settings,
            'versions' => $versions
        ];
    }
    
    /**
     * Get setting configurations (type, group, encryption)
     */
    private function getSettingConfigs()
    {
        return [
            'site_name' => [
                'type' => 'string',
                'group' => 'general',
                'description' => 'Website name',
                'encrypted' => false
            ],
            'site_email' => [
                'type' => 'string',
                'group' => 'general',
                'description' => 'Contact email',
                'encrypted' => false
            ],
            'currency' => [
                'type' => 'string',
                'group' => 'general',
                'description' => 'Store currency',
                'encrypted' => false
            ],
            'tax_rate' => [
                'type' => 'integer',
                'group' => 'general',
                'description' => 'Tax percentage',
                'encrypted' => false
            ],
            'free_shipping_threshold' => [
                'type' => 'integer',
                'group' => 'shipping',
                'description' => 'Free shipping minimum amount',
                'encrypted' => false
            ],
            'smtp_host' => [
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP server host',
                'encrypted' => false
            ],
            'smtp_port' => [
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP server port',
                'encrypted' => false
            ],
            'smtp_username' => [
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP username',
                'encrypted' => false
            ],
            'smtp_password' => [
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP password',
                'encrypted' => true // ENCRYPTED for security
            ],
            'payment_gateway' => [
                'type' => 'string',
                'group' => 'payment',
                'description' => 'Payment gateway provider',
                'encrypted' => false
            ],
            'payment_test_mode' => [
                'type' => 'boolean',
                'group' => 'payment',
                'description' => 'Payment test mode enabled',
                'encrypted' => false
            ],
            'logo_url' => [
                'type' => 'string',
                'group' => 'general',
                'description' => 'Store logo URL',
                'encrypted' => false
            ],
            'favicon_url' => [
                'type' => 'string',
                'group' => 'general',
                'description' => 'Favicon URL',
                'encrypted' => false
            ]
        ];
    }

    /**
     * Save base64 encoded image to storage
     */
    private function saveBase64Image($base64String, $type = 'logo')
    {
        try {
            // Extract base64 data
            if (preg_match('/^data:image\/(\w+);base64,/', $base64String, $match)) {
                $format = $match[1];
                $imageData = base64_decode(str_replace("data:image/{$format};base64,", '', $base64String));
                
                // Validate file size (max 2MB)
                if (strlen($imageData) > 2097152) {
                    throw new \Exception('Image file size exceeds 2MB limit');
                }
                
                // Generate filename
                $filename = $type . '_' . time() . '.' . $format;
                
                // Save to public storage
                Storage::disk('public')->put("settings/{$filename}", $imageData);
                
                // Return the public URL
                return "/storage/settings/{$filename}";
            }
            
            return $base64String;
        } catch (\Exception $e) {
            throw new \Exception('Error saving image: ' . $e->getMessage());
        }
    }

    /**
     * Get default settings
     */
    private function getDefaultSettings()
    {
        return [
            'site_name' => 'My E-commerce Store',
            'site_email' => 'admin@example.com',
            'currency' => 'BDT',
            'tax_rate' => 0,
            'free_shipping_threshold' => 1000,
            'smtp_host' => 'smtp.gmail.com',
            'smtp_port' => '587',
            'smtp_username' => '',
            'smtp_password' => '',
            'payment_gateway' => 'stripe',
            'payment_test_mode' => true,
            'logo_url' => '',
            'favicon_url' => ''
        ];
    }
}
