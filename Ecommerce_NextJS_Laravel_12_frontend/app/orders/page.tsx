// app/orders/page.tsx
"use client";

import { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import Layout from "../components/Layouts";
import ProtectedRoute from "../components/ProtectedRoute";
import { apiUrl } from "../common/http";
import { Calendar, Package, MapPin, DollarSign, X } from "lucide-react";
import Link from "next/link";

interface OrderItem {
  id: number;
  product_id: number;
  quantity: number;
  price_at_purchase: number;
  product: {
    id: number;
    name: string;
    images: Array<{ image_url: string }>;
  };
}

interface Order {
  id: number;
  customer_name: string;
  customer_email: string;
  customer_phone: string;
  shipping_address: string;
  city: string;
  postal_code: string;
  country: string;
  total_amount: number;
  final_amount: number;
  payment_method: string;
  status: string;
  created_at: string;
  items: OrderItem[];
}

function OrdersContent() {
  const searchParams = useSearchParams();
  const [orders, setOrders] = useState<Order[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [customerEmail, setCustomerEmail] = useState("");
  const [showSuccess, setShowSuccess] = useState(false);

  useEffect(() => {
    // Get email from query params or prompt user
    const emailParam = searchParams.get("email");

    const storedEmail = typeof window !== "undefined" ? localStorage.getItem("userEmail") : null;
    const effectiveEmail = emailParam || storedEmail || "";

    if (effectiveEmail) {
      setCustomerEmail(effectiveEmail);
      fetchOrders(effectiveEmail);

      // Show success message if order was just created
      if (searchParams.get("status") === "success") {
        setShowSuccess(true);
        setTimeout(() => setShowSuccess(false), 5000);
      }
    } else {
      setLoading(false);
    }
  }, [searchParams]);

  const fetchOrders = async (email: string) => {
    try {
      setLoading(true);
      setError("");

      const response = await fetch(`${apiUrl}/customer-orders?email=${encodeURIComponent(email)}`);
      
      if (!response.ok) {
        throw new Error("Failed to fetch orders");
      }

      const data = await response.json();
      setOrders(Array.isArray(data) ? data : []);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load orders");
      setOrders([]);
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (customerEmail) {
      fetchOrders(customerEmail);
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case "pending":
        return "bg-yellow-100 text-yellow-800";
      case "confirmed":
        return "bg-blue-100 text-blue-800";
      case "processing":
        return "bg-purple-100 text-purple-800";
      case "shipped":
        return "bg-cyan-100 text-cyan-800";
      case "delivered":
        return "bg-green-100 text-green-800";
      case "cancelled":
        return "bg-red-100 text-red-800";
      default:
        return "bg-gray-100 text-gray-800";
    }
  };

  const handleCancelOrder = async (orderId: number) => {
    if (!window.confirm("Are you sure you want to cancel this order?")) {
      return;
    }

    try {
      const response = await fetch(`${apiUrl}/customer-orders/${orderId}/cancel?email=${encodeURIComponent(customerEmail)}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error("Failed to cancel order");
      }

      // Refresh orders
      fetchOrders(customerEmail);
      alert("Order cancelled successfully");
    } catch (err) {
      alert(err instanceof Error ? err.message : "Failed to cancel order");
    }
  };

  return (
    <ProtectedRoute fallbackUrl="/login?redirect=/orders">
      <Layout>
        <div className="max-w-6xl mx-auto px-4 py-8">
          <div className="mb-8">
            <h1 className="text-3xl font-bold text-gray-900 mb-6">Your Orders</h1>

            {/* Search Form */}
            <form onSubmit={handleSearch} className="mb-8 bg-white p-6 rounded-lg shadow-sm border border-gray-100">
              <div className="flex gap-4">
                <input
                  type="email"
                  placeholder="Enter your email address"
                value={customerEmail}
                onChange={(e) => setCustomerEmail(e.target.value)}
                className="flex-1 border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                required
              />
              <button
                type="submit"
                className="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-semibold transition-colors"
              >
                View Orders
              </button>
            </div>
            {error && (
              <p className="text-red-600 text-sm mt-2">{error}</p>
            )}
          </form>

          {/* Success Message */}
          {showSuccess && (
            <div className="mb-6 p-4 bg-green-50 border border-green-200 rounded-lg flex items-start gap-3">
              <div className="text-green-600">✓</div>
              <div>
                <h3 className="font-semibold text-green-900">Order Placed Successfully!</h3>
                <p className="text-green-700 text-sm">Your order has been created and is pending confirmation.</p>
              </div>
            </div>
          )}
        </div>

        {/* Loading State */}
        {loading && customerEmail && (
          <div className="text-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
            <p className="text-gray-600">Loading orders...</p>
          </div>
        )}

        {/* Empty State */}
        {!loading && customerEmail && orders.length === 0 && !error && (
          <div className="text-center py-12">
            <Package className="mx-auto h-16 w-16 text-gray-400 mb-4" />
            <h2 className="text-2xl font-bold text-gray-900 mb-2">No orders found</h2>
            <p className="text-gray-600 mb-6">You haven't placed any orders yet.</p>
            <Link
              href="/"
              className="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors inline-block"
            >
              Start Shopping
            </Link>
          </div>
        )}

        {/* Orders List */}
        {!loading && orders.length > 0 && (
          <div className="space-y-6">
            {orders.map((order) => (
              <div key={order.id} className="bg-white rounded-lg shadow-sm border border-gray-100 overflow-hidden">
                {/* Order Header */}
                <div className="bg-gray-50 p-6 border-b border-gray-100">
                  <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                      <p className="text-sm text-gray-600">Order ID</p>
                      <p className="text-lg font-bold text-gray-900">#{order.id}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-600">Order Date</p>
                      <p className="text-lg font-semibold text-gray-900">
                        {new Date(order.created_at).toLocaleDateString()}
                      </p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-600">Status</p>
                      <span className={`inline-block px-3 py-1 rounded-full text-sm font-semibold mt-1 ${getStatusColor(order.status)}`}>
                        {order.status.charAt(0).toUpperCase() + order.status.slice(1)}
                      </span>
                    </div>
                    <div>
                      <p className="text-sm text-gray-600">Total Amount</p>
                      <p className="text-lg font-bold text-gray-900">৳{parseFloat(order.final_amount).toFixed(2)}</p>
                    </div>
                  </div>
                </div>

                {/* Order Items */}
                <div className="p-6 border-b border-gray-100">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Order Items</h3>
                  <div className="space-y-3">
                    {order.items && order.items.map((item) => (
                      <div key={item.id} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                        <div className="flex-1">
                          <p className="font-semibold text-gray-900">{item.product.name}</p>
                          <p className="text-sm text-gray-600">Quantity: {item.quantity}</p>
                        </div>
                        <div className="text-right">
                          <p className="font-semibold text-gray-900">৳{parseFloat(item.price_at_purchase).toFixed(2)}</p>
                          <p className="text-sm text-gray-600">Unit price</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Shipping Info */}
                <div className="p-6 border-b border-gray-100">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Shipping Address</h3>
                  <div className="flex gap-2 text-gray-700">
                    <MapPin className="h-5 w-5 text-gray-600 flex-shrink-0 mt-0.5" />
                    <div>
                      <p>{order.shipping_address}</p>
                      <p>{order.city}, {order.postal_code}</p>
                      <p>{order.country}</p>
                    </div>
                  </div>
                </div>

                {/* Order Footer */}
                <div className="p-6 bg-gray-50 flex justify-between items-center">
                  <div>
                    <p className="text-sm text-gray-600">Payment Method</p>
                    <p className="font-semibold text-gray-900">{order.payment_method.toUpperCase()}</p>
                  </div>
                  {["pending", "confirmed"].includes(order.status) && (
                    <button
                      onClick={() => handleCancelOrder(order.id)}
                      className="flex items-center gap-2 px-4 py-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                    >
                      <X className="h-4 w-4" />
                      Cancel Order
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Not Searched Yet */}
        {!loading && !customerEmail && (
          <div className="text-center py-12">
            <Package className="mx-auto h-16 w-16 text-gray-400 mb-4" />
            <h2 className="text-2xl font-bold text-gray-900 mb-2">View Your Orders</h2>
            <p className="text-gray-600">Enter your email address above to view your order history.</p>
          </div>
        )}
      </div>
    </Layout>
    </ProtectedRoute>
  );
}

export default function OrdersPage() {
  return (
    <Suspense
      fallback={
        <ProtectedRoute>
          <Layout>
            <div className="min-h-screen bg-gray-50 py-8 px-4 sm:px-6 lg:px-8">
              <div className="text-center">
                <div className="animate-spin rounded-full h-12 w-12 border-b-4 border-blue-600 mx-auto mb-4"></div>
                <p className="text-gray-600">Loading your orders...</p>
              </div>
            </div>
          </Layout>
        </ProtectedRoute>
      }
    >
      <OrdersContent />
    </Suspense>
  );
}