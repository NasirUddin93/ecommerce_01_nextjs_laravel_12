<?php

namespace App\Services\PaymentGateways;

use Illuminate\Support\Facades\Http;
use App\Models\Payment;
use Exception;

/**
 * bKash Payment Gateway Service
 * 
 * Integrates with bKash API for mobile payment processing
 * Supports payment initiation, verification, and refunds
 */
class BkashService
{
    private string $appKey;
    private string $appSecret;
    private string $baseUrl;
    private string $username;
    private string $password;

    public function __construct()
    {
        $this->appKey = config('services.bkash.app_key');
        $this->appSecret = config('services.bkash.app_secret');
        $this->baseUrl = config('services.bkash.base_url');
        $this->username = config('services.bkash.username');
        $this->password = config('services.bkash.password');
    }

    /**
     * Get bKash API Token
     */
    public function getToken(): string
    {
        try {
            $response = Http::post("{$this->baseUrl}/tokenized/checkout/token/request", [
                'app_key' => $this->appKey,
                'app_secret' => $this->appSecret,
            ]);

            if ($response->successful()) {
                return $response->json('id_token');
            }

            throw new Exception('Failed to get bKash token');
        } catch (Exception $e) {
            \Log::error('bKash Token Error: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Initiate Payment
     */
    public function initiatePayment(array $data): array
    {
        try {
            $token = $this->getToken();

            $payload = [
                'mode' => '0011',
                'payerReference' => $data['order_id'],
                'callbackURL' => route('payment.bkash.callback'),
                'amount' => $data['amount'],
                'currency' => 'BDT',
                'intent' => 'sale',
                'merchantInvoiceNumber' => $data['order_id'],
            ];

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$token}",
                'X-APP-Key' => $this->appKey,
            ])->post("{$this->baseUrl}/tokenized/checkout/create", $payload);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'payment_url' => $response->json('bkashURL'),
                    'transaction_id' => $response->json('trxID'),
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('statusMessage') ?? 'Payment initiation failed',
            ];
        } catch (Exception $e) {
            \Log::error('bKash Initiate Payment Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Execute Payment
     */
    public function executePayment(string $paymentId): array
    {
        try {
            $token = $this->getToken();

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$token}",
                'X-APP-Key' => $this->appKey,
            ])->post("{$this->baseUrl}/tokenized/checkout/execute", [
                'paymentID' => $paymentId,
            ]);

            if ($response->successful() && $response->json('transactionStatus') === 'Completed') {
                return [
                    'success' => true,
                    'transaction_id' => $response->json('trxID'),
                    'amount' => $response->json('amount'),
                    'status' => 'completed',
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('statusMessage') ?? 'Payment execution failed',
            ];
        } catch (Exception $e) {
            \Log::error('bKash Execute Payment Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Process Refund
     */
    public function refund(string $trxId, float $amount): array
    {
        try {
            $token = $this->getToken();

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$token}",
                'X-APP-Key' => $this->appKey,
                'username' => $this->username,
                'password' => $this->password,
            ])->post("{$this->baseUrl}/tokenized/checkout/refund", [
                'trxID' => $trxId,
                'amount' => $amount,
                'reason' => 'Customer refund request',
            ]);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'refund_id' => $response->json('refundTrxID'),
                    'status' => 'refunded',
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('statusMessage') ?? 'Refund failed',
            ];
        } catch (Exception $e) {
            \Log::error('bKash Refund Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Query Transaction Status
     */
    public function queryTransaction(string $trxId): array
    {
        try {
            $token = $this->getToken();

            $response = Http::withHeaders([
                'Authorization' => "Bearer {$token}",
                'X-APP-Key' => $this->appKey,
            ])->post("{$this->baseUrl}/tokenized/checkout/query", [
                'trxID' => $trxId,
            ]);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'status' => $response->json('transactionStatus'),
                    'amount' => $response->json('amount'),
                    'data' => $response->json(),
                ];
            }

            return [
                'success' => false,
                'error' => $response->json('statusMessage') ?? 'Query failed',
            ];
        } catch (Exception $e) {
            \Log::error('bKash Query Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
}
