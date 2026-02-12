<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PaymentMethodController extends Controller
{
    /**
     * Get all payment methods for authenticated user
     */
    public function index(Request $request)
    {
        try {
            $user = $request->user();
            
            // In production, fetch from payment_methods table
            // For now, return sample data
            $paymentMethods = [
                [
                    'id' => 1,
                    'user_id' => $user->id,
                    'type' => 'card',
                    'card_brand' => 'visa',
                    'last_four' => '4242',
                    'cardholder_name' => $user->name,
                    'expiry_month' => '12',
                    'expiry_year' => '2026',
                    'is_default' => true,
                    'created_at' => now()->toISOString(),
                ],
            ];

            return response()->json([
                'success' => true,
                'payment_methods' => $paymentMethods
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch payment methods',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Add new payment method
     */
    public function store(Request $request)
    {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'type' => 'required|string|in:card,bank_account',
                'card_number' => 'required_if:type,card|string|size:16',
                'cardholder_name' => 'required_if:type,card|string|max:100',
                'expiry_month' => 'required_if:type,card|integer|min:1|max:12',
                'expiry_year' => 'required_if:type,card|integer|min:2024',
                'cvv' => 'required_if:type,card|string|size:3',
                'is_default' => 'sometimes|boolean',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            // In production, tokenize card with payment gateway (Stripe, etc.)
            // Store only last 4 digits and token
            $lastFour = substr($request->card_number, -4);

            $paymentMethod = [
                'id' => rand(1, 1000),
                'user_id' => $user->id,
                'type' => $request->type,
                'card_brand' => $this->detectCardBrand($request->card_number),
                'last_four' => $lastFour,
                'cardholder_name' => $request->cardholder_name,
                'expiry_month' => $request->expiry_month,
                'expiry_year' => $request->expiry_year,
                'is_default' => $request->is_default ?? false,
                'created_at' => now()->toISOString(),
            ];

            return response()->json([
                'success' => true,
                'message' => 'Payment method added successfully',
                'payment_method' => $paymentMethod
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to add payment method',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete payment method
     */
    public function destroy(Request $request, $id)
    {
        try {
            $user = $request->user();

            // In production, verify ownership and delete from database
            // For now, return success

            return response()->json([
                'success' => true,
                'message' => 'Payment method deleted successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete payment method',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Set default payment method
     */
    public function setDefault(Request $request, $id)
    {
        try {
            $user = $request->user();

            // In production, update database
            // Set all user's payment methods to is_default=false
            // Then set this one to is_default=true

            return response()->json([
                'success' => true,
                'message' => 'Default payment method updated successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update default payment method',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Detect card brand from card number
     */
    private function detectCardBrand($cardNumber)
    {
        $firstDigit = substr($cardNumber, 0, 1);
        $firstTwoDigits = substr($cardNumber, 0, 2);

        if ($firstDigit === '4') {
            return 'visa';
        } elseif (in_array($firstTwoDigits, ['51', '52', '53', '54', '55'])) {
            return 'mastercard';
        } elseif (in_array($firstTwoDigits, ['34', '37'])) {
            return 'amex';
        } elseif ($firstTwoDigits === '60' || $firstTwoDigits === '65') {
            return 'discover';
        }

        return 'unknown';
    }
}
