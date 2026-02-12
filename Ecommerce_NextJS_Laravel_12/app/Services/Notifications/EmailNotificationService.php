<?php

namespace App\Services\Notifications;

use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use Exception;

/**
 * Email Notification Service
 * 
 * Handles all email notifications for the e-commerce platform
 * Includes order confirmations, shipment updates, refunds, etc.
 */
class EmailNotificationService
{
    /**
     * Send Order Confirmation Email
     */
    public function sendOrderConfirmation(Order $order): bool
    {
        try {
            $data = [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'customer_email' => $order->customer_email,
                'total_amount' => $order->total_amount,
                'items' => $order->orderItems()->get(),
                'status' => $order->status,
                'created_at' => $order->created_at->format('M d, Y H:i'),
            ];

            Mail::send('emails.order-confirmation', $data, function ($message) use ($order) {
                $message->to($order->customer_email)
                    ->subject("Order Confirmation - Order #{$order->id}");
            });

            \Log::info("Order confirmation email sent to {$order->customer_email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send order confirmation: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Order Shipped Email
     */
    public function sendOrderShipped(Order $order): bool
    {
        try {
            $shipping = $order->orderShipping;

            $data = [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'customer_email' => $order->customer_email,
                'tracking_number' => $shipping?->tracking_number,
                'estimated_delivery' => $shipping?->estimated_delivery_date,
                'shipping_address' => $order->shipping_address,
                'city' => $order->city,
            ];

            Mail::send('emails.order-shipped', $data, function ($message) use ($order) {
                $message->to($order->customer_email)
                    ->subject("Your Order #{$order->id} Has Been Shipped");
            });

            \Log::info("Order shipped email sent to {$order->customer_email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send order shipped email: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Order Delivered Email
     */
    public function sendOrderDelivered(Order $order): bool
    {
        try {
            $data = [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'customer_email' => $order->customer_email,
                'total_amount' => $order->total_amount,
                'items' => $order->orderItems()->get(),
                'review_link' => route('reviews.create', ['order_id' => $order->id]),
            ];

            Mail::send('emails.order-delivered', $data, function ($message) use ($order) {
                $message->to($order->customer_email)
                    ->subject("Order #{$order->id} Delivered");
            });

            \Log::info("Order delivered email sent to {$order->customer_email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send order delivered email: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Payment Confirmation Email
     */
    public function sendPaymentConfirmation(Order $order): bool
    {
        try {
            $payment = $order->payment;

            $data = [
                'order_id' => $order->id,
                'customer_email' => $order->customer_email,
                'customer_name' => $order->customer_name,
                'amount' => $order->total_amount,
                'payment_method' => $order->payment_method,
                'transaction_id' => $payment?->transaction_id,
                'created_at' => now()->format('M d, Y H:i'),
            ];

            Mail::send('emails.payment-confirmation', $data, function ($message) use ($order) {
                $message->to($order->customer_email)
                    ->subject("Payment Confirmed - Order #{$order->id}");
            });

            \Log::info("Payment confirmation email sent to {$order->customer_email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send payment confirmation: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Refund Notification Email
     */
    public function sendRefundNotification(Order $order, string $reason): bool
    {
        try {
            $data = [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'customer_email' => $order->customer_email,
                'amount' => $order->total_amount,
                'reason' => $reason,
                'expected_date' => now()->addDays(5)->format('M d, Y'),
            ];

            Mail::send('emails.refund-notification', $data, function ($message) use ($order) {
                $message->to($order->customer_email)
                    ->subject("Refund Initiated - Order #{$order->id}");
            });

            \Log::info("Refund notification email sent to {$order->customer_email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send refund notification: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Welcome Email
     */
    public function sendWelcomeEmail(User $user): bool
    {
        try {
            $data = [
                'user_name' => $user->name,
                'user_email' => $user->email,
                'activation_link' => route('email.verify', ['token' => \Str::random(60)]),
            ];

            Mail::send('emails.welcome', $data, function ($message) use ($user) {
                $message->to($user->email)
                    ->subject("Welcome to ShopStyle!");
            });

            \Log::info("Welcome email sent to {$user->email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send welcome email: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Password Reset Email
     */
    public function sendPasswordResetEmail(User $user, string $token): bool
    {
        try {
            $data = [
                'user_name' => $user->name,
                'reset_link' => route('password.reset', ['token' => $token, 'email' => $user->email]),
                'expires_at' => now()->addHours(1)->format('M d, Y H:i'),
            ];

            Mail::send('emails.password-reset', $data, function ($message) use ($user) {
                $message->to($user->email)
                    ->subject("Password Reset Request");
            });

            \Log::info("Password reset email sent to {$user->email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send password reset email: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Newsletter Email
     */
    public function sendNewsletterEmail(string $email, string $subject, string $htmlContent): bool
    {
        try {
            Mail::send('emails.newsletter', ['content' => $htmlContent], function ($message) use ($email, $subject) {
                $message->to($email)
                    ->subject($subject)
                    ->from(config('mail.from.address'), config('mail.from.name'));
            });

            \Log::info("Newsletter sent to {$email}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send newsletter: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Send Admin Order Notification
     */
    public function sendAdminOrderNotification(Order $order): bool
    {
        try {
            $adminEmail = config('services.admin.email', 'admin@shopstyle.com');

            $data = [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'customer_email' => $order->customer_email,
                'total_amount' => $order->total_amount,
                'items_count' => $order->orderItems()->count(),
                'admin_link' => route('admin.orders.show', ['id' => $order->id]),
            ];

            Mail::send('emails.admin-order-notification', $data, function ($message) use ($adminEmail) {
                $message->to($adminEmail)
                    ->subject("New Order Received");
            });

            \Log::info("Admin notification email sent for order {$order->id}");
            return true;
        } catch (Exception $e) {
            \Log::error("Failed to send admin notification: " . $e->getMessage());
            return false;
        }
    }
}
