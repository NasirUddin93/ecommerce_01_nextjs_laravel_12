<?php

namespace App\Http\Controllers;

use App\Models\BangladeshiDivision;
use App\Models\BangladeshiDistrict;
use App\Models\BangladeshiArea;
use Illuminate\Http\Request;

class BangladeshLocationController extends Controller
{
    // Get all divisions
    public function getDivisions(Request $request)
    {
        $divisions = BangladeshiDivision::when($request->has('status'), function ($query) {
            return $query->where('is_active', $request->get('status'));
        })->get();

        return response()->json([
            'data' => $divisions,
            'status' => 200,
            'message' => 'Divisions retrieved successfully'
        ], 200);
    }

    // Get districts by division
    public function getDistricts(Request $request)
    {
        $query = BangladeshiDistrict::with('division');

        if ($request->has('division_id')) {
            $query->where('division_id', $request->get('division_id'));
        }

        if ($request->has('status')) {
            $query->where('is_active', $request->get('status'));
        }

        $districts = $query->get();

        return response()->json([
            'data' => $districts,
            'status' => 200,
            'message' => 'Districts retrieved successfully'
        ], 200);
    }

    // Get areas by district
    public function getAreas(Request $request)
    {
        $query = BangladeshiArea::with('district');

        if ($request->has('district_id')) {
            $query->where('district_id', $request->get('district_id'));
        }

        if ($request->has('status')) {
            $query->where('is_active', $request->get('status'));
        }

        $areas = $query->get();

        return response()->json([
            'data' => $areas,
            'status' => 200,
            'message' => 'Areas retrieved successfully'
        ], 200);
    }

    // Show single division
    public function showDivision($id)
    {
        $division = BangladeshiDivision::findOrFail($id);

        return response()->json([
            'data' => $division,
            'status' => 200,
            'message' => 'Division retrieved successfully'
        ], 200);
    }

    // Show single district
    public function showDistrict($id)
    {
        $district = BangladeshiDistrict::with('division')->findOrFail($id);

        return response()->json([
            'data' => $district,
            'status' => 200,
            'message' => 'District retrieved successfully'
        ], 200);
    }

    // Show single area
    public function showArea($id)
    {
        $area = BangladeshiArea::with('district')->findOrFail($id);

        return response()->json([
            'data' => $area,
            'status' => 200,
            'message' => 'Area retrieved successfully'
        ], 200);
    }

    // Store new division
    public function storeDivision(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100|unique:bangladeshi_divisions',
            'code' => 'required|string|max:10|unique:bangladeshi_divisions',
            'is_active' => 'required|boolean',
        ]);

        $division = BangladeshiDivision::create($validated);

        return response()->json([
            'data' => $division,
            'status' => 201,
            'message' => 'Division created successfully'
        ], 201);
    }

    // Store new district
    public function storeDistrict(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100|unique:bangladeshi_districts',
            'code' => 'required|string|max:10|unique:bangladeshi_districts',
            'division_id' => 'required|exists:bangladeshi_divisions,id',
            'is_active' => 'required|boolean',
        ]);

        $district = BangladeshiDistrict::create($validated);

        return response()->json([
            'data' => $district,
            'status' => 201,
            'message' => 'District created successfully'
        ], 201);
    }

    // Store new area
    public function storeArea(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100',
            'thana' => 'required|string|max:100',
            'code' => 'required|string|max:10|unique:bangladeshi_areas',
            'district_id' => 'required|exists:bangladeshi_districts,id',
            'delivery_charge' => 'nullable|numeric|min:0',
            'is_active' => 'required|boolean',
        ]);

        $area = BangladeshiArea::create($validated);

        return response()->json([
            'data' => $area,
            'status' => 201,
            'message' => 'Area created successfully'
        ], 201);
    }

    // Update division
    public function updateDivision(Request $request, $id)
    {
        $division = BangladeshiDivision::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|string|max:100|unique:bangladeshi_divisions,name,' . $id,
            'code' => 'sometimes|string|max:10|unique:bangladeshi_divisions,code,' . $id,
            'is_active' => 'sometimes|boolean',
        ]);

        $division->update($validated);

        return response()->json([
            'data' => $division,
            'status' => 200,
            'message' => 'Division updated successfully'
        ], 200);
    }

    // Update district
    public function updateDistrict(Request $request, $id)
    {
        $district = BangladeshiDistrict::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|string|max:100|unique:bangladeshi_districts,name,' . $id,
            'code' => 'sometimes|string|max:10|unique:bangladeshi_districts,code,' . $id,
            'division_id' => 'sometimes|exists:bangladeshi_divisions,id',
            'is_active' => 'sometimes|boolean',
        ]);

        $district->update($validated);

        return response()->json([
            'data' => $district,
            'status' => 200,
            'message' => 'District updated successfully'
        ], 200);
    }

    // Update area
    public function updateArea(Request $request, $id)
    {
        $area = BangladeshiArea::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|string|max:100',
            'thana' => 'sometimes|string|max:100',
            'code' => 'sometimes|string|max:10|unique:bangladeshi_areas,code,' . $id,
            'district_id' => 'sometimes|exists:bangladeshi_districts,id',
            'delivery_charge' => 'nullable|numeric|min:0',
            'is_active' => 'sometimes|boolean',
        ]);

        $area->update($validated);

        return response()->json([
            'data' => $area,
            'status' => 200,
            'message' => 'Area updated successfully'
        ], 200);
    }

    // Delete division
    public function destroyDivision($id)
    {
        $division = BangladeshiDivision::findOrFail($id);
        $division->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Division deleted successfully'
        ], 200);
    }

    // Delete district
    public function destroyDistrict($id)
    {
        $district = BangladeshiDistrict::findOrFail($id);
        $district->delete();

        return response()->json([
            'status' => 200,
            'message' => 'District deleted successfully'
        ], 200);
    }

    // Delete area
    public function destroyArea($id)
    {
        $area = BangladeshiArea::findOrFail($id);
        $area->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Area deleted successfully'
        ], 200);
    }
}
