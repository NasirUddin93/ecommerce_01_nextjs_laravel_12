<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DeliveryZone extends Model
{
    use SoftDeletes;

    protected $table = 'delivery_zones';

    protected $fillable = [
        'zone_name',
        'description',
        'area_code',
        'districts',
        'areas',
        'standard_delivery_charge',
        'express_delivery_charge',
        'standard_delivery_days',
        'express_delivery_days',
        'free_delivery_min_amount',
        'is_active',
        'priority',
    ];

    protected $casts = [
        'districts' => 'array',
        'areas' => 'array',
        'standard_delivery_charge' => 'decimal:2',
        'express_delivery_charge' => 'decimal:2',
        'free_delivery_min_amount' => 'decimal:2',
        'is_active' => 'boolean',
    ];

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true)->orderBy('priority', 'desc');
    }

    public function scopeForArea($query, $area)
    {
        return $query->where('is_active', true)
            ->whereJsonContains('areas', $area);
    }

    public function scopeForDistrict($query, $district)
    {
        return $query->where('is_active', true)
            ->whereJsonContains('districts', $district);
    }

    public static function findForLocation(?string $district, ?string $area): ?self
    {
        $query = self::active();

        if ($area) {
            $zone = (clone $query)->whereJsonContains('areas', $area)->first();
            if ($zone) {
                return $zone;
            }
        }

        if ($district) {
            $zone = (clone $query)->whereJsonContains('districts', $district)->first();
            if ($zone) {
                return $zone;
            }
        }

        return $query->first();
    }
}
