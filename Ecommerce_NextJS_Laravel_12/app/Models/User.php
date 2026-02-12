<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'phone',
        'phone_number',
        'profile_image',
        'profile_photo_path',
        'address',
        'city',
        'district',
        'postal_code',
        'country',
        'date_of_birth',
        'gender',
        'notes',
        'two_factor_secret',
        'two_factor_recovery_codes',
        'two_factor_enabled',
        'is_active',
        'email_verified_at',
        'phone_verified_at',
        'deletion_token',
        'deletion_requested_at',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_secret',
        'two_factor_recovery_codes',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'phone_verified_at' => 'datetime',
            'password' => 'hashed',
            'two_factor_enabled' => 'boolean',
            'is_active' => 'boolean',
            'two_factor_recovery_codes' => 'json',
        ];
    }

    // Relationships
    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function addresses()
    {
        return $this->hasMany(CustomerAddress::class);
    }

    public function defaultAddress()
    {
        return $this->hasOne(CustomerAddress::class)->where('is_default', true);
    }

    /**
     * Get user preference (notification settings)
     */
    public function preferences()
    {
        return $this->hasOne(UserPreference::class);
    }

    /**
     * Get all payment methods
     */
    public function paymentMethods()
    {
        return $this->hasMany(PaymentMethod::class);
    }

    /**
     * Get default payment method
     */
    public function defaultPaymentMethod()
    {
        return $this->hasOne(PaymentMethod::class)->where('is_default', true)->where('is_active', true);
    }

    /**
     * Get user sessions
     */
    public function sessions()
    {
        return $this->hasMany(UserSession::class);
    }

    /**
     * Get current/active sessions
     */
    public function activeSessions()
    {
        return $this->hasMany(UserSession::class)->where('expires_at', '>', now());
    }

    /**
     * Get user activity logs
     */
    public function activityLogs()
    {
        return $this->hasMany(UserActivityLog::class)->orderBy('created_at', 'desc');
    }

    /**
     * Get email verification tokens
     */
    public function verificationTokens()
    {
        return $this->hasMany(EmailVerificationToken::class);
    }
}
