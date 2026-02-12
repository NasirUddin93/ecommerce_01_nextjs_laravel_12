"use client";

import { useEffect, useState } from "react";
import { useParams } from "next/navigation";
import Link from "next/link";
import AdminLayout from "../../AdminLayout";
import { apiUrl, adminToken } from "../../../common/http";
import Breadcrumb from "../../components/Breadcrumb";

interface OrderUser {
  id: number;
  name?: string | null;
  email?: string | null;
}

interface OrderItemProduct {
  id: number;
  name: string;
  sku?: string | null;
}

interface OrderItem {
  id: number;
  product_id: number;
  quantity: number;
  price_at_purchase: number;
  product?: OrderItemProduct | null;
}

interface OrderDetail {
  id: number;
  user_id: number | null;
  customer_name?: string | null;
  customer_email?: string | null;
  customer_phone?: string | null;
  shipping_address?: string | null;
  city?: string | null;
  state?: string | null;
  postal_code?: string | null;
  country?: string | null;
  total_amount: number;
  discount_amount: number;
  shipping_fee: number;
  final_amount: number;
  payment_method?: string | null;
  status: "pending" | "paid" | "shipped" | "delivered" | "cancelled";
  created_at?: string;
  updated_at?: string;
  user?: OrderUser | null;
  items?: OrderItem[];
}

export default function OrderDetailsPage() {
  const params = useParams();
  const orderId = Array.isArray(params?.id) ? params.id[0] : params?.id;

  const [order, setOrder] = useState<OrderDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!orderId) return;

    const fetchOrder = async () => {
      try {
        setLoading(true);
        setError(null);

        const res = await fetch(`${apiUrl}/orders/${orderId}`, {
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${adminToken()}`,
          },
        });

        const result = await res.json();

        if (!res.ok || !result?.data) {
          throw new Error(result?.message || "Failed to load order");
        }

        setOrder(result.data);
      } catch (err) {
        setError(err instanceof Error ? err.message : "Failed to load order");
      } finally {
        setLoading(false);
      }
    };

    fetchOrder();
  }, [orderId]);

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-6xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Orders", href: "/admin/orders" },
            { label: `Order #${orderId}` },
          ]}
        />

        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
          <h1 className="text-2xl font-bold">Order Details</h1>
          <Link
            href="/admin/orders"
            className="text-blue-600 hover:text-blue-800 text-sm"
          >
            ← Back to Orders
          </Link>
        </div>

        {loading ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : error ? (
          <div className="text-center py-6 text-red-600">{error}</div>
        ) : !order ? (
          <div className="text-center py-6 text-gray-500">Order not found</div>
      ) : (
        <div className="space-y-6">
          <div className="bg-white shadow rounded-lg p-4 sm:p-6">
            <h2 className="text-lg font-semibold mb-4">Order Summary</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm text-gray-700">
              <div><strong>Order ID:</strong> {order.id}</div>
              <div><strong>Status:</strong> {order.status}</div>
              <div><strong>Total Amount:</strong> ৳{Number(order.total_amount || 0).toLocaleString()}</div>
              <div><strong>Discount:</strong> ৳{Number(order.discount_amount || 0).toLocaleString()}</div>
              <div><strong>Shipping Fee:</strong> ৳{Number(order.shipping_fee || 0).toLocaleString()}</div>
              <div><strong>Final Amount:</strong> ৳{Number(order.final_amount || 0).toLocaleString()}</div>
              <div><strong>Payment Method:</strong> {order.payment_method || "N/A"}</div>
              <div><strong>Created:</strong> {order.created_at ? new Date(order.created_at).toLocaleString() : "N/A"}</div>
            </div>
          </div>

          <div className="bg-white shadow rounded-lg p-4 sm:p-6">
            <h2 className="text-lg font-semibold mb-4">Customer Details</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm text-gray-700">
              <div><strong>User ID:</strong> {order.user_id ?? "Guest"}</div>
              <div><strong>Name:</strong> {order.customer_name || order.user?.name || "N/A"}</div>
              <div><strong>Email:</strong> {order.customer_email || order.user?.email || "N/A"}</div>
              <div><strong>Phone:</strong> {order.customer_phone || "N/A"}</div>
              <div><strong>Address:</strong> {order.shipping_address || "N/A"}</div>
              <div><strong>City:</strong> {order.city || "N/A"}</div>
              <div><strong>State:</strong> {order.state || "N/A"}</div>
              <div><strong>Postal Code:</strong> {order.postal_code || "N/A"}</div>
              <div><strong>Country:</strong> {order.country || "N/A"}</div>
            </div>
          </div>

          <div className="bg-white shadow rounded-lg p-4 sm:p-6">
            <h2 className="text-lg font-semibold mb-4">Order Items</h2>
            {order.items && order.items.length > 0 ? (
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm text-left text-gray-600">
                  <thead className="bg-gray-100 text-gray-700 uppercase text-xs">
                    <tr>
                      <th className="px-4 py-3">Product</th>
                      <th className="px-4 py-3">Quantity</th>
                      <th className="px-4 py-3">Price</th>
                      <th className="px-4 py-3">Subtotal</th>
                    </tr>
                  </thead>
                  <tbody>
                    {order.items.map((item) => (
                      <tr key={item.id} className="border-b hover:bg-gray-50">
                        <td className="px-4 py-3">
                          {item.product?.name || `Product #${item.product_id}`}
                        </td>
                        <td className="px-4 py-3">{item.quantity}</td>
                        <td className="px-4 py-3">৳{Number(item.price_at_purchase || 0).toLocaleString()}</td>
                        <td className="px-4 py-3">
                          ৳{Number((item.price_at_purchase || 0) * (item.quantity || 0)).toLocaleString()}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className="text-sm text-gray-500">No items found for this order.</div>
            )}
          </div>
        </div>
      )}
      </div>
    </AdminLayout>
  );
}
