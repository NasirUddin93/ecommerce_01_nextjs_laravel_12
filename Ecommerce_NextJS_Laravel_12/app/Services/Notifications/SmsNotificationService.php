<?php

namespace App\Services\Notifications;

use Illuminate\Support\Facades\Http;
use Exception;

/**
 * SMS Notification Service
 * 
 * Handles all SMS notifications via Twilio
 * Supports order updates, delivery notifications, payment confirmations
 */
class SmsNotificationService
{
    private string $accountSid;
    private string $authToken;
    private string $fromNumber;
    private string $baseUrl = 'https://api.twilio.com/2010-04-01';

    public function __construct()
    {
        $this->accountSid = config('services.twilio.account_sid');
        $this->authToken = config('services.twilio.auth_token');
        $this->fromNumber = config('services.twilio.from_number');
    }

    /**
     * Send Order Confirmation SMS
     */
    public function sendOrderConfirmation(string $phone, int $orderId, float $amount): bool
    {
        $message = "Order #{$orderId} confirmed! Total: ৳{$amount}. Track your order at: https://shopstyle.com/orders";
        return $this->send($phone, $message);
    }

    /**
     * Send Order Shipped SMS
     */
    public function sendOrderShipped(string $phone, int $orderId, string $trackingNumber): bool
    {
        $message = "Your order #{$orderId} has shipped! Tracking: {$trackingNumber}. View details: https://shopstyle.com/orders/{$orderId}";
        return $this->send($phone, $message);
    }

    /**
     * Send Order Delivered SMS
     */
    public function sendOrderDelivered(string $phone, int $orderId): bool
    {
        $message = "Order #{$orderId} delivered! Thank you for your purchase. Please leave a review: https://shopstyle.com/reviews/{$orderId}";
        return $this->send($phone, $message);
    }

    /**
     * Send Payment Confirmation SMS
     */
    public function sendPaymentConfirmation(string $phone, int $orderId, float $amount): bool
    {
        $message = "Payment of ৳{$amount} received for order #{$orderId}. Payment method: Mobile Banking";
        return $this->send($phone, $message);
    }

    /**
     * Send Refund SMS
     */
    public function sendRefundNotification(string $phone, int $orderId, float $amount): bool
    {
        $message = "Refund of ৳{$amount} initiated for order #{$orderId}. Check your account in 3-5 business days.";
        return $this->send($phone, $message);
    }

    /**
     * Send OTP SMS
     */
    public function sendOtp(string $phone, string $otp): bool
    {
        $message = "Your ShopStyle verification code is: {$otp}. Valid for 10 minutes.";
        return $this->send($phone, $message);
    }

    /**
     * Send Password Reset SMS
     */
    public function sendPasswordReset(string $phone, string $resetCode): bool
    {
        $message = "Your password reset code is: {$resetCode}. Use it within 1 hour: https://shopstyle.com/reset-password";
        return $this->send($phone, $message);
    }

    /**
     * Send Promotional SMS
     */
    public function sendPromotion(string $phone, string $message): bool
    {
        return $this->send($phone, $message);
    }

    /**
     * Send Generic SMS
     */
    public function send(string $phone, string $message): bool
    {
        try {
            // Validate phone number
            $phone = $this->formatPhoneNumber($phone);
            if (!$phone) {
                \Log::error("Invalid phone number provided for SMS");
                return false;
            }

            // Truncate message if too long (SMS limit)
            $message = substr($message, 0, 160);

            // Send via Twilio
            $response = Http::withBasicAuth($this->accountSid, $this->authToken)
                ->asForm()
                ->post("{$this->baseUrl}/Accounts/{$this->accountSid}/Messages.json", [
                    'From' => $this->fromNumber,
                    'To' => $phone,
                    'Body' => $message,
                ]);

            if ($response->successful()) {
                \Log::info("SMS sent successfully to {$phone}");
                return true;
            }

            \Log::error("SMS sending failed: " . $response->json('message'));
            return false;
        } catch (Exception $e) {
            \Log::error("SMS Service Error: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Format Phone Number to E.164 Format
     */
    private function formatPhoneNumber(string $phone): ?string
    {
        // Remove all non-numeric characters
        $phone = preg_replace('/\D/', '', $phone);

        // Handle Bangladesh numbers
        if (strlen($phone) === 10) {
            // Local format: 01812345678
            return '+880' . substr($phone, 1);
        } elseif (strlen($phone) === 11) {
            // Standard format: 8801812345678
            return '+' . $phone;
        } elseif (strlen($phone) === 12 && strpos($phone, '880') === 0) {
            // With country code: 880181234567
            return '+' . $phone;
        }

        return null;
    }

    /**
     * Send SMS via Alternative Provider (Nexmo/Vonage)
     */
    public function sendViaVonage(string $phone, string $message): bool
    {
        try {
            $apiKey = config('services.vonage.api_key');
            $apiSecret = config('services.vonage.api_secret');

            $response = Http::asJson()->post('https://rest.nexmo.com/sms/json', [
                'api_key' => $apiKey,
                'api_secret' => $apiSecret,
                'to' => $phone,
                'from' => 'ShopStyle',
                'text' => substr($message, 0, 160),
            ]);

            if ($response->successful() && $response->json('messages.0.status') == 0) {
                \Log::info("SMS sent via Vonage to {$phone}");
                return true;
            }

            \Log::error("Vonage SMS failed: " . $response->json('messages.0.error-text'));
            return false;
        } catch (Exception $e) {
            \Log::error("Vonage SMS Error: " . $e->getMessage());
            return false;
        }
    }
}
