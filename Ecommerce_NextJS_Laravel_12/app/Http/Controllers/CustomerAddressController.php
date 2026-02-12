<?php

namespace App\Http\Controllers;

use App\Models\CustomerAddress;
use Illuminate\Http\Request;

class CustomerAddressController extends Controller
{
    // Get all customer addresses
    public function index(Request $request)
    {
        $query = CustomerAddress::with(['user', 'bangladeshiArea.district.division']);

        if ($request->has('user_id')) {
            $query->where('user_id', $request->get('user_id'));
        }

        if ($request->has('is_active')) {
            $query->where('is_active', $request->get('is_active'));
        }

        $addresses = $query->get();

        return response()->json([
            'data' => $addresses,
            'status' => 200,
            'message' => 'Customer addresses retrieved successfully'
        ], 200);
    }

    // Show a single customer address
    public function show($id)
    {
        $address = CustomerAddress::with(['user', 'bangladeshiArea.district.division'])->findOrFail($id);

        return response()->json([
            'data' => $address,
            'status' => 200,
            'message' => 'Customer address retrieved successfully'
        ], 200);
    }

    // Store new customer address
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'recipient_name' => 'required|string|max:100',
            'phone' => 'required|string|max:20',
            'address_line_1' => 'required|string|max:255',
            'address_line_2' => 'nullable|string|max:255',
            'city' => 'required|string|max:100',
            'district' => 'required|string|max:100',
            'area' => 'required|string|max:100',
            'postal_code' => 'nullable|string|max:20',
            'country' => 'required|string|max:100',
            'address_label' => 'required|string|in:Home,Office,Other',
            'is_default' => 'required|boolean',
            'is_active' => 'required|boolean',
            'bangladeshi_area_id' => 'nullable|exists:bangladeshi_areas,id',
        ]);

        $address = CustomerAddress::create($validated);

        return response()->json([
            'data' => $address,
            'status' => 201,
            'message' => 'Customer address created successfully'
        ], 201);
    }

    // Update existing customer address
    public function update(Request $request, $id)
    {
        $address = CustomerAddress::findOrFail($id);

        $validated = $request->validate([
            'user_id' => 'sometimes|exists:users,id',
            'recipient_name' => 'sometimes|string|max:100',
            'phone' => 'sometimes|string|max:20',
            'address_line_1' => 'sometimes|string|max:255',
            'address_line_2' => 'nullable|string|max:255',
            'city' => 'sometimes|string|max:100',
            'district' => 'sometimes|string|max:100',
            'area' => 'sometimes|string|max:100',
            'postal_code' => 'nullable|string|max:20',
            'country' => 'sometimes|string|max:100',
            'address_label' => 'sometimes|string|in:Home,Office,Other',
            'is_default' => 'sometimes|boolean',
            'is_active' => 'sometimes|boolean',
            'bangladeshi_area_id' => 'nullable|exists:bangladeshi_areas,id',
        ]);

        $address->update($validated);

        return response()->json([
            'data' => $address,
            'status' => 200,
            'message' => 'Customer address updated successfully'
        ], 200);
    }

    // Delete customer address
    public function destroy($id)
    {
        $address = CustomerAddress::findOrFail($id);
        $address->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Customer address deleted successfully'
        ], 200);
    }
}
