// app/services/bkashService.ts

import { apiUrl, adminToken } from "../common/http";

export interface BkashPaymentRequest {
  amount: number;
  orderId: string;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
}

export interface BkashPaymentResponse {
  paymentId: string;
  bkashURL: string;
  statusCode: string;
  statusMessage: string;
}

class BkashService {
  /**
   * Initialize bKash payment
   */
  static async initiatePayment(
    request: BkashPaymentRequest
  ): Promise<BkashPaymentResponse> {
    try {
      const response = await fetch(`${apiUrl}/payments/bkash/create`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify({
          amount: request.amount,
          order_id: request.orderId,
          customer_name: request.customerName,
          customer_email: request.customerEmail,
          customer_phone: request.customerPhone,
          callback_url: `${window.location.origin}/payment/bkash/callback`,
        }),
      });

      if (!response.ok) {
        throw new Error("Failed to initiate bKash payment");
      }

      const data = await response.json();
      return data.data;
    } catch (error) {
      console.error("bKash payment error:", error);
      throw error;
    }
  }

  /**
   * Execute payment after user confirmation
   */
  static async executePayment(paymentId: string): Promise<any> {
    try {
      const response = await fetch(`${apiUrl}/payments/bkash/execute`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify({
          payment_id: paymentId,
        }),
      });

      if (!response.ok) {
        throw new Error("Failed to execute bKash payment");
      }

      return await response.json();
    } catch (error) {
      console.error("bKash execution error:", error);
      throw error;
    }
  }

  /**
   * Verify payment status
   */
  static async verifyPayment(paymentId: string): Promise<any> {
    try {
      const response = await fetch(
        `${apiUrl}/payments/bkash/verify/${paymentId}`,
        {
          headers: {
            Authorization: `Bearer ${adminToken()}`,
          },
        }
      );

      if (!response.ok) {
        throw new Error("Failed to verify payment");
      }

      return await response.json();
    } catch (error) {
      console.error("Payment verification error:", error);
      throw error;
    }
  }
}

export default BkashService;
