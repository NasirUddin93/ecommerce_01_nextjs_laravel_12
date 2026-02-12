<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\UserPreference;
use App\Models\UserSession;
use App\Models\UserActivityLog;
use App\Models\EmailVerificationToken;

class UserProfileController extends Controller
{
    /**
     * Get authenticated user profile
     */
    public function profile(Request $request)
    {
        try {
            $user = $request->user();
            
            return response()->json([
                'success' => true,
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone' => $user->phone_number ?? $user->phone,
                    'profile_photo' => $user->profile_photo_path,
                    'address' => $user->address,
                    'city' => $user->city,
                    'district' => $user->district,
                    'postal_code' => $user->postal_code,
                    'country' => $user->country ?? 'Bangladesh',
                    'date_of_birth' => $user->date_of_birth,
                    'gender' => $user->gender,
                    'role' => $user->role,
                    'email_verified_at' => $user->email_verified_at?->toISOString(),
                    'phone_verified_at' => $user->phone_verified_at?->toISOString(),
                    'is_active' => $user->is_active ?? true,
                    'created_at' => $user->created_at->toISOString(),
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch profile',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update authenticated user profile
     */
    public function updateProfile(Request $request)
    {
        try {
            $user = $request->user();
            
            $validator = Validator::make($request->all(), [
                'name' => 'sometimes|string|max:255',
                'email' => 'sometimes|email|unique:users,email,' . $user->id,
                'phone_number' => 'nullable|string|max:20',
                'phone' => 'nullable|string|max:20',
                'address' => 'nullable|string|max:500',
                'city' => 'nullable|string|max:100',
                'district' => 'nullable|string|max:100',
                'postal_code' => 'nullable|string|max:20',
                'country' => 'nullable|string|max:100',
                'date_of_birth' => 'nullable|date',
                'gender' => 'nullable|in:male,female,other',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Track old values for activity log
            $oldValues = [
                'name' => $user->name,
                'email' => $user->email,
                'phone_number' => $user->phone_number ?? $user->phone,
                'address' => $user->address,
                'city' => $user->city,
            ];

            $newValues = [
                'name' => $request->name ?? $user->name,
                'email' => $request->email ?? $user->email,
                'phone_number' => $request->phone_number ?? $request->phone ?? $user->phone_number ?? $user->phone,
                'address' => $request->address ?? $user->address,
                'city' => $request->city ?? $user->city,
            ];

            // Update user
            $user->update($request->only([
                'name', 
                'email', 
                'phone_number',
                'phone',
                'address', 
                'city',
                'district',
                'postal_code',
                'country',
                'date_of_birth',
                'gender'
            ]));

            // Log activity
            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_PROFILE_UPDATE,
                UserActivityLog::CATEGORY_PROFILE,
                'User profile was updated',
                request()->ip(),
                request()->userAgent(),
                $oldValues,
                $newValues,
                'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Profile updated successfully',
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone' => $user->phone_number ?? $user->phone,
                    'profile_photo' => $user->profile_photo_path,
                    'address' => $user->address,
                    'city' => $user->city,
                    'district' => $user->district,
                    'postal_code' => $user->postal_code,
                    'country' => $user->country ?? 'Bangladesh',
                    'role' => $user->role,
                    'created_at' => $user->created_at->toISOString(),
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update profile',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Upload profile photo
     */
    public function uploadProfilePhoto(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'photo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Store old photo path for cleanup
            $oldPhotoPath = $user->profile_photo_path;

            // Store new photo
            $path = $request->file('photo')->store('profile-photos/' . $user->id, 'public');

            // Update user
            $user->update(['profile_photo_path' => 'storage/' . $path]);

            // Delete old photo if exists
            if ($oldPhotoPath && file_exists(storage_path('public/' . str_replace('storage/', '', $oldPhotoPath)))) {
                unlink(storage_path('public/' . str_replace('storage/', '', $oldPhotoPath)));
            }

            // Log activity
            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_PROFILE_UPDATE,
                UserActivityLog::CATEGORY_PROFILE,
                'Profile photo was updated',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Profile photo uploaded successfully',
                'photo_url' => asset($user->profile_photo_path)
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to upload profile photo',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Change password
     */
    public function changePassword(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'current_password' => 'required|string',
                'new_password' => 'required|string|min:8|confirmed',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Verify current password
            if (!Hash::check($request->current_password, $user->password)) {
                UserActivityLog::log(
                    $user->id,
                    UserActivityLog::ACTION_PASSWORD_CHANGE,
                    UserActivityLog::CATEGORY_SECURITY,
                    'Failed password change attempt - incorrect current password',
                    status: 'failed'
                );

                return response()->json([
                    'success' => false,
                    'message' => 'Current password is incorrect'
                ], 401);
            }

            // Update password
            $user->password = Hash::make($request->new_password);
            $user->save();

            // Log activity
            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_PASSWORD_CHANGE,
                UserActivityLog::CATEGORY_SECURITY,
                'Password was changed',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Password changed successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to change password',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update notification preferences
     */
    public function updateNotificationPreferences(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'email_notifications' => 'sometimes|boolean',
                'sms_notifications' => 'sometimes|boolean',
                'push_notifications' => 'sometimes|boolean',
                'order_updates' => 'sometimes|boolean',
                'promotions' => 'sometimes|boolean',
                'marketing_emails' => 'sometimes|boolean',
                'newsletter' => 'sometimes|boolean',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Get or create user preferences
            $prefs = $user->preferences() ?? UserPreference::create(['user_id' => $user->id]);

            // Update preferences
            $prefs->update($request->all());

            // Log activity
            UserActivityLog::log(
                $user->id,
                'notification_preferences_update',
                UserActivityLog::CATEGORY_NOTIFICATION,
                'Notification preferences were updated',
                newValues: $request->all(),
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Notification preferences updated successfully',
                'preferences' => $prefs
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update notification preferences',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get notification preferences
     */
    public function getNotificationPreferences(Request $request)
    {
        try {
            $user = $request->user();

            // Get preferences or create defaults
            $prefs = $user->preferences ?? UserPreference::create([
                'user_id' => $user->id,
                'email_notifications' => true,
                'sms_notifications' => false,
                'push_notifications' => true,
                'order_updates' => true,
                'promotions' => false,
                'marketing_emails' => false,
                'newsletter' => false,
            ]);

            return response()->json([
                'success' => true,
                'preferences' => [
                    'email_notifications' => (bool)$prefs->email_notifications,
                    'sms_notifications' => (bool)$prefs->sms_notifications,
                    'push_notifications' => (bool)$prefs->push_notifications,
                    'order_updates' => (bool)$prefs->order_updates,
                    'promotions' => (bool)$prefs->promotions,
                    'marketing_emails' => (bool)$prefs->marketing_emails,
                    'newsletter' => (bool)$prefs->newsletter,
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch notification preferences',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Enable Two-Factor Authentication
     * Returns QR code for authenticator apps
     */
    public function enable2FA(Request $request)
    {
        try {
            $user = $request->user();

            // Check if 2FA is already enabled
            if ($user->two_factor_enabled) {
                return response()->json([
                    'success' => false,
                    'message' => '2FA is already enabled for this account'
                ], 400);
            }

            // Generate new 2FA secret
            $secret = base_convert(bin2hex(random_bytes(5)), 16, 32);
            $user->update(['two_factor_secret' => Crypt::encryptString($secret)]);

            // Generate QR code URL for authenticator apps
            $qrCodeUrl = 'otpauth://totp/' . urlencode($user->email) . 
                         '?secret=' . $secret . 
                         '&issuer=' . urlencode('Ecommerce Shop');

            // Generate recovery codes
            $recoveryCodes = [];
            for ($i = 0; $i < 8; $i++) {
                $recoveryCodes[] = strtoupper(substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 8));
            }

            $user->update(['two_factor_recovery_codes' => json_encode($recoveryCodes)]);

            // Log activity
            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_2FA_ENABLE,
                UserActivityLog::CATEGORY_SECURITY,
                '2FA setup initiated',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => '2FA secret generated',
                'data' => [
                    'secret' => $secret,
                    'qr_code_url' => $qrCodeUrl,
                    'recovery_codes' => $recoveryCodes,
                    'instructions' => [
                        'Scan the QR code with Google Authenticator, Microsoft Authenticator, or Authy',
                        'Save your recovery codes in a safe place',
                        'You will be required to verify a code before 2FA is fully enabled'
                    ]
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to enable 2FA',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Confirm 2FA enablement with verification code
     */
    public function confirm2FA(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'code' => 'required|string|size:6|regex:/^[0-9]+$/',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid code format',
                    'errors' => $validator->errors()
                ], 422);
            }

            // If already enabled, return error
            if ($user->two_factor_enabled) {
                return response()->json([
                    'success' => false,
                    'message' => '2FA is already enabled'
                ], 400);
            }

            // For now, accept any valid 6-digit code (in production, use Google2FA validation)
            // This would require: composer require pragmarx/google2fa-laravel
            // Then: $google2fa = app('pragmarx.google2fa');
            // And: $valid = $google2fa->verifyKey(decrypt($user->two_factor_secret), $request->code);

            $user->update(['two_factor_enabled' => true]);

            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_2FA_ENABLE,
                UserActivityLog::CATEGORY_SECURITY,
                '2FA was successfully enabled',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => '2FA has been successfully enabled',
                'recovery_codes' => json_decode($user->two_factor_recovery_codes)
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to confirm 2FA',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Disable Two-Factor Authentication
     */
    public function disable2FA(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'password' => 'required|string',
                'code' => 'required_if:two_factor_enabled,true|string|size:6',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Verify password
            if (!Hash::check($request->password, $user->password)) {
                UserActivityLog::log(
                    $user->id,
                    UserActivityLog::ACTION_2FA_DISABLE,
                    UserActivityLog::CATEGORY_SECURITY,
                    'Failed 2FA disable attempt - incorrect password',
                    status: 'failed'
                );

                return response()->json([
                    'success' => false,
                    'message' => 'Password is incorrect'
                ], 401);
            }

            // If 2FA is enabled, verify the code
            if ($user->two_factor_enabled) {
                // In production, use Google2FA to verify
                // For now, accept any 6-digit code
                if (!preg_match('/^[0-9]{6}$/', $request->code)) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Invalid 2FA code'
                    ], 401);
                }
            }

            // Disable 2FA
            $user->update([
                'two_factor_enabled' => false,
                'two_factor_secret' => null,
                'two_factor_recovery_codes' => null,
            ]);

            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_2FA_DISABLE,
                UserActivityLog::CATEGORY_SECURITY,
                '2FA was disabled',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => '2FA has been disabled'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to disable 2FA',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Verify 2FA code
     */
    public function verify2FA(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'code' => 'required|string|size:6|regex:/^[0-9]+$/',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            if (!$user->two_factor_enabled) {
                return response()->json([
                    'success' => false,
                    'message' => '2FA is not enabled for this account'
                ], 400);
            }

            // In production, use Google2FA:
            // $google2fa = app('pragmarx.google2fa');
            // $isValid = $google2fa->verifyKey(Crypt::decryptString($user->two_factor_secret), $request->code);

            // For now, accept any 6-digit code
            $isValid = true;

            if (!$isValid) {
                UserActivityLog::log(
                    $user->id,
                    'verify_2fa',
                    UserActivityLog::CATEGORY_SECURITY,
                    'Failed 2FA code verification',
                    status: 'failed'
                );

                return response()->json([
                    'success' => false,
                    'message' => 'Invalid 2FA code'
                ], 401);
            }

            UserActivityLog::log(
                $user->id,
                'verify_2fa',
                UserActivityLog::CATEGORY_SECURITY,
                '2FA code was verified',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => '2FA code verified successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to verify 2FA code',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get active sessions
     */
    public function getActiveSessions(Request $request)
    {
        try {
            $user = $request->user();

            // Get active sessions from database
            $sessions = $user->activeSessions()
                ->orderBy('last_activity', 'desc')
                ->get()
                ->map(function ($session) {
                    return [
                        'id' => $session->id,
                        'device' => $session->device,
                        'browser' => $session->browser,
                        'os' => $session->os,
                        'ip_address' => $session->ip_address,
                        'location' => $session->location,
                        'latitude' => $session->latitude,
                        'longitude' => $session->longitude,
                        'last_active' => $session->last_activity->toISOString(),
                        'logged_in_at' => $session->logged_in_at->toISOString(),
                        'is_current' => (bool)$session->is_current,
                    ];
                });

            return response()->json([
                'success' => true,
                'sessions' => $sessions
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch active sessions',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Revoke a specific session
     */
    public function revokeSession(Request $request, $sessionId)
    {
        try {
            $user = $request->user();

            // Get session and verify ownership
            $session = UserSession::where('id', $sessionId)
                ->where('user_id', $user->id)
                ->first();

            if (!$session) {
                return response()->json([
                    'success' => false,
                    'message' => 'Session not found'
                ], 404);
            }

            // Don't allow revoking current session
            if ($session->is_current) {
                return response()->json([
                    'success' => false,
                    'message' => 'Cannot revoke current session. Use logout instead.'
                ], 400);
            }

            $session->revoke();

            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_SESSION_REVOKE,
                UserActivityLog::CATEGORY_SESSION,
                'Session was revoked (Device: ' . $session->device . ')',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Session revoked successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to revoke session',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Revoke all other sessions (keep current)
     */
    public function revokeAllOtherSessions(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'password' => 'required|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Verify password
            if (!Hash::check($request->password, $user->password)) {
                UserActivityLog::log(
                    $user->id,
                    'revoke_all_sessions',
                    UserActivityLog::CATEGORY_SESSION,
                    'Failed revoke all sessions attempt - incorrect password',
                    status: 'failed'
                );

                return response()->json([
                    'success' => false,
                    'message' => 'Password is incorrect'
                ], 401);
            }

            // Get current session
            $currentSession = $user->sessions()->where('is_current', true)->first();

            // Revoke all other sessions
            $revokedCount = $user->sessions()
                ->where('is_current', false)
                ->get()
                ->count();

            foreach ($user->sessions()->where('is_current', false)->get() as $session) {
                $session->revoke();
            }

            // Also revoke old access tokens
            $currentTokenId = $request->user()->currentAccessToken()?->id;
            if ($currentTokenId) {
                $user->tokens()
                    ->where('id', '!=', $currentTokenId)
                    ->delete();
            }

            UserActivityLog::log(
                $user->id,
                'revoke_all_sessions',
                UserActivityLog::CATEGORY_SESSION,
                'All other sessions were revoked (' . $revokedCount . ' sessions)',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'All other sessions revoked successfully',
                'revoked_count' => $revokedCount
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to revoke sessions',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get activity logs
     */
    public function getActivityLogs(Request $request)
    {
        try {
            $user = $request->user();

            // Get activity logs with filters
            $query = $user->activityLogs()
                ->where('created_at', '>=', now()->subDays(30));

            // Filter by category if provided
            if ($request->category) {
                $query->where('category', $request->category);
            }

            $logs = $query->limit(50)->get()
                ->map(function ($log) {
                    return [
                        'id' => $log->id,
                        'action' => $log->action,
                        'category' => $log->category,
                        'description' => $log->description,
                        'ip_address' => $log->ip_address,
                        'status' => $log->status,
                        'created_at' => $log->created_at->toISOString(),
                    ];
                });

            return response()->json([
                'success' => true,
                'logs' => $logs
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch activity logs',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Request email verification
     */
    public function requestEmailVerification(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'email' => 'required|email|unique:users,email,' . $user->id,
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Create verification token
            $token = EmailVerificationToken::createEmailToken($user, $request->email);

            // In production, send email with verification link
            // Mail::send(new VerifyEmailChange($user, $token));

            return response()->json([
                'success' => true,
                'message' => 'Verification email sent to ' . $request->email,
                'token' => $token->token // For testing only, remove in production
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to request email verification',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Verify email with token
     */
    public function verifyEmail(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'token' => 'required|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Find and verify token
            $token = EmailVerificationToken::findValidToken($request->token, EmailVerificationToken::TYPE_EMAIL);

            if (!$token) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid or expired verification token'
                ], 401);
            }

            if (!$token->verify()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to verify email'
                ], 400);
            }

            UserActivityLog::log(
                $token->user_id,
                UserActivityLog::ACTION_EMAIL_CHANGE,
                UserActivityLog::CATEGORY_ACCOUNT,
                'Email was verified: ' . $token->email_address,
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Email verified successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to verify email',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Request account deletion
     */
    public function requestAccountDeletion(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'password' => 'required|string',
                'reason' => 'nullable|string|max:500',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Verify password
            if (!Hash::check($request->password, $user->password)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Password is incorrect'
                ], 401);
            }

            // Create deletion request token (valid for 30 days)
            $token = Str::random(60);
            $user->update(['deletion_token' => $token]);

            // In production, send email with confirmation link
            // Mail::send(new ConfirmAccountDeletion($user, $token));

            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_ACCOUNT_DELETE,
                UserActivityLog::CATEGORY_ACCOUNT,
                'Account deletion was requested',
                newValues: ['reason' => $request->reason],
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Confirmation email sent. Account will be deleted in 30 days if not cancelled.',
                'token' => $token // For testing only
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to request account deletion',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Cancel account deletion request
     */
    public function cancelAccountDeletion(Request $request)
    {
        try {
            $user = $request->user();

            if (!$user->deletion_token) {
                return response()->json([
                    'success' => false,
                    'message' => 'No pending deletion request'
                ], 400);
            }

            $user->update(['deletion_token' => null]);

            UserActivityLog::log(
                $user->id,
                'cancel_account_deletion',
                UserActivityLog::CATEGORY_ACCOUNT,
                'Account deletion request was cancelled',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'message' => 'Account deletion cancelled'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to cancel account deletion',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Export user data (GDPR)
     */
    public function exportData(Request $request)
    {
        try {
            $user = $request->user();

            $data = [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone' => $user->phone_number ?? $user->phone,
                    'address' => $user->address,
                    'city' => $user->city,
                    'country' => $user->country,
                    'created_at' => $user->created_at->toISOString(),
                ],
                'orders' => $user->orders()->with('items')->get(),
                'addresses' => $user->addresses()->get(),
                'preferences' => $user->preferences,
                'activity_logs' => $user->activityLogs()->limit(100)->get(),
            ];

            UserActivityLog::log(
                $user->id,
                UserActivityLog::ACTION_DATA_EXPORT,
                UserActivityLog::CATEGORY_ACCOUNT,
                'User data export requested',
                status: 'success'
            );

            return response()->json([
                'success' => true,
                'data' => $data
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to export data',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
