<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SettingHistory extends Model
{
    use HasFactory;

    protected $table = 'settings_history';
    
    public $timestamps = false;

    protected $fillable = [
        'setting_id',
        'key',
        'old_value',
        'new_value',
        'changed_by',
        'change_type',
        'change_reason',
        'changed_at'
    ];

    protected $casts = [
        'changed_at' => 'datetime'
    ];

    /**
     * Get the setting this history belongs to
     */
    public function setting()
    {
        return $this->belongsTo(Setting::class, 'setting_id');
    }

    /**
     * Get the user who made the change
     */
    public function changedBy()
    {
        return $this->belongsTo(User::class, 'changed_by');
    }
}
