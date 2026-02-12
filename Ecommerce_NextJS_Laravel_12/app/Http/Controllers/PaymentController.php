<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
   // Get all payments
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $payments = Payment::with('order')->latest()->paginate($perPage, ['*'], 'page', $page);

        return response()->json([
            'data' => $payments->items(),
            'status' => 200,
            'message' => 'Payment data retrieved successfully',
            'pagination' => [
                'total' => $payments->total(),
                'per_page' => $payments->perPage(),
                'current_page' => $payments->currentPage(),
                'last_page' => $payments->lastPage(),
                'from' => $payments->firstItem(),
                'to' => $payments->lastItem(),
            ]
        ], 200);
    }

    // Show a single payment
    public function show($id)
    {
        $payment = Payment::with('order')->findOrFail($id);

        return response()->json([
            'data' => $payment,
            'status' => 200,
            'message' => 'Payment retrieved successfully'
        ], 200);
    }

    // Store new payment
    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'payment_method' => 'required|in:cod,bkash,nagad,rocket,card,bank_transfer,mobile_banking,wallet',
            'transaction_id' => 'required|string|max:150',
            'amount' => 'required|numeric|min:0',
            'status' => 'required|in:pending,success,failed',
        ]);

        if (($validated['payment_method'] ?? null) === 'COD') {
            $validated['payment_method'] = 'cod';
        }

        $payment = Payment::create($validated);

        return response()->json([
            'data' => $payment,
            'status' => 201,
            'message' => 'Payment created successfully'
        ], 201);
    }

    // Update existing payment
    public function update(Request $request, $id)
    {
        $payment = Payment::findOrFail($id);

        $validated = $request->validate([
            'payment_method' => 'sometimes|in:cod,bkash,nagad,rocket,card,bank_transfer,mobile_banking,wallet',
            'transaction_id' => 'sometimes|string|max:150',
            'amount' => 'sometimes|numeric|min:0',
            'status' => 'sometimes|in:pending,success,failed',
        ]);

        if (($validated['payment_method'] ?? null) === 'COD') {
            $validated['payment_method'] = 'cod';
        }

        $payment->update($validated);

        return response()->json([
            'data' => $payment,
            'status' => 200,
            'message' => 'Payment updated successfully'
        ], 200);
    }

    // Soft delete payment
    public function destroy($id)
    {
        $payment = Payment::findOrFail($id);
        $payment->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Payment soft deleted successfully'
        ], 200);
    }
}
