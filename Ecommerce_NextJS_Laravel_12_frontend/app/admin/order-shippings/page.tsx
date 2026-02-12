"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

// TypeScript interface for category
export interface OrderShipping {
  id: number;
  order_id: number;
  shipping_method_id: number;
  address: string;
  tracking_number: number;
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}


export default function CategoriesPage() {
  const [orderItems, setOrderItems] = useState<OrderShipping[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchOrders = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/order-shippings`, {
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

  // Filter categories based on search text
  const filteredOrderItems = orderItems.filter((orderItem) =>
    orderItem.id.toString().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Order Shippings" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Order Shippings</h1>
            <p className="text-gray-600 mt-1">Manage shipment records</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search orders..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/order-shippings/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Order Shipping
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredOrderItems.length > 0 ? (
          <ResponsiveTable<OrderShipping>
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "order_id", label: "Order ID" },
              { key: "address", label: "Address" },
              { key: "tracking_number", label: "Tracking", mobileHide: true },
              {
                key: "created_at",
                label: "Created",
                mobileHide: true,
                render: (value: string | undefined) =>
                  value ? new Date(value).toLocaleDateString() : "—",
              },
              {
                key: "actions",
                label: "Actions",
                render: () => (
                  <div className="flex gap-2 justify-end flex-wrap">
                    <button className="px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md text-sm font-medium" title="View" aria-label="View">👁️</button>
                    <button className="px-3 py-2 text-yellow-600 hover:bg-yellow-50 rounded-md text-sm font-medium" title="Edit" aria-label="Edit">✏️</button>
                    <button className="px-3 py-2 text-red-600 hover:bg-red-50 rounded-md text-sm font-medium" title="Delete" aria-label="Delete">🗑️</button>
                  </div>
                ),
              },
            ]}
            data={filteredOrderItems}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">No order found</div>
        )}
      </div>
    </AdminLayout>
  );
}