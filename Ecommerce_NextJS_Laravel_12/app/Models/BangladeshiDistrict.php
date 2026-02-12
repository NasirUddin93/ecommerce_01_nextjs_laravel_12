<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BangladeshiDistrict extends Model
{
    protected $table = 'bangladeshi_districts';

    protected $fillable = [
        'division_id',
        'name',
        'code',
        'description',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Relationships
    public function division()
    {
        return $this->belongsTo(BangladeshiDivision::class, 'division_id');
    }

    public function areas()
    {
        return $this->hasMany(BangladeshiArea::class, 'district_id');
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeByDivision($query, $divisionId)
    {
        return $query->where('division_id', $divisionId);
    }
}
