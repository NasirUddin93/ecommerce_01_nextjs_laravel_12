<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSession extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'token_id',
        'device',
        'browser',
        'os',
        'ip_address',
        'location',
        'latitude',
        'longitude',
        'last_activity',
        'logged_in_at',
        'expires_at',
        'is_current',
        'user_agent',
    ];

    protected $casts = [
        'is_current' => 'boolean',
        'last_activity' => 'datetime',
        'logged_in_at' => 'datetime',
        'expires_at' => 'datetime',
    ];

    /**
     * Get the user this session belongs to
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Scope to get active sessions only
     */
    public function scopeActive($query)
    {
        return $query->where('expires_at', '>', now());
    }

    /**
     * Scope to get current (primary) session
     */
    public function scopeCurrent($query)
    {
        return $query->where('is_current', true);
    }

    /**
     * Get time since last activity
     */
    public function getTimeSinceLastActivityAttribute(): string
    {
        return $this->last_activity->diffForHumans();
    }

    /**
     * Check if session is expired
     */
    public function isExpired(): bool
    {
        return $this->expires_at->isPast();
    }

    /**
     * Mark session as inactive and revoke
     */
    public function revoke()
    {
        $this->update([
            'is_current' => false,
            'expires_at' => now(),
        ]);
    }

    /**
     * Update last activity timestamp
     */
    public function updateActivity()
    {
        $this->update(['last_activity' => now()]);
    }
}
