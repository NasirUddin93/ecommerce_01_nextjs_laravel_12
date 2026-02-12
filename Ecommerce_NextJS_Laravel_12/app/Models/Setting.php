<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;

class Setting extends Model
{
    use HasFactory;

    protected $fillable = [
        'key',
        'value',
        'type',
        'group',
        'description',
        'is_encrypted',
        'updated_by',
        'version'
    ];

    protected $casts = [
        'is_encrypted' => 'boolean',
        'version' => 'integer'
    ];

    /**
     * Get the decrypted value if encrypted
     */
    public function getValueAttribute($value)
    {
        // Don't decrypt if value is null or empty
        if (empty($value)) {
            return $value;
        }

        // Decrypt if this setting is marked as encrypted
        if ($this->is_encrypted) {
            try {
                return Crypt::decryptString($value);
            } catch (\Exception $e) {
                \Log::error("Failed to decrypt setting {$this->key}: " . $e->getMessage());
                return null;
            }
        }

        // Parse based on type
        return $this->parseValue($value);
    }

    /**
     * Set the value, encrypting if needed
     */
    public function setValueAttribute($value)
    {
        // Handle null or empty values
        if ($value === null || $value === '') {
            $this->attributes['value'] = $value;
            return;
        }

        // Encrypt sensitive data
        if ($this->is_encrypted) {
            $this->attributes['value'] = Crypt::encryptString($value);
        } else {
            $this->attributes['value'] = $value;
        }
    }

    /**
     * Parse value based on type
     */
    private function parseValue($value)
    {
        switch ($this->type) {
            case 'integer':
                return (int) $value;
            case 'boolean':
                return filter_var($value, FILTER_VALIDATE_BOOLEAN);
            case 'json':
                return json_decode($value, true);
            default:
                return $value;
        }
    }

    /**
     * Get the user who last updated this setting
     */
    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    /**
     * Get history records
     */
    public function history()
    {
        return $this->hasMany(SettingHistory::class, 'setting_id');
    }

    /**
     * Record a change in history
     */
    public function recordChange($oldValue, $newValue, $userId = null, $changeType = 'update')
    {
        SettingHistory::create([
            'setting_id' => $this->id,
            'key' => $this->key,
            'old_value' => $oldValue,
            'new_value' => $newValue,
            'changed_by' => $userId,
            'change_type' => $changeType,
            'changed_at' => now()
        ]);
    }
}
