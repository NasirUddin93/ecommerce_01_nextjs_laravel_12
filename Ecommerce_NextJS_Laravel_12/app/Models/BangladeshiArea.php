<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BangladeshiArea extends Model
{
    protected $table = 'bangladeshi_areas';

    protected $fillable = [
        'district_id',
        'name',
        'thana_name',
        'code',
        'description',
        'delivery_charge_base',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'delivery_charge_base' => 'decimal:2',
    ];

    // Relationships
    public function district()
    {
        return $this->belongsTo(BangladeshiDistrict::class, 'district_id');
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeByDistrict($query, $districtId)
    {
        return $query->where('district_id', $districtId);
    }
}
