<?php

namespace App\Services;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Refund;
use Illuminate\Support\Facades\DB;
use Exception;

/**
 * Return/Refund Workflow Service
 * 
 * Manages complete return and refund process
 * Handles return requests, approval, item validation, and refund processing
 */
class ReturnRefundService
{
    /**
     * Create Return Request
     */
    public function createReturnRequest(Order $order, array $items, string $reason): array
    {
        try {
            DB::beginTransaction();

            // Validate order can be returned
            if (!$this->canReturnOrder($order)) {
                return [
                    'success' => false,
                    'error' => 'This order cannot be returned (order must be delivered)',
                ];
            }

            // Calculate refund amount
            $refundAmount = 0;
            $returnItems = [];

            foreach ($items as $itemId) {
                $item = OrderItem::find($itemId);
                if (!$item || $item->order_id !== $order->id) {
                    return [
                        'success' => false,
                        'error' => 'Invalid order item',
                    ];
                }

                $itemRefund = $item->price_at_purchase * $item->quantity;
                $refundAmount += $itemRefund;
                $returnItems[] = [
                    'order_item_id' => $itemId,
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'price' => $item->price_at_purchase,
                    'refund_amount' => $itemRefund,
                ];
            }

            // Create refund record
            $refund = Refund::create([
                'order_id' => $order->id,
                'refund_amount' => $refundAmount,
                'reason' => $reason,
                'status' => 'pending_approval',
                'items' => json_encode($returnItems),
                'requested_at' => now(),
            ]);

            // Update order refund status
            $order->update(['refund_status' => 'pending']);

            DB::commit();

            return [
                'success' => true,
                'refund_id' => $refund->id,
                'refund_amount' => $refundAmount,
                'message' => 'Return request submitted successfully',
            ];
        } catch (Exception $e) {
            DB::rollBack();
            \Log::error('Return Request Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => 'Failed to create return request',
            ];
        }
    }

    /**
     * Approve Return Request
     */
    public function approveReturn(Refund $refund, string $notes = ''): array
    {
        try {
            DB::beginTransaction();

            // Update refund status
            $refund->update([
                'status' => 'approved',
                'approved_at' => now(),
                'approval_notes' => $notes,
            ]);

            // Update order
            $order = $refund->order;
            $order->update(['refund_status' => 'approved']);

            // Create shipping label (would integrate with logistics)
            $this->generateReturnLabel($refund);

            DB::commit();

            return [
                'success' => true,
                'message' => 'Return approved successfully',
                'return_label' => route('returns.label', ['refund_id' => $refund->id]),
            ];
        } catch (Exception $e) {
            DB::rollBack();
            \Log::error('Approve Return Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => 'Failed to approve return',
            ];
        }
    }

    /**
     * Reject Return Request
     */
    public function rejectReturn(Refund $refund, string $reason): array
    {
        try {
            $refund->update([
                'status' => 'rejected',
                'rejection_reason' => $reason,
                'rejected_at' => now(),
            ]);

            $refund->order->update(['refund_status' => 'rejected']);

            return [
                'success' => true,
                'message' => 'Return rejected',
            ];
        } catch (Exception $e) {
            \Log::error('Reject Return Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => 'Failed to reject return',
            ];
        }
    }

    /**
     * Record Item Received
     */
    public function recordItemReceived(Refund $refund, array $receivedItems): array
    {
        try {
            DB::beginTransaction();

            $items = json_decode($refund->items, true);
            $refundAmount = 0;

            foreach ($receivedItems as $itemId => $condition) {
                // Find matching item
                $itemData = collect($items)->firstWhere('order_item_id', $itemId);
                if (!$itemData) {
                    continue;
                }

                // Determine if full or partial refund based on condition
                if ($condition === 'acceptable') {
                    $refundAmount += $itemData['refund_amount'];
                } elseif ($condition === 'damaged') {
                    // Deduct 20% for damage
                    $refundAmount += $itemData['refund_amount'] * 0.8;
                } elseif ($condition === 'rejected') {
                    // No refund
                    $refundAmount += 0;
                }
            }

            $refund->update([
                'status' => 'item_received',
                'final_refund_amount' => $refundAmount,
                'received_at' => now(),
            ]);

            // Restore product stock
            $this->restoreStock($refund);

            DB::commit();

            return [
                'success' => true,
                'final_refund_amount' => $refundAmount,
                'message' => 'Items received and recorded',
            ];
        } catch (Exception $e) {
            DB::rollBack();
            \Log::error('Record Item Received Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => 'Failed to record items',
            ];
        }
    }

