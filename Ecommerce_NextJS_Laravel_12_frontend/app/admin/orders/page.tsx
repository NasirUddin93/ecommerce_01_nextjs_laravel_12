"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable, { Column } from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for category
export interface Order {
  id: number;
  user_id: number;
  total_amount: number;
  discount_amount: number;
  shipping_fee: number;
  final_amount: number;
  status: 'pending' | 'paid' | 'shipped' | 'delivered' | 'cancelled';
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}

interface PaginationData {
  total: number;
  per_page: number;
  current_page: number;
  last_page: number;
  from: number;
  to: number;
}

export default function OrdersPage() {
  const [orders, setOrders] = useState<Order[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchOrders = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/orders?page=${page}&per_page=${perPage}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      setLoader(false);

      if (result.status === 200 && Array.isArray(result.data)) {
        console.log(result.data);
        setOrders(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching orders:", error);
    }
  };

  useEffect(() => {
    fetchOrders(currentPage);
  }, [perPage]);

  // Filter orders based on search text
  const filteredOrders = orders.filter((order) =>
    order.id.toString().includes(search.toLowerCase())
  );

  const handlePageChange = (page: number) => {
    fetchOrders(page);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Orders" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <h1 className="text-2xl font-bold">Orders</h1>

          {/* Search and Add Button */}
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search orders by ID..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 p-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/orders/create"
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Order
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredOrders.length > 0 ? (
          <>
            <ResponsiveTable<Order>
            columns={[
              {
                key: "id",
                label: "Order ID",
              },
              {
                key: "user_id",
                label: "Customer ID",
                mobileHide: true,
              },
              {
                key: "total_amount",
                label: "Subtotal",
                render: (amount: number) => `৳${parseFloat(amount.toString()).toFixed(2)}`,
                mobileHide: true,
              },
              {
                key: "discount_amount",
                label: "Discount",
                render: (amount: number) => `৳${parseFloat(amount.toString()).toFixed(2)}`,
                mobileHide: true,
              },
              {
                key: "shipping_fee",
                label: "Shipping",
                render: (amount: number) => `৳${parseFloat(amount.toString()).toFixed(2)}`,
                mobileHide: true,
              },
              {
                key: "final_amount",
                label: "Total",
                render: (amount: number) => `৳${parseFloat(amount.toString()).toFixed(2)}`,
              },
              {
                key: "status",
                label: "Status",
                render: (status: string) => (
                  <span
                    className={`px-2 py-1 text-xs font-semibold rounded ${
                      status === "paid"
                        ? "bg-green-100 text-green-700"
                        : "bg-yellow-100 text-yellow-700"
                    }`}
                  >
                    {status.charAt(0).toUpperCase() + status.slice(1)}
                  </span>
                ),
              },
              {
                key: "id",
                label: "Actions",
                render: (id: number) => (
                  <div className="flex gap-2 justify-end flex-wrap">
                    <Link
                      href={`/admin/orders/${id}`}
                      className="text-blue-600 hover:text-blue-800 p-2 rounded hover:bg-blue-50 inline-block"
                      title="View"
                    >
                      👁
                    </Link>
                    <Link
                      href={`/admin/orders/edit/${id}`}
                      className="text-yellow-600 hover:text-yellow-800 p-2 rounded hover:bg-yellow-50 inline-block"
                      title="Edit"
                    >
                      ✏️
                    </Link>
                    <button
                      className="text-red-600 hover:text-red-800 p-2 rounded hover:bg-red-50"
                      title="Delete"
                    >
                      🗑
                    </button>
                  </div>
                ),
              },
            ]}
            data={filteredOrders}
            keyField="id"
            loading={loader}
          />

          {/* Pagination Controls */}
          {pagination && pagination.last_page > 1 && (
            <div className="mt-6 bg-white p-4 rounded-lg shadow space-y-4">
              <div className="flex flex-col sm:flex-row items-center justify-between gap-4">
                {/* Info */}
                <div className="text-sm text-gray-600 text-center sm:text-left">
                  Showing <strong>{pagination.from}</strong> to <strong>{pagination.to}</strong> of{" "}
                  <strong>{pagination.total}</strong> orders
                </div>

                {/* Items per page selector */}
                <div className="flex items-center gap-2">
                  <label className="text-sm text-gray-600">Per page:</label>
                  <select
                    value={perPage}
                    onChange={(e) => setPerPage(parseInt(e.target.value))}
                    className="p-2 border border-gray-300 rounded text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  >
                    <option value={5}>5</option>
                    <option value={10}>10</option>
                    <option value={25}>25</option>
                    <option value={50}>50</option>
                  </select>
                </div>
              </div>

              {/* Page buttons */}
              <ResponsivePagination
                currentPage={currentPage}
                lastPage={pagination.last_page}
                onPageChange={handlePageChange}
              />
            </div>
          )}
        </>
      ) : (
        <div className="text-center py-6 text-gray-500">
          No order found
        </div>
      )}
      </div>
    </AdminLayout>
  );
}