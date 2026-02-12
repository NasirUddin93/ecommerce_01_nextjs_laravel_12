<?php

namespace App\Services\PaymentGateways;

use Illuminate\Support\Facades\Http;
use Exception;

/**
 * Nagad Payment Gateway Service
 * 
 * Integrates with Nagad API for mobile payment processing
 * Supports payment initiation, verification, and refunds
 */
class NagadService
{
    private string $merchantId;
    private string $merchantPassword;
    private string $baseUrl;
    private string $publicKey;

    public function __construct()
    {
        $this->merchantId = config('services.nagad.merchant_id');
        $this->merchantPassword = config('services.nagad.merchant_password');
        $this->baseUrl = config('services.nagad.base_url');
        $this->publicKey = config('services.nagad.public_key');
    }

    /**
     * Initiate Payment
     */
    public function initiatePayment(array $data): array
    {
        try {
            $payload = [
                'merchantId' => $this->merchantId,
                'orderId' => $data['order_id'],
                'amount' => $data['amount'] * 100, // Convert to paise
                'currencyCode' => '050', // BDT code
                'orderDateTime' => date('YmdHis'),
                'merchantMobileNumber' => $data['merchant_phone'] ?? '',
                'merchantEmail' => $data['merchant_email'] ?? '',
                'customerMobileNumber' => $data['customer_phone'] ?? '',
                'customerEmail' => $data['customer_email'] ?? '',
                'redirectUrl' => route('payment.nagad.callback'),
                'additionalMerchantInfo' => $data['order_id'],
            ];

            // Generate checksum
            $payload['checksum'] = $this->generateChecksum($payload);

            $response = Http::asJson()->post("{$this->baseUrl}/api/dmerchant/initiate/paymentRequest", $payload);

            if ($response->successful() && $response->json('responseCode') === '0000') {
                return [
                    'success' => true,
                    'payment_url' => $response->json('callBackUrl'),
                    'session_id' => $response->json('sessionId'),
                    'reference_id' => $response->json('referenceId'),
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('responseMessage') ?? 'Payment initiation failed',
            ];
        } catch (Exception $e) {
            \Log::error('Nagad Initiate Payment Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Verify Payment
     */
    public function verifyPayment(string $sessionId): array
    {
        try {
            $payload = [
                'merchantId' => $this->merchantId,
                'sessionId' => $sessionId,
            ];

            $payload['checksum'] = $this->generateChecksum($payload);

            $response = Http::asJson()->post("{$this->baseUrl}/api/dmerchant/verify/paymentRequest", $payload);

            if ($response->successful() && $response->json('responseCode') === '0000') {
                return [
                    'success' => true,
                    'transaction_id' => $response->json('txnId'),
                    'amount' => $response->json('amount') / 100,
                    'status' => 'completed',
                    'reference_id' => $response->json('referenceId'),
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('responseMessage') ?? 'Payment verification failed',
            ];
        } catch (Exception $e) {
            \Log::error('Nagad Verify Payment Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Process Refund
     */
    public function refund(string $txnId, float $amount): array
    {
        try {
            $payload = [
                'merchantId' => $this->merchantId,
                'txnId' => $txnId,
                'refundAmount' => $amount * 100,
                'reason' => 'Customer refund request',
            ];

            $payload['checksum'] = $this->generateChecksum($payload);

            $response = Http::asJson()->post("{$this->baseUrl}/api/dmerchant/refund/paymentRequest", $payload);

            if ($response->successful() && $response->json('responseCode') === '0000') {
                return [
                    'success' => true,
                    'refund_id' => $response->json('refundTxnId'),
                    'status' => 'refunded',
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('responseMessage') ?? 'Refund failed',
            ];
        } catch (Exception $e) {
            \Log::error('Nagad Refund Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Generate Checksum
     */
    private function generateChecksum(array $data): string
    {
        $payload = json_encode($data);
        $hashedPayload = hash('sha256', $payload, true);
        return bin2hex($hashedPayload);
    }
}
