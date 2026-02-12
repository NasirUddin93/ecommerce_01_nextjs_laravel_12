"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

// TypeScript interface for category
export interface CouponUsage {
  id: number;
  coupon_id: number;
  user_id: number;
  order_id: number;
  used_to: Date;
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}


export default function CategoriesPage() {
  const [orderItems, setOrderItems] = useState<CouponUsage[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchOrders = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/coupon-usages`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      // console.log(result);
      setLoader(false);

      if (result.status === 200 && Array.isArray(result.data)) {
        console.log(result.data);
        setOrderItems(result.data);
      } else {
        // console.log("Error fetching orders:", result);
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching orders:", error);
    }
  };

  useEffect(() => {
    fetchOrders();
  }, []);

  const fmtDate = (d?: string | Date | null) => {
    if (!d) return "—";
    const date = typeof d === "string" ? new Date(d) : d;
    return date.toLocaleString();
  };

  // Filter coupon usages based on search text
  const filteredOrderItems = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return orderItems;
    return orderItems.filter((item) =>
      item.id.toString().includes(q) ||
      item.coupon_id.toString().includes(q) ||
      item.user_id.toString().includes(q) ||
      item.order_id.toString().includes(q)
    );
  }, [search, orderItems]);

  return (
    <AdminLayout>
      <div className="mb-6">
        <Breadcrumb
          items={[
            { label: "Admin", href: "/admin" },
            { label: "Coupon Usages" },
          ]}
        />
      </div>

      <div className="mb-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Coupon Usages</h1>
            <p className="text-sm text-gray-600 mt-1">Track coupon usage history</p>
          </div>
          <button
            onClick={() => fetchOrders()}
            className="px-4 py-2 rounded-lg border border-gray-300 hover:bg-gray-100 transition text-sm font-medium"
            title="Refresh"
          >
            ↻ Refresh
          </button>
        </div>
      </div>

      {/* Search Bar */}
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by ID, coupon ID, user ID, or order ID…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* States */}
      {loader && <div className="text-center py-8 text-gray-500">Loading...</div>}
      {!loader && filteredOrderItems.length === 0 && (
        <div className="text-center py-8 text-gray-500">No coupon usages found</div>
      )}

      {!loader && filteredOrderItems.length > 0 && (
        <ResponsiveTable<CouponUsage>
          data={filteredOrderItems}
          keyField="id"
          columns={[
            { key: "id", label: "ID", mobileHide: true },
            { key: "coupon_id", label: "Coupon ID" },
            { key: "user_id", label: "User ID" },
            { key: "order_id", label: "Order ID" },
            { key: "used_to", label: "Used At", mobileHide: true, render: (date) => fmtDate(date) },
            { key: "actions", label: "Actions", render: () => (
              <div className="flex gap-2 justify-center">
                <button
                  className="p-2 rounded hover:bg-blue-100 text-blue-600 transition"
                  title="View"
                >
                  👁
                </button>
                <button
                  className="p-2 rounded hover:bg-yellow-100 text-yellow-600 transition"
                  title="Edit"
                >
                  ✏️
                </button>
                <button
                  className="p-2 rounded hover:bg-red-100 text-red-600 transition"
                  title="Delete"
                >
                  🗑
                </button>
              </div>
            )},
          ]}
        />
      )}
    </AdminLayout>
  );
}