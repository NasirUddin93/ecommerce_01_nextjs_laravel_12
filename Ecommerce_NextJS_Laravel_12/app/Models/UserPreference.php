<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPreference extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'email_notifications',
        'sms_notifications',
        'push_notifications',
        'order_updates',
        'promotions',
        'marketing_emails',
        'newsletter',
    ];

    protected $casts = [
        'email_notifications' => 'boolean',
        'sms_notifications' => 'boolean',
        'push_notifications' => 'boolean',
        'order_updates' => 'boolean',
        'promotions' => 'boolean',
        'marketing_emails' => 'boolean',
        'newsletter' => 'boolean',
    ];

    /**
     * Get the user this preference belongs to
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
