<?php

namespace App\Http\Controllers;

use App\Models\OrderStatusHistory;
use Illuminate\Http\Request;

class OrderStatusHistoryController extends Controller
{
    // Get all order status histories
    public function index(Request $request)
    {
        $query = OrderStatusHistory::with(['order']);

        if ($request->has('order_id')) {
            $query->where('order_id', $request->get('order_id'));
        }

        if ($request->has('old_status')) {
            $query->where('old_status', $request->get('old_status'));
        }

        if ($request->has('new_status')) {
            $query->where('new_status', $request->get('new_status'));
        }

        if ($request->has('change_source')) {
            $query->where('change_source', $request->get('change_source'));
        }

        $histories = $query->orderBy('created_at', 'desc')->get();

        return response()->json([
            'data' => $histories,
            'status' => 200,
            'message' => 'Order status histories retrieved successfully'
        ], 200);
    }

    // Show a single order status history
    public function show($id)
    {
        $history = OrderStatusHistory::with(['order'])->findOrFail($id);

        return response()->json([
            'data' => $history,
            'status' => 200,
            'message' => 'Order status history retrieved successfully'
        ], 200);
    }

    // Store new order status history
    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'old_status' => 'nullable|string|in:pending,paid,shipped,delivered,cancelled,refunded',
            'new_status' => 'required|string|in:pending,paid,shipped,delivered,cancelled,refunded',
            'remarks' => 'nullable|string|max:500',
            'changed_by' => 'nullable|string|max:255',
            'change_source' => 'required|string|in:customer,admin,system,api',
        ]);

        $history = OrderStatusHistory::create($validated);

        return response()->json([
            'data' => $history,
            'status' => 201,
            'message' => 'Order status history created successfully'
        ], 201);
    }

    // Update existing order status history
    public function update(Request $request, $id)
    {
        $history = OrderStatusHistory::findOrFail($id);

        $validated = $request->validate([
            'remarks' => 'sometimes|nullable|string|max:500',
        ]);

        $history->update($validated);

        return response()->json([
            'data' => $history,
            'status' => 200,
            'message' => 'Order status history updated successfully'
        ], 200);
    }

    // Delete order status history
    public function destroy($id)
    {
        $history = OrderStatusHistory::findOrFail($id);
        $history->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Order status history deleted successfully'
        ], 200);
    }
}
