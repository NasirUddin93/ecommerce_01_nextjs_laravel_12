<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BangladeshiDivision extends Model
{
    protected $table = 'bangladeshi_divisions';

    protected $fillable = [
        'name',
        'code',
        'description',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Relationships
    public function districts()
    {
        return $this->hasMany(BangladeshiDistrict::class, 'division_id');
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
