"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { apiUrl } from "../../common/http";
import PaymentMethodSelector from "../PaymentMethodSelector";
import BkashService from "../../services/bkashService";
import { useCart } from "../../contexts/CartContext";

interface CheckoutItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

interface OrderData {
  customer_name: string;
  customer_email: string;
  customer_phone: string;
  shipping_address: string;
  city: string;
  postal_code: string;
  payment_method: string;
  total_amount: number;
}

export default function PaymentPage() {
  const router = useRouter();
  const { clearCart } = useCart();
  const [selectedPaymentMethod, setSelectedPaymentMethod] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [cartItems, setCartItems] = useState<CheckoutItem[]>([]);
  const [orderData, setOrderData] = useState<OrderData | null>(null);
  const [error, setError] = useState("");

  // Fetch cart and order data
  useEffect(() => {
    const fetchCheckoutData = async () => {
      try {
        // Get cart from localStorage or API
        const cartData = localStorage.getItem("cart");
        if (cartData) {
          setCartItems(JSON.parse(cartData));
        }

        // Get order details from localStorage
        const orderInfo = localStorage.getItem("orderData");
        if (orderInfo) {
          setOrderData(JSON.parse(orderInfo));
        }
      } catch (err) {
        console.error("Error fetching checkout data:", err);
        setError("Failed to load checkout information");
      }
    };

    fetchCheckoutData();
  }, []);

  const totalAmount =
    cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0) || 
    orderData?.total_amount || 0;

  const handlePaymentSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!selectedPaymentMethod) {
      alert("Please select a payment method");
      return;
    }

    if (!orderData) {
      setError("Order information is missing");
      return;
    }

    setIsLoading(true);

    try {
      // Add payment method to order data
      const completeOrderData = {
        ...orderData,
        payment_method: selectedPaymentMethod,
      };

      console.log("Submitting order:", completeOrderData);

      // Create order via API
      const response = await fetch(`${apiUrl}/customer-orders`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: JSON.stringify(completeOrderData),
      });

      const result = await response.json();
      console.log("Order response:", result);

      if (!response.ok) {
        throw new Error(result.message || 'Failed to create order');
      }

      const orderId = result.order.id;

      // Handle different payment methods
      if (selectedPaymentMethod === "cod") {
        // Cash on Delivery - Order confirmed
        alert(`✅ Order placed successfully! Your order ID: ${orderId}`);
        clearCart();
        setCartItems([]);
        localStorage.removeItem("cart");
        localStorage.removeItem("orderData");
        localStorage.removeItem("cartItems");
        router.push(`/orders?email=${encodeURIComponent(orderData.customer_email)}&status=success&orderId=${orderId}`);
      } else if (selectedPaymentMethod === "bkash") {
        // bKash payment - In future, redirect to bKash gateway
        alert("🔔 Order created! Proceeding to bKash payment.");
        alert(`Order ID: ${orderId}`);
        // TODO: Integrate with bKash payment gateway
        // const paymentData = await BkashService.initiatePayment({...});
        // window.location.href = paymentData.bkashURL;
        
        // For now, redirect to orders page
        clearCart();
        setCartItems([]);
        localStorage.removeItem("cart");
        localStorage.removeItem("orderData");
        localStorage.removeItem("cartItems");
        router.push(`/orders?email=${encodeURIComponent(orderData.customer_email)}`);
      } else if (selectedPaymentMethod === "nagad" || selectedPaymentMethod === "rocket") {
        alert(`✅ Order created! Order ID: ${orderId}`);
        alert(`${selectedPaymentMethod.toUpperCase()} payment integration coming soon.`);
        clearCart();
        setCartItems([]);
        localStorage.removeItem("cart");
        localStorage.removeItem("orderData");
        localStorage.removeItem("cartItems");
        router.push(`/orders?email=${encodeURIComponent(orderData.customer_email)}`);
      }
    } catch (err) {
      console.error("Payment error:", err);
      const errorMessage = err instanceof Error ? err.message : "Payment failed";
      setError(errorMessage);
      alert("❌ " + errorMessage);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-6xl mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {/* Payment Form */}
          <div className="md:col-span-2">
            <div className="bg-white rounded-lg shadow p-6">
              {error && (
                <div className="mb-4 p-4 bg-red-50 border border-red-200 rounded-lg">
                  <p className="text-red-600">{error}</p>
                </div>
              )}

              <form onSubmit={handlePaymentSubmit} className="space-y-6">
                {/* Customer Information */}
                <div>
                  <h2 className="text-lg font-bold text-gray-800 mb-4">
                    Delivery Information
                  </h2>
                  <div className="space-y-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Full Name
                      </label>
                      <input
                        type="text"
                        value={orderData?.customer_name || ""}
                        disabled
                        className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                      />
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">
                          Email
                        </label>
                        <input
                          type="email"
                          value={orderData?.customer_email || ""}
                          disabled
                          className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                        />
                      </div>

                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">
                          Phone Number
                        </label>
                        <input
                          type="tel"
                          value={orderData?.customer_phone || ""}
                          disabled
                          className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                        />
                      </div>
                    </div>

                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Delivery Address
                      </label>
                      <input
                        type="text"
                        value={orderData?.shipping_address || ""}
                        disabled
                        className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                      />
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">
                          City
                        </label>
                        <input
                          type="text"
                          value={orderData?.city || ""}
                          disabled
                          className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                        />
                      </div>

                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">
                          Postal Code
                        </label>
                        <input
                          type="text"
                          value={orderData?.postal_code || ""}
                          disabled
                          className="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-50 text-gray-600"
                        />
                      </div>
                    </div>
                  </div>
                </div>

                {/* Payment Method Selection */}
                <PaymentMethodSelector
                  selectedMethod={selectedPaymentMethod}
                  onMethodChange={setSelectedPaymentMethod}
                />

                {/* Submit Button */}
                <button
                  type="submit"
                  disabled={isLoading || !selectedPaymentMethod}
                  className="w-full bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 font-bold disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
                >
                  {isLoading ? "Processing..." : "Confirm Order & Proceed to Payment"}
                </button>
              </form>
            </div>
          </div>

          {/* Order Summary */}
          <div className="md:col-span-1">
            <div className="bg-white rounded-lg shadow p-6 sticky top-4">
              <h2 className="text-lg font-bold text-gray-800 mb-4">Order Summary</h2>

              <div className="space-y-4 mb-4">
                {cartItems.map((item) => (
                  <div key={item.id} className="flex justify-between text-gray-600 text-sm">
                    <span>
                      {item.name} x {item.quantity}
                    </span>
                    <span>৳ {(item.price * item.quantity).toFixed(2)}</span>
                  </div>
                ))}
              </div>

              <div className="border-t border-gray-200 pt-4">
                <div className="flex justify-between text-lg font-bold text-gray-800">
                  <span>Total:</span>
                  <span>৳ {totalAmount.toFixed(2)}</span>
                </div>
              </div>

              {/* Payment Method Info */}
              {selectedPaymentMethod && (
                <div className="mt-4 p-3 bg-blue-50 rounded-lg border border-blue-200">
                  <p className="text-xs text-gray-600 font-medium">
                    Selected Payment Method:{" "}
                    {selectedPaymentMethod === "cod"
                      ? "Cash on Delivery"
                      : selectedPaymentMethod.toUpperCase()}
                  </p>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
