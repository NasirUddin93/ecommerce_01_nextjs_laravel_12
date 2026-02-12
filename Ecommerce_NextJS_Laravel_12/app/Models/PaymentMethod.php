<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'type',
        'payment_gateway',
        'gateway_token',
        'card_brand',
        'last_four',
        'cardholder_name',
        'expiry_month',
        'expiry_year',
        'is_default',
        'is_active',
        'fingerprint',
    ];

    protected $casts = [
        'is_default' => 'boolean',
        'is_active' => 'boolean',
    ];

    /**
     * Get the user this payment method belongs to
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Scope to get only active payment methods
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope to get the default payment method
     */
    public function scopeDefault($query)
    {
        return $query->where('is_default', true)->first();
    }

    /**
     * Set this payment method as default for the user
     * Unsets all other defaults for this user
     */
    public function setAsDefault()
    {
        PaymentMethod::where('user_id', $this->user_id)
            ->where('id', '!=', $this->id)
            ->update(['is_default' => false]);

        $this->update(['is_default' => true]);
    }

    /**
     * Check if payment method is expired
     */
    public function isExpired(): bool
    {
        $now = now();
        $expiryDate = \Carbon\Carbon::createFromDate(
            $now->year,
            (int)$this->expiry_month,
            1
        )->endOfMonth();

        return $now->greaterThan($expiryDate);
    }

    /**
     * Get masked card number (for display)
     */
    public function getMaskedCardAttribute(): string
    {
        return '**** **** **** ' . $this->last_four;
    }

    /**
     * Get expiry date formatted
     */
    public function getExpiryFormattedAttribute(): string
    {
        return str_pad($this->expiry_month, 2, '0', STR_PAD_LEFT) . '/' . substr($this->expiry_year, -2);
    }
}
