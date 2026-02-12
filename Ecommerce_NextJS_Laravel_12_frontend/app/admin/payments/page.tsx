"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

// TypeScript interface for category
interface Payment {
  id: number;
  order_id: number;
  user_id: number;
  payment_method: 'debit'|'credit'|'refund'|'chargeback';
  transaction_id: string;
  amount: number;
  status: 'pending'|'success'|'failed'|'refunded';
  created_at?: Date;
  updated_at?: Date;
  deleted_at?: Date | null;
}

export default function ProductVariants() {

  const [productVariants, setProductVariants] = useState<Payment[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchSizes = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/payments`, {
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
        setProductVariants(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching sizes:", error);
    }
  };

  useEffect(() => {
    fetchSizes();
  }, []);

  // Filter categories based on search text
  const filteredProductVariants = productVariants.filter((productVariants) =>
    productVariants.status.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Payments" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Payments</h1>
            <p className="text-gray-600 mt-1">Manage payment records</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search payments..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/payments/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Payment
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredProductVariants.length > 0 ? (
          <ResponsiveTable<Payment>
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "order_id", label: "Order ID" },
              { key: "payment_method", label: "Method" },
              { key: "transaction_id", label: "Transaction", mobileHide: true },
              { key: "amount", label: "Amount" },
              {
                key: "status",
                label: "Status",
                render: (value: Payment["status"]) => (
                  <span
                    className={`px-2 py-1 text-xs rounded-full ${
                      value === "success"
                        ? "bg-green-100 text-green-700"
                        : value === "pending"
                        ? "bg-yellow-100 text-yellow-700"
                        : "bg-red-100 text-red-700"
                    }`}
                  >
                    {value}
                  </span>
                ),
              },
              {
                key: "created_at",
                label: "Created",
                mobileHide: true,
                render: (value: Date | undefined) =>
                  value ? new Date(value).toLocaleDateString() : "—",
              },
              {
                key: "actions",
                label: "Actions",
                render: () => (
                  <div className="flex gap-2 justify-end flex-wrap">
                    <button
                      className="px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md text-sm font-medium"
                      title="View"
                      aria-label="View"
                    >
                      👁️
                    </button>
                    <button
                      className="px-3 py-2 text-yellow-600 hover:bg-yellow-50 rounded-md text-sm font-medium"
                      title="Edit"
                      aria-label="Edit"
                    >
                      ✏️
                    </button>
                    <button
                      className="px-3 py-2 text-red-600 hover:bg-red-50 rounded-md text-sm font-medium"
                      title="Delete"
                      aria-label="Delete"
                    >
                      🗑️
                    </button>
                  </div>
                ),
              },
            ]}
            data={filteredProductVariants}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">No payments found</div>
        )}
      </div>
    </AdminLayout>
  );
}