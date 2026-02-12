"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

interface OrderStatusHistory {
  id: number;
  order_id: number;
  old_status?: string | null;
  new_status: string;
  remarks?: string | null;
  changed_by?: string | null;
  change_source?: string | null;
  created_at?: string;
}

export default function OrderStatusHistoryPage() {
  const [statusHistory, setStatusHistory] = useState<OrderStatusHistory[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchStatusHistory = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/order-status-history`, {
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
        setStatusHistory(result.data);
      } else if (result.data && Array.isArray(result.data)) {
        setStatusHistory(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching order status history:", error);
    }
  };

  useEffect(() => {
    fetchStatusHistory();
  }, []);

  const filteredHistory = useMemo(() => {
    const term = search.toLowerCase();
    if (!term) {
      return statusHistory;
    }

    return statusHistory.filter((item) => {
      return (
        String(item.order_id).includes(term) ||
        (item.new_status || "").toLowerCase().includes(term) ||
        (item.old_status || "").toLowerCase().includes(term) ||
        (item.remarks || "").toLowerCase().includes(term) ||
        (item.change_source || "").toLowerCase().includes(term)
      );
    });
  }, [statusHistory, search]);

  const getStatusColor = (status: string) => {
    const colors: Record<string, string> = {
      pending: "bg-yellow-100 text-yellow-700",
      paid: "bg-blue-100 text-blue-700",
      shipped: "bg-purple-100 text-purple-700",
      delivered: "bg-green-100 text-green-700",
      cancelled: "bg-red-100 text-red-700",
      refunded: "bg-orange-100 text-orange-700",
    };
    return colors[status] || "bg-gray-100 text-gray-700";
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Order Status History" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Order Status History</h1>
            <p className="text-gray-600 mt-1">Track order status changes</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by order ID, status, remarks, or source..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredHistory.length > 0 ? (
          <ResponsiveTable<OrderStatusHistory>
            columns={[
              { key: "id", label: "#", mobileHide: true },
              { key: "order_id", label: "Order ID" },
              {
                key: "old_status",
                label: "Old Status",
                mobileHide: true,
                render: (value: string | null | undefined) =>
                  value ? (
                    <span
                      className={`px-3 py-1 rounded text-xs font-semibold ${getStatusColor(
                        value
                      )}`}
                    >
                      {value}
                    </span>
                  ) : (
                    "—"
                  ),
              },
              {
                key: "new_status",
                label: "New Status",
                render: (value: string) => (
                  <span
                    className={`px-3 py-1 rounded text-xs font-semibold ${getStatusColor(
                      value
                    )}`}
                  >
                    {value}
                  </span>
                ),
              },
              { key: "remarks", label: "Remarks", mobileHide: true },
              { key: "changed_by", label: "Changed By", mobileHide: true },
              {
                key: "change_source",
                label: "Source",
                mobileHide: true,
                render: (value: string | null | undefined) => (
                  <span className="px-2 py-1 bg-gray-200 text-gray-700 rounded text-xs">
                    {value || "system"}
                  </span>
                ),
              },
              {
                key: "created_at",
                label: "Date & Time",
                mobileHide: true,
                render: (value: string | undefined) =>
                  value ? new Date(value).toLocaleString() : "—",
              },
            ]}
            data={filteredHistory}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">
            No order status history found
          </div>
        )}
      </div>
    </AdminLayout>
  );
}