    /**
     * Process Refund Payment
     */
    public function processRefund(Refund $refund): array
    {
        try {
            DB::beginTransaction();

            $order = $refund->order;
            $refundAmount = $refund->final_refund_amount ?? $refund->refund_amount;

            // Process refund to original payment method
            $paymentResult = $this->refundToPaymentMethod($order, $refundAmount);

            if (!$paymentResult['success']) {
                return $paymentResult;
            }

            // Update refund record
            $refund->update([
                'status' => 'completed',
                'refunded_amount' => $refundAmount,
                'refund_transaction_id' => $paymentResult['transaction_id'],
                'refunded_at' => now(),
            ]);

            // Update order
            $order->update(['refund_status' => 'completed']);

            // Restore inventory
            $this->restoreStock($refund);

            // Send notification
            // EmailNotificationService::sendRefundNotification($order, $refund->reason);

            DB::commit();

            return [
                'success' => true,
                'refund_amount' => $refundAmount,
                'transaction_id' => $paymentResult['transaction_id'],
                'message' => 'Refund processed successfully',
            ];
        } catch (Exception $e) {
            DB::rollBack();
            \Log::error('Process Refund Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => 'Failed to process refund',
            ];
        }
    }

    /**
     * Refund to Original Payment Method
     */
    private function refundToPaymentMethod(Order $order, float $amount): array
    {
        // This would integrate with payment gateways
        // For now, return mock response
        return [
            'success' => true,
            'transaction_id' => 'REFUND-' . uniqid(),
            'amount' => $amount,
        ];

        // Real implementation would look like:
        // if ($order->payment_method === 'bkash') {
        //     return app(BkashService::class)->refund($order->payment->transaction_id, $amount);
        // }
    }

    /**
     * Restore Product Stock
     */
    private function restoreStock(Refund $refund): void
    {
        $items = json_decode($refund->items, true);

        foreach ($items as $item) {
            DB::table('products')
                ->where('id', $item['product_id'])
                ->increment('stock_quantity', $item['quantity']);
        }
    }

    /**
     * Generate Return Shipping Label
     */
    private function generateReturnLabel(Refund $refund): void
    {
        $refund->update([
            'return_label' => 'RETURN-' . $refund->id . '-' . uniqid(),
            'label_generated_at' => now(),
        ]);
    }

    /**
     * Can Return Order
     */
    private function canReturnOrder(Order $order): bool
    {
        // Order must be delivered and within 30 days
        if ($order->status !== 'delivered') {
            return false;
        }

        $daysSinceDelivery = now()->diffInDays($order->updated_at);
        if ($daysSinceDelivery > 30) {
            return false;
        }

        // Cannot return if already refunded
        if ($order->refund_status === 'completed') {
            return false;
        }

        return true;
    }

    /**
     * Get Return Status
     */
    public function getReturnStatus(Refund $refund): array
    {
        return [
            'refund_id' => $refund->id,
            'status' => $refund->status,
            'refund_amount' => $refund->refund_amount,
            'final_refund_amount' => $refund->final_refund_amount,
            'reason' => $refund->reason,
            'requested_at' => $refund->requested_at,
            'approved_at' => $refund->approved_at,
            'refunded_at' => $refund->refunded_at,
            'return_label' => $refund->return_label,
        ];
    }

    /**
     * Get All Refunds for Order
     */
    public function getOrderRefunds(Order $order): array
    {
        return $order->refunds()
            ->select('id', 'refund_amount', 'final_refund_amount', 'status', 'reason', 'requested_at')
            ->get()
            ->toArray();
    }
}
