<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Order;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PaymentController extends ApiController
{
    public function initialize(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'nullable|exists:orders,id',
            'amount' => 'required_without:order_id|numeric|min:1',
            'payment_method' => 'required|in:cod,bkash,nagad,rocket,card,bank_transfer,mobile_banking,wallet',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        $data = $validator->validated();

        $order = null;
        if (!empty($data['order_id'])) {
            $order = Order::findOrFail($data['order_id']);
            if ($order->user_id && $order->user_id !== $request->user()->id) {
                return $this->error('Unauthorized for this order', 403, 'forbidden');
            }
        }

        $amount = $order ? $order->final_amount : $data['amount'];
        $transactionId = 'PMT-' . Str::upper(Str::random(10));

        $payment = Payment::create([
            'order_id' => $order?->id,
            'payment_method' => $data['payment_method'],
            'transaction_id' => $transactionId,
            'amount' => $amount,
            'status' => 'pending',
        ]);

        if ($order) {
            $order->update(['payment_method' => $data['payment_method']]);
        }

        return $this->success([
            'payment' => $payment,
            'action' => $this->buildAction($data['payment_method'], $payment),
        ], 'Payment initialized', 201);
    }

    private function buildAction(string $method, Payment $payment): array
    {
        $default = ['type' => 'manual', 'instructions' => 'Proceed with payment using selected method.'];

        return match ($method) {
            'cod' => ['type' => 'cod', 'instructions' => 'Cash on delivery selected.'],
            'bkash' => ['type' => 'redirect', 'instructions' => 'Redirect to bKash payment.', 'url' => null],
            'nagad' => ['type' => 'redirect', 'instructions' => 'Redirect to Nagad payment.', 'url' => null],
            'rocket' => ['type' => 'redirect', 'instructions' => 'Redirect to Rocket payment.', 'url' => null],
            'card' => ['type' => 'intent', 'instructions' => 'Create card intent with gateway.', 'client_secret' => null],
            'bank_transfer' => ['type' => 'manual', 'instructions' => 'Transfer to bank and upload receipt.'],
            'mobile_banking' => $default,
            'wallet' => $default,
            default => $default,
        };
    }
}
