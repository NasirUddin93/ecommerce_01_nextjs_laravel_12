<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserActivityLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'action',
        'category',
        'description',
        'ip_address',
        'user_agent',
        'old_values',
        'new_values',
        'status',
    ];

    protected $casts = [
        'old_values' => 'json',
        'new_values' => 'json',
        'created_at' => 'datetime',
    ];

    // Activity action constants
    const ACTION_LOGIN = 'login';
    const ACTION_LOGOUT = 'logout';
    const ACTION_FAILED_LOGIN = 'failed_login';
    const ACTION_PROFILE_UPDATE = 'profile_update';
    const ACTION_PASSWORD_CHANGE = 'password_change';
    const ACTION_EMAIL_CHANGE = 'email_change';
    const ACTION_2FA_ENABLE = '2fa_enable';
    const ACTION_2FA_DISABLE = '2fa_disable';
    const ACTION_PAYMENT_METHOD_ADD = 'payment_method_add';
    const ACTION_PAYMENT_METHOD_DELETE = 'payment_method_delete';
    const ACTION_SESSION_REVOKE = 'session_revoke';
    const ACTION_ACCOUNT_DELETE = 'account_delete';
    const ACTION_DATA_EXPORT = 'data_export';
    const ACTION_PERMISSION_CHANGE = 'permission_change';

    // Activity category constants
    const CATEGORY_SECURITY = 'security';
    const CATEGORY_ACCOUNT = 'account';
    const CATEGORY_PAYMENT = 'payment';
    const CATEGORY_ORDER = 'order';
    const CATEGORY_PROFILE = 'profile';
    const CATEGORY_SESSION = 'session';
    const CATEGORY_NOTIFICATION = 'notification';

    /**
     * Get the user this activity log belongs to
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Create an activity log entry
     */
    public static function log(
        int $userId,
        string $action,
        string $category,
        string $description,
        string $ipAddress = null,
        string $userAgent = null,
        array $oldValues = null,
        array $newValues = null,
        string $status = 'success'
    ): self {
        return self::create([
            'user_id' => $userId,
            'action' => $action,
            'category' => $category,
            'description' => $description,
            'ip_address' => $ipAddress ?? request()->ip(),
            'user_agent' => $userAgent ?? request()->userAgent(),
            'old_values' => $oldValues,
            'new_values' => $newValues,
            'status' => $status,
        ]);
    }

    /**
     * Scope to filter by action
     */
    public function scopeByAction($query, string $action)
    {
        return $query->where('action', $action);
    }

    /**
     * Scope to filter by category
     */
    public function scopeByCategory($query, string $category)
    {
        return $query->where('category', $category);
    }

    /**
     * Scope to filter by status
     */
    public function scopeByStatus($query, string $status)
    {
        return $query->where('status', $status);
    }

    /**
     * Get recent activities (last 30 days)
     */
    public function scopeRecent($query)
    {
        return $query->where('created_at', '>=', now()->subDays(30))
            ->orderBy('created_at', 'desc');
    }
}
