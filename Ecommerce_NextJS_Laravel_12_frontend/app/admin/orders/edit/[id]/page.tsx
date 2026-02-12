"use client";

import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import Link from "next/link";
import AdminLayout from "../../../AdminLayout";
import { apiUrl, adminToken } from "../../../../common/http";

interface OrderForm {
  user_id: number | null;
  total_amount: number;
  discount_amount: number;
  shipping_fee: number;
  final_amount: number;
  status: "pending" | "paid" | "shipped" | "delivered" | "cancelled";
}

interface CustomerInfo {
  name?: string | null;
  email?: string | null;
  phone?: string | null;
}

export default function EditOrder() {
  const params = useParams();
  const router = useRouter();
  const orderId = Array.isArray(params?.id) ? params.id[0] : params?.id;

  const [form, setForm] = useState<OrderForm>({
    user_id: null,
    total_amount: 0,
    discount_amount: 0,
    shipping_fee: 0,
    final_amount: 0,
    status: "pending",
  });
  const [customerInfo, setCustomerInfo] = useState<CustomerInfo>({
    name: null,
    email: null,
    phone: null,
  });
  const [loading, setLoading] = useState(true);
  const [isSubmitting, setIsSubmitting] = useState(false);
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

        const data = result.data;

        setForm({
          user_id: data.user_id ?? null,
          total_amount: Number(data.total_amount || 0),
          discount_amount: Number(data.discount_amount || 0),
          shipping_fee: Number(data.shipping_fee || 0),
          final_amount: Number(data.final_amount || 0),
          status: data.status || "pending",
        });

        setCustomerInfo({
          name: data.customer_name ?? data.user?.name ?? null,
          email: data.customer_email ?? data.user?.email ?? null,
          phone: data.customer_phone ?? null,
        });
      } catch (err) {
        setError(err instanceof Error ? err.message : "Failed to load order");
      } finally {
        setLoading(false);
      }
    };

    fetchOrder();
  }, [orderId]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setForm((prev) => ({
      ...prev,
      [name]: ["total_amount", "discount_amount", "shipping_fee", "final_amount", "user_id"].includes(name)
        ? Number(value)
        : value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!orderId || isSubmitting) return;

    setIsSubmitting(true);
    setError(null);

    try {
      const payload: any = {
        total_amount: form.total_amount,
        discount_amount: form.discount_amount,
        shipping_fee: form.shipping_fee,
        final_amount: form.final_amount,
        status: form.status,
      };

      if (form.user_id !== null) {
        payload.user_id = form.user_id;
      }

      const res = await fetch(`${apiUrl}/orders/${orderId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify(payload),
      });

      const responseData = await res.json();

      if (!res.ok) {
        throw new Error(responseData?.message || "Failed to update order");
      }

      alert("Order updated successfully!");
      router.push("/admin/orders");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to update order");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <AdminLayout>
      <div className="p-4 max-w-4xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <h1 className="text-2xl font-bold">Edit Order</h1>
          <Link
            href="/admin/orders"
            className="bg-gray-600 text-white px-4 py-2 rounded-lg hover:bg-gray-700"
          >
            ← Back to Orders
          </Link>
        </div>

        {loading ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : error ? (
          <div className="text-center py-6 text-red-600">{error}</div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium mb-1">Customer ID</label>
              <input
                name="user_id"
                value={form.user_id ?? ""}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
                placeholder="Enter customer user ID"
              />
              <p className="text-xs text-gray-500 mt-1">
                Current: {form.user_id ?? "Guest"}
              </p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label className="block text-sm font-medium mb-1">Customer Name</label>
                <input
                  value={customerInfo.name ?? ""}
                  readOnly
                  className="w-full border border-gray-200 rounded-lg p-2 bg-gray-50"
                />
              </div>
              <div>
                <label className="block text-sm font-medium mb-1">Customer Email</label>
                <input
                  value={customerInfo.email ?? ""}
                  readOnly
                  className="w-full border border-gray-200 rounded-lg p-2 bg-gray-50"
                />
              </div>
              <div>
                <label className="block text-sm font-medium mb-1">Customer Phone</label>
                <input
                  value={customerInfo.phone ?? ""}
                  readOnly
                  className="w-full border border-gray-200 rounded-lg p-2 bg-gray-50"
                />
              </div>
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Total Amount</label>
              <input
                name="total_amount"
                value={form.total_amount}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
                required
              />
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Discount Amount</label>
              <input
                name="discount_amount"
                value={form.discount_amount}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
              />
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Shipping Fee</label>
              <input
                name="shipping_fee"
                value={form.shipping_fee}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
              />
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Final Amount</label>
              <input
                name="final_amount"
                value={form.final_amount}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
                required
              />
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Status</label>
              <select
                name="status"
                value={form.status}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
              >
                <option value="pending">Pending</option>
                <option value="paid">Paid</option>
                <option value="shipped">Shipped</option>
                <option value="delivered">Delivered</option>
                <option value="cancelled">Cancelled</option>
              </select>
            </div>

            <button
              type="submit"
              disabled={isSubmitting}
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 disabled:opacity-50"
            >
              {isSubmitting ? "Updating..." : "Update Order"}
            </button>
          </form>
        )}
      </div>
    </AdminLayout>
  );
}
