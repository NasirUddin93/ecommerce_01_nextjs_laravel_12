<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Shipping;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShippingController extends Controller
{
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $shippings = Shipping::latest()->paginate($perPage, ['*'], 'page', $page);

        return response()->json([
            'status' => 200,
            'data'   => $shippings->items(),
            'pagination' => [
                'total' => $shippings->total(),
                'per_page' => $shippings->perPage(),
                'current_page' => $shippings->currentPage(),
                'last_page' => $shippings->lastPage(),
                'from' => $shippings->firstItem(),
                'to' => $shippings->lastItem(),
            ]
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'             => 'required|string|max:255',
            'description'      => 'nullable|string',
            'fee'              => 'required|numeric|between:0,99999999.99',
            'is_free_shipping' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shipping = Shipping::create($validator->validated());

        return response()->json([
            'status'  => 201,
            'message' => 'Shipping created successfully',
            'data'    => $shipping,
        ], 201);
    }

    public function show($id)
    {
        $shipping = Shipping::find($id);

        if (!$shipping) {
            return response()->json([
                'status'  => 404,
                'message' => 'Shipping not found',
            ], 404);
        }

        return response()->json([
            'status' => 200,
            'data'   => $shipping,
        ]);
    }

    public function update(Request $request, $id)
    {
        $shipping = Shipping::find($id);

        if (!$shipping) {
            return response()->json([
                'status'  => 404,
                'message' => 'Shipping not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'name'             => 'sometimes|required|string|max:255',
            'description'      => 'sometimes|nullable|string',
            'fee'              => 'sometimes|required|numeric|between:0,99999999.99',
            'is_free_shipping' => 'sometimes|required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shipping->update($validator->validated());

        return response()->json([
            'status'  => 200,
            'message' => 'Shipping updated successfully',
            'data'    => $shipping,
        ]);
    }
}
