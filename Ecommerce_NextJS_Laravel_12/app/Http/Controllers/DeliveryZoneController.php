<?php

namespace App\Http\Controllers;

use App\Models\DeliveryZone;
use Illuminate\Http\Request;

class DeliveryZoneController extends Controller
{
    // Get all delivery zones
    public function index()
    {
        $zones = DeliveryZone::all();

        return response()->json([
            'data' => $zones,
            'status' => 200,
            'message' => 'Delivery zones retrieved successfully'
        ], 200);
    }

    // Show a single delivery zone
    public function show($id)
    {
        $zone = DeliveryZone::findOrFail($id);

        return response()->json([
            'data' => $zone,
            'status' => 200,
            'message' => 'Delivery zone retrieved successfully'
        ], 200);
    }

    // Store new delivery zone
    public function store(Request $request)
    {
        $validated = $request->validate([
            'zone_name' => 'required|string|max:100|unique:delivery_zones',
            'description' => 'nullable|string|max:500',
            'area_code' => 'nullable|string|max:50',
            'districts' => 'nullable|array',
            'standard_delivery_charge' => 'required|numeric|min:0',
            'express_delivery_charge' => 'nullable|numeric|min:0',
            'standard_delivery_days' => 'required|integer|min:1',
            'express_delivery_days' => 'nullable|integer|min:1',
            'free_delivery_min_amount' => 'nullable|numeric|min:0',
            'priority' => 'required|integer|min:0|max:100',
            'is_active' => 'required|boolean',
        ]);

        $zone = DeliveryZone::create($validated);

        return response()->json([
            'data' => $zone,
            'status' => 201,
            'message' => 'Delivery zone created successfully'
        ], 201);
    }

    // Update existing delivery zone
    public function update(Request $request, $id)
    {
        $zone = DeliveryZone::findOrFail($id);

        $validated = $request->validate([
            'zone_name' => 'sometimes|string|max:100|unique:delivery_zones,zone_name,' . $id,
            'description' => 'nullable|string|max:500',
            'area_code' => 'nullable|string|max:50',
            'districts' => 'nullable|array',
            'standard_delivery_charge' => 'sometimes|numeric|min:0',
            'express_delivery_charge' => 'nullable|numeric|min:0',
            'standard_delivery_days' => 'sometimes|integer|min:1',
            'express_delivery_days' => 'nullable|integer|min:1',
            'free_delivery_min_amount' => 'nullable|numeric|min:0',
            'priority' => 'sometimes|integer|min:0|max:100',
            'is_active' => 'sometimes|boolean',
        ]);

        $zone->update($validated);

        return response()->json([
            'data' => $zone,
            'status' => 200,
            'message' => 'Delivery zone updated successfully'
        ], 200);
    }

    // Delete delivery zone
    public function destroy($id)
    {
        $zone = DeliveryZone::findOrFail($id);
        $zone->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Delivery zone deleted successfully'
        ], 200);
    }
}
