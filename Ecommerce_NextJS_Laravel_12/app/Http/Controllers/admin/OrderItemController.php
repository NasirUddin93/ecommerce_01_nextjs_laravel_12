<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderItemController extends Controller
{
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $orderItems = OrderItem::with(['order', 'product.images', 'variant.size'])->latest()->paginate($perPage, ['*'], 'page', $page);
        
        return response()->json([
                'status'=>200,
                'success'=>'Item data is found successfully',
                'data'=>$orderItems->items(),
                'pagination' => [
                    'total' => $orderItems->total(),
                    'per_page' => $orderItems->perPage(),
                    'current_page' => $orderItems->currentPage(),
                    'last_page' => $orderItems->lastPage(),
                    'from' => $orderItems->firstItem(),
                    'to' => $orderItems->lastItem(),
                ]
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'product_id' => 'required|exists:products,id',
            'variant_id' => 'nullable|exists:product_variants,id',
            'quantity' => 'required|integer|min:1',
            'price_at_purchase' => 'required|numeric',
            'discount_applied' => 'nullable|numeric',
        ]);

        $item = OrderItem::create($validated);

        return response()->json([
            'message' => 'Order item created successfully',
            'data' => $item,
        ], 201);
    }

    public function show($id)
    {
        $item = OrderItem::with(['order', 'product.images', 'variant.size'])->findOrFail($id);
        return response()->json($item);
    }

    public function update(Request $request, $id)
    {
        $item = OrderItem::findOrFail($id);

        $validated = $request->validate([
            'quantity' => 'sometimes|integer|min:1',
            'price_at_purchase' => 'sometimes|numeric',
            'discount_applied' => 'sometimes|numeric',
        ]);

        $item->update($validated);

        return response()->json([
            'message' => 'Order item updated successfully',
            'data' => $item,
        ]);
    }

    public function destroy($id)
    {
        $item = OrderItem::findOrFail($id);
        $item->delete(); // Soft delete

        return response()->json(['message' => 'Order item soft-deleted successfully']);
    }

    public function trashed()
    {
        $trashed = OrderItem::onlyTrashed()->get();
        return response()->json($trashed);
    }

    public function restore($id)
    {
        $item = OrderItem::onlyTrashed()->findOrFail($id);
        $item->restore();

        return response()->json(['message' => 'Order item restored successfully']);
    }

    public function forceDelete($id)
    {
        $item = OrderItem::onlyTrashed()->findOrFail($id);
        $item->forceDelete();

        return response()->json(['message' => 'Order item permanently deleted']);
    }
}
