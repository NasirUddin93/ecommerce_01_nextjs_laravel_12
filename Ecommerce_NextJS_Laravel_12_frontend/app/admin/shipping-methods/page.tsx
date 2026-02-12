"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

interface ShippingMethods {
  id: number;
  name: string;
  description?: string | null;
  fee: number | string;               // Laravel may return string for decimals
  is_free_shipping: boolean | number; // Could be 0/1 or true/false depending on cast
  created_at?: string;
  updated_at?: string;
}

interface ApiListResponse<T> {
  status: number;
  data: T[];
  message?: string;
}

export default function ShippingsPage() {
  const [loader, setLoader] = useState(false);
  const [shippingMethods, setShippingMethods] = useState<ShippingMethods[]>([]);
  const [search, setSearch] = useState("");
  const [error, setError] = useState<string | null>(null);

  const fetchShippingMethods = async () => {
    try {
      setLoader(true);
      setError(null);

      const res = await fetch(`${apiUrl}/shipping-methods`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`, // remove if your route is public
        },
        cache: "no-store",
      });

      const result: ApiListResponse<ShippingMethods> = await res.json();
      setLoader(false);

      if (result?.status === 200 && Array.isArray(result?.data)) {
        setShippingMethods(result.data);
      } else {
        setError("Unexpected API response.");
        console.error("Unexpected response:", result);
      }
    } catch (e) {
      setLoader(false);
      setError("Failed to load shipping methods.");
      console.error("Error fetching shippings:", e);
    }
  };

  useEffect(() => {
    fetchShippingMethods();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return shippingMethods;
    return shippingMethods.filter((s) => {
      const name = s.name?.toLowerCase() ?? "";
      const desc = (s.description ?? "").toString().toLowerCase();
      return name.includes(q) || desc.includes(q);
    });
  }, [search, shippingMethods]);

  const asBoolean = (v: boolean | number) => {
    if (typeof v === "boolean") return v;
    return Number(v) === 1;
  };

  const formatFee = (fee: number | string) => {
    const n = typeof fee === "string" ? Number(fee) : fee;
    if (Number.isNaN(n)) return String(fee);
    return n.toFixed(2);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Shipping Methods" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div className="flex items-center justify-between gap-4">
            <div>
              <h1 className="text-2xl font-bold text-gray-800">Shipping Methods</h1>
              <p className="text-gray-600 mt-1">Manage shipping options</p>
            </div>
            <button
              onClick={fetchShippingMethods}
              className="px-3 py-2 rounded-lg border hover:bg-gray-50"
              title="Refresh"
            >
              ↻ Refresh
            </button>
          </div>

          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by name or description…"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/shipping-methods/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Shipping Method
            </Link>
          </div>
        </div>

        {/* States */}
        {loader && <div className="text-center py-6 text-gray-500">Loading…</div>}
        {!loader && error && <div className="text-center py-6 text-red-600">{error}</div>}
        {!loader && !error && filtered.length === 0 && (
          <div className="text-center py-6 text-gray-500">No shipping methods found</div>
        )}

        {!loader && !error && filtered.length > 0 && (
          <ResponsiveTable<ShippingMethods>
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "name", label: "Name" },
              { key: "description", label: "Description", mobileHide: true },
              {
                key: "fee",
                label: "Fee",
                render: (_: any, row: ShippingMethods) =>
                  asBoolean(row.is_free_shipping) ? (
                    <span className="px-2 py-1 text-xs rounded-full bg-green-100 text-green-700">
                      Free
                    </span>
                  ) : (
                    <span>{formatFee(row.fee)}</span>
                  ),
              },
              {
                key: "is_free_shipping",
                label: "Free Shipping",
                render: (value: boolean | number) => (
                  <span
                    className={`px-2 py-1 text-xs rounded-full ${
                      asBoolean(value) ? "bg-green-100 text-green-700" : "bg-gray-100 text-gray-700"
                    }`}
                  >
                    {asBoolean(value) ? "Yes" : "No"}
                  </span>
                ),
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
            data={filtered}
            keyField="id"
            loading={loader}
          />
        )}
      </div>
    </AdminLayout>
  );
}
