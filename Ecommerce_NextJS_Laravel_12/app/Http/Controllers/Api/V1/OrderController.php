<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class OrderController extends ApiController
{
    public function index(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->query('per_page', 20), 100);

        $orders = Order::where('user_id', $user->id)
            ->with('items.product')
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);

        return $this->paginated($orders, 'Orders retrieved');
    }

    public function show(Request $request, $id)
    {
        $user = $request->user();

        $order = Order::with('items.product')
            ->where('user_id', $user->id)
            ->findOrFail($id);

        return $this->success($order, 'Order retrieved');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'customer_name' => 'required|string|max:255',
            'customer_email' => 'required|email|max:255',
            'customer_phone' => 'required|string|max:20',
            'shipping_address' => 'required|string|max:500',
            'city' => 'required|string|max:100',
            'postal_code' => 'required|string|max:20',
            'country' => 'required|string|max:100',
            'state' => 'nullable|string|max:100',
            'payment_method' => 'required|in:cod,bkash,nagad,rocket,card,bank_transfer,mobile_banking,wallet',
            'total_amount' => 'required|numeric|min:0',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.quantity' => 'required|integer|min:1',
            'items.*.price_at_purchase' => 'required|numeric|min:0',
            'customer_notes' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        $validated = $validator->validated();

        try {
            DB::beginTransaction();

            $order = Order::create([
                'user_id' => $request->user()->id,
                'customer_name' => $validated['customer_name'],
                'customer_email' => $validated['customer_email'],
                'customer_phone' => $validated['customer_phone'],
                'shipping_address' => $validated['shipping_address'],
                'city' => $validated['city'],
                'postal_code' => $validated['postal_code'],
                'country' => $validated['country'],
                'state' => $validated['state'] ?? null,
                'billing_address' => $validated['shipping_address'],
                'billing_city' => $validated['city'],
                'billing_postal_code' => $validated['postal_code'],
                'billing_country' => $validated['country'],
                'total_amount' => $validated['total_amount'],
                'final_amount' => $validated['total_amount'],
                'payment_method' => $validated['payment_method'],
                'status' => 'pending',
                'customer_notes' => $validated['customer_notes'] ?? null,
            ]);

            foreach ($validated['items'] as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'price_at_purchase' => $item['price_at_purchase'],
                ]);

                $product = Product::findOrFail($item['product_id']);
                $newStock = max(0, $product->stock_quantity - $item['quantity']);
                $product->update(['stock_quantity' => $newStock]);
            }

            DB::commit();

            return $this->success($order->load('items.product'), 'Order created', 201);
        } catch (\Exception $e) {
            DB::rollBack();

            return $this->error('Failed to create order', 500, 'order_create_failed', [
                'exception' => $e->getMessage(),
            ]);
        }
    }

    public function cancel(Request $request, $id)
    {
        $user = $request->user();

        $order = Order::where('user_id', $user->id)->findOrFail($id);

        if (!in_array($order->status, ['pending', 'confirmed'])) {
            return $this->error('Cannot cancel order with status: ' . $order->status, 400, 'order_not_cancellable');
        }

        try {
            DB::beginTransaction();

            foreach ($order->items as $item) {
                $product = Product::findOrFail($item->product_id);
                $product->update([
                    'stock_quantity' => $product->stock_quantity + $item->quantity,
                ]);
            }

            $order->update(['status' => 'cancelled']);

            DB::commit();

            return $this->success($order, 'Order cancelled');
        } catch (\Exception $e) {
            DB::rollBack();

            return $this->error('Failed to cancel order', 500, 'order_cancel_failed', [
                'exception' => $e->getMessage(),
            ]);
        }
    }
}
