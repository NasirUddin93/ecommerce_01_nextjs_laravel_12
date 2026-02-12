<?php

namespace App\Services\PaymentGateways;

use Illuminate\Support\Facades\Http;
use Exception;

/**
 * Rocket Payment Gateway Service
 * 
 * Integrates with Rocket (dbbl) API for mobile payment processing
 * Supports payment initiation, verification, and refunds
 */
class RocketService
{
    private string $apiKey;
    private string $merchantId;
    private string $baseUrl;
    private string $apiVersion;

    public function __construct()
    {
        $this->apiKey = config('services.rocket.api_key');
        $this->merchantId = config('services.rocket.merchant_id');
        $this->baseUrl = config('services.rocket.base_url');
        $this->apiVersion = config('services.rocket.api_version', 'v1');
    }

    /**
     * Initiate Payment
     */
    public function initiatePayment(array $data): array
    {
        try {
            $payload = [
                'apiOperation' => 'CREATE_CHECKOUT_SESSION',
                'merchant' => [
                    'entityId' => $this->merchantId,
                ],
                'order' => [
                    'id' => $data['order_id'],
                    'amount' => number_format($data['amount'], 2, '.', ''),
                    'currency' => 'BDT',
                    'description' => $data['description'] ?? 'Order Payment',
                ],
                'customer' => [
                    'email' => $data['customer_email'] ?? '',
                    'phone' => $data['customer_phone'] ?? '',
                ],
                'billing' => [
                    'address' => [
                        'street1' => $data['billing_address'] ?? '',
                        'city' => $data['billing_city'] ?? '',
                        'state' => $data['billing_state'] ?? '',
                        'postcode' => $data['billing_zip'] ?? '',
                        'country' => 'BD',
                    ],
                ],
                'shipping' => [
                    'address' => [
                        'street1' => $data['shipping_address'] ?? '',
                        'city' => $data['shipping_city'] ?? '',
                        'state' => $data['shipping_state'] ?? '',
                        'postcode' => $data['shipping_zip'] ?? '',
                        'country' => 'BD',
                    ],
                ],
                'redirect' => [
                    'successUrl' => route('payment.rocket.callback') . '?status=success',
                    'cancelUrl' => route('payment.rocket.callback') . '?status=cancelled',
                    'pendingUrl' => route('payment.rocket.callback') . '?status=pending',
                ],
            ];

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$this->apiKey}",
                'Content-Type' => 'application/json',
            ])->post("{$this->baseUrl}/{$this->apiVersion}/checkoutSession", $payload);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'checkout_id' => $response->json('id'),
                    'redirect_url' => $response->json('redirectUrl'),
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('error') ?? 'Payment initiation failed',
            ];
        } catch (Exception $e) {
            \Log::error('Rocket Initiate Payment Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Get Payment Status
     */
    public function getPaymentStatus(string $checkoutId): array
    {
        try {
            $response = Http::withHeaders([
                'Authorization' => "Bearer {$this->apiKey}",
            ])->get("{$this->baseUrl}/{$this->apiVersion}/checkoutSession/{$checkoutId}");

            if ($response->successful()) {
                $data = $response->json();
                return [
                    'success' => true,
                    'status' => $data['resultIndicator'] ?? 'PENDING',
                    'amount' => $data['order']['amount'] ?? 0,
                    'transaction_id' => $data['transaction']['reference'] ?? null,
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('error') ?? 'Status check failed',
            ];
        } catch (Exception $e) {
            \Log::error('Rocket Get Payment Status Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Process Refund
     */
    public function refund(string $transactionId, float $amount): array
    {
        try {
            $payload = [
                'apiOperation' => 'REFUND_TRANSACTION',
                'transaction' => [
                    'reference' => $transactionId,
                ],
                'order' => [
                    'amount' => number_format($amount, 2, '.', ''),
                    'currency' => 'BDT',
                ],
            ];

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$this->apiKey}",
                'Content-Type' => 'application/json',
            ])->post("{$this->baseUrl}/{$this->apiVersion}/transaction", $payload);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'refund_id' => $response->json('id'),
                    'status' => 'refunded',
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('error') ?? 'Refund failed',
            ];
        } catch (Exception $e) {
            \Log::error('Rocket Refund Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
}
