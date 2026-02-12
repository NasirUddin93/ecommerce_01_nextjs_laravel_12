<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class EmailVerificationToken extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'token',
        'type',
        'email_address',
        'phone_number',
        'expires_at',
        'verified_at',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
        'verified_at' => 'datetime',
        'created_at' => 'datetime',
    ];

    // Token type constants
    const TYPE_EMAIL = 'email';
    const TYPE_PHONE = 'phone';

    /**
     * Get the user this token belongs to
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Create a new verification token for email
     */
    public static function createEmailToken(User $user, string $emailAddress): self
    {
        // Invalidate previous email tokens for this user
        self::where('user_id', $user->id)
            ->where('type', self::TYPE_EMAIL)
            ->whereNull('verified_at')
            ->delete();

        return self::create([
            'user_id' => $user->id,
            'token' => Str::random(60),
            'type' => self::TYPE_EMAIL,
            'email_address' => $emailAddress,
            'expires_at' => now()->addHours(24),
        ]);
    }

    /**
     * Create a new verification token for phone
     */
    public static function createPhoneToken(User $user, string $phoneNumber): self
    {
        // Invalidate previous phone tokens for this user
        self::where('user_id', $user->id)
            ->where('type', self::TYPE_PHONE)
            ->whereNull('verified_at')
            ->delete();

        return self::create([
            'user_id' => $user->id,
            'token' => Str::random(60),
            'type' => self::TYPE_PHONE,
            'phone_number' => $phoneNumber,
            'expires_at' => now()->addHours(1), // SMS tokens expire faster
        ]);
    }

    /**
     * Find token by token string and type
     */
    public static function findValidToken(string $token, string $type): ?self
    {
        return self::where('token', $token)
            ->where('type', $type)
            ->whereNull('verified_at')
            ->where('expires_at', '>', now())
            ->first();
    }

    /**
     * Mark token as verified
     */
    public function verify(): bool
    {
        if ($this->isExpired() || $this->isVerified()) {
            return false;
        }

        $this->update(['verified_at' => now()]);

        // Update user email or phone verification status
        if ($this->type === self::TYPE_EMAIL) {
            $this->user->update([
                'email' => $this->email_address,
                'email_verified_at' => now(),
            ]);
        } elseif ($this->type === self::TYPE_PHONE) {
            $this->user->update([
                'phone_number' => $this->phone_number,
                'phone_verified_at' => now(),
            ]);
        }

        return true;
    }

    /**
     * Check if token is expired
     */
    public function isExpired(): bool
    {
        return $this->expires_at->isPast();
    }

    /**
     * Check if token is already verified
     */
    public function isVerified(): bool
    {
        return $this->verified_at !== null;
    }

    /**
     * Get human-readable time until expiry
     */
    public function expiresIn(): string
    {
        if ($this->isExpired()) {
            return 'Expired';
        }

        return $this->expires_at->diffForHumans();
    }

    /**
     * Scope to get only unexpired tokens
     */
    public function scopeValid($query)
    {
        return $query->whereNull('verified_at')
            ->where('expires_at', '>', now());
    }

    /**
     * Scope to get only verified tokens
     */
    public function scopeVerified($query)
    {
        return $query->whereNotNull('verified_at');
    }
}
