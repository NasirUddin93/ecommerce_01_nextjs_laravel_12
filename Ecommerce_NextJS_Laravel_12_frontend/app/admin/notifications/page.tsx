"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

type NotificationType = "order" | "payment" | "shipping" | "system" | "other";

export interface Notification {
  id: number;
  user_id: number;
  title: string;
  message: string;
  type: NotificationType;
  is_read: boolean | number;   // Laravel might return 0/1
  read_at?: Date | null;
  created_at?: Date;
  updated_at?: Date;
}

interface ApiListResponse<T> {
  status: number;
  data: T[];
  message?: string;
}

export default function NotificationsPage() {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<{total: number; per_page: number; current_page: number; last_page: number; from: number; to: number} | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchNotifications = async (page: number = 1) => {
    try {
      setLoader(true);
      setError(null);

      const res = await fetch(`${apiUrl}/notifications?page=${page}&per_page=${perPage}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        cache: "no-store",
      });

      const result: ApiListResponse<Notification> = await res.json();
      setLoader(false);

      if (result?.status === 200 && Array.isArray(result?.data)) {
        setNotifications(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        setError("Unexpected API response.");
        console.error("Unexpected response:", result);
      }
    } catch (e) {
      setLoader(false);
      setError("Failed to load notifications.");
      console.error("Error fetching notifications:", e);
    }
  };

  useEffect(() => {
    fetchNotifications(currentPage);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [perPage]);

  const handlePageChange = (page: number) => {
    fetchNotifications(page);
  };

  const handlePerPageChange = (newPerPage: number) => {
    setPerPage(newPerPage);
    setCurrentPage(1);
  };

  const asBool = (v: boolean | number) => (typeof v === "boolean" ? v : Number(v) === 1);
  const fmtDate = (d?: string | Date | null) => {
    if (!d) return "—";
    const date = typeof d === "string" ? new Date(d) : d;
    return date.toLocaleString();
  };

  const getTypeColor = (type: NotificationType) => {
    const colors: Record<NotificationType, string> = {
      order: "bg-blue-100 text-blue-700",
      payment: "bg-green-100 text-green-700",
      shipping: "bg-purple-100 text-purple-700",
      system: "bg-gray-100 text-gray-700",
      other: "bg-gray-100 text-gray-700",
    };
    return colors[type] || "bg-gray-100 text-gray-700";
  };

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return notifications;
    return notifications.filter((n) => {
      const idMatch = n.id.toString().includes(q);
      const userMatch = n.user_id.toString().includes(q);
      const titleMatch = n.title?.toLowerCase().includes(q);
      const msgMatch = (n.message ?? "").toLowerCase().includes(q);
      const typeMatch = (n.type ?? "").toLowerCase().includes(q);
      return idMatch || userMatch || titleMatch || msgMatch || typeMatch;
    });
  }, [search, notifications]);

  return (
    <AdminLayout>
      <div className="mb-6">
        <Breadcrumb
          items={[
            { label: "Admin", href: "/admin" },
            { label: "Notifications" },
          ]}
        />
      </div>

      <div className="mb-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Notifications</h1>
            <p className="text-sm text-gray-600 mt-1">Manage system notifications</p>
          </div>
          <button
            onClick={() => fetchNotifications(currentPage)}
            className="px-4 py-2 rounded-lg border border-gray-300 hover:bg-gray-100 transition text-sm font-medium"
            title="Refresh notifications"
          >
            ↻ Refresh
          </button>
        </div>
      </div>

      {/* Search Bar */}
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by ID, user, title, message, or type…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* States */}
      {loader && <div className="text-center py-8 text-gray-500">Loading...</div>}
      {!loader && error && <div className="text-center py-8 text-red-600">{error}</div>}
      {!loader && !error && filtered.length === 0 && (
        <div className="text-center py-8 text-gray-500">No notifications found</div>
      )}

      {!loader && !error && filtered.length > 0 && (
        <>
          <ResponsiveTable<Notification>
            data={filtered}
            keyField="id"
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "user_id", label: "User ID" },
              { key: "message", label: "Message", render: (msg) => (
                <span className="line-clamp-2">{msg}</span>
              )},
              { key: "type", label: "Type", render: (type) => (
                <span className={`px-2 py-1 text-xs rounded-full font-medium capitalize ${getTypeColor(type)}`}>
                  {type}
                </span>
              )},
              { key: "is_read", label: "Status", render: (value) => {
                const read = asBool(value);
                return (
                  <span className={`px-2 py-1 text-xs rounded-full font-medium ${
                    read ? "bg-green-100 text-green-700" : "bg-yellow-100 text-yellow-700"
                  }`}>
                    {read ? "Read" : "Unread"}
                  </span>
                );
              }},
              { key: "read_at", label: "Read At", mobileHide: true, render: (date) => fmtDate(date) },
              { key: "created_at", label: "Created", mobileHide: true, render: (date) => fmtDate(date) },
              { key: "actions", label: "Actions", render: (_, row) => (
                <div className="flex gap-2 justify-center">
                  <button
                    className="p-2 rounded hover:bg-blue-100 text-blue-600 transition"
                    title="View"
                  >
                    👁
                  </button>
                  <button
                    className="p-2 rounded hover:bg-yellow-100 text-yellow-600 transition"
                    title="Mark as Unread"
                  >
                    ✉️
                  </button>
                  <button
                    className="p-2 rounded hover:bg-green-100 text-green-600 transition"
                    title="Mark as Read"
                  >
                    ✅
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

          {pagination && pagination.last_page > 1 && (
            <ResponsivePagination
              currentPage={currentPage}
              lastPage={pagination.last_page}
              total={pagination.total}
              from={pagination.from}
              to={pagination.to}
              perPage={pagination.per_page}
              onPageChange={handlePageChange}
              onPerPageChange={handlePerPageChange}
            />
          )}
        </>
      )}
    </AdminLayout>
  );
}
