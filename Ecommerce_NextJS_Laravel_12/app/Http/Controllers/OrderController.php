<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Get all orders for a user (guest or authenticated)
     */
    public function index(Request $request)
    {
        $email = $request->query('email');
        
        if (!$email) {
            return response()->json(['error' => 'Email is required'], 400);
        }

        $orders = Order::where('customer_email', $email)
            ->with('items.product')
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json($orders);
    }

    /**
     * Get a single order by ID
     */
    public function show($id, Request $request)
    {
        $order = Order::with('items.product')
            ->findOrFail($id);

        // Verify email matches for security
        if ($request->query('email') && $request->query('email') !== $order->customer_email) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        return response()->json($order);
    }

    /**
     * Create a new order from cart
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'customer_name' => 'required|string|max:255',
            'customer_email' => 'required|email|max:255',
            'customer_phone' => 'required|string|max:20',
            'shipping_address' => 'required|string|max:500',
            'city' => 'required|string|max:100',
            'postal_code' => 'required|string|max:20',
            'country' => 'required|string|max:100',
            'state' => 'nullable|string|max:100',
            'payment_method' => 'required|in:cod,bkash,nagad,rocket,card,bank_transfer,mobile_banking,wallet,credit_card',
            'total_amount' => 'required|numeric|min:0',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.quantity' => 'required|integer|min:1',
            'items.*.price_at_purchase' => 'required|numeric|min:0',
            'customer_notes' => 'nullable|string|max:1000',
        ]);

        if (($validated['payment_method'] ?? null) === 'credit_card') {
            $validated['payment_method'] = 'card';
        }

        try {
            DB::beginTransaction();

            // Create the order
            $order = Order::create([
                'customer_name' => $validated['customer_name'],
                'customer_email' => $validated['customer_email'],
                'customer_phone' => $validated['customer_phone'],
                'shipping_address' => $validated['shipping_address'],
                'city' => $validated['city'],
                'postal_code' => $validated['postal_code'],
                'country' => $validated['country'],
                'billing_address' => $validated['shipping_address'], // Use same address for billing
                'billing_city' => $validated['city'],
                'billing_postal_code' => $validated['postal_code'],
                'billing_country' => $validated['country'],
                'total_amount' => $validated['total_amount'],
                'final_amount' => $validated['total_amount'],
                'payment_method' => $validated['payment_method'],
                'status' => 'pending', // Initial status
                'customer_notes' => $validated['customer_notes'] ?? null,
            ]);

            // Create order items and decrement stock
            foreach ($validated['items'] as $item) {
                // Create order item
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'price_at_purchase' => $item['price_at_purchase'],
                ]);

                // Decrement product stock
                $product = Product::findOrFail($item['product_id']);
                $newStock = max(0, $product->stock_quantity - $item['quantity']);
                $product->update(['stock_quantity' => $newStock]);
            }

            DB::commit();

            return response()->json([
                'message' => 'Order created successfully',
                'order' => $order->load('items.product'),
                'status' => 'success',
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'error' => 'Failed to create order',
                'message' => $e->getMessage(),
                'status' => 'error',
            ], 500);
        }
    }

    /**
     * Update order status (admin or system use)
     */
    public function update($id, Request $request)
    {
        $order = Order::findOrFail($id);

        $validated = $request->validate([
            'status' => 'required|in:pending,confirmed,processing,shipped,delivered,cancelled',
            'tracking_number' => 'nullable|string|max:100',
        ]);

        $order->update($validated);

        return response()->json([
            'message' => 'Order updated successfully',
            'order' => $order,
        ]);
    }

    /**
     * Cancel an order
     */
    public function cancel($id, Request $request)
    {
        $order = Order::findOrFail($id);

        // Verify ownership
        if ($request->query('email') && $request->query('email') !== $order->customer_email) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        // Only allow cancellation if order is pending or confirmed
        if (!in_array($order->status, ['pending', 'confirmed'])) {
            return response()->json([
                'error' => 'Cannot cancel order with status: ' . $order->status
            ], 400);
        }

        try {
            DB::beginTransaction();

            // Restore stock for all items
            foreach ($order->items as $item) {
                $product = Product::findOrFail($item->product_id);
                $product->update([
                    'stock_quantity' => $product->stock_quantity + $item->quantity
                ]);
            }

            // Update order status
            $order->update(['status' => 'cancelled']);

            DB::commit();

            return response()->json([
                'message' => 'Order cancelled successfully',
                'order' => $order,
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'error' => 'Failed to cancel order',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
