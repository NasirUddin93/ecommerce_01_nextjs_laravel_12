"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

type DiscountType = "percentage" | "fixed";
type CouponStatus = "active" | "inactive";

interface Coupon {
  id: number;
  code: string;
  description?: string | null;
  discount_type: DiscountType;
  discount_value: number | string;
  min_purchase_amount: number | string;
  max_discount_amount?: number | string | null;
  valid_from?: string | null; // 'YYYY-MM-DD'
  valid_to?: string | null;   // 'YYYY-MM-DD'
  usage_limit: number;
  status: CouponStatus;
  created_at?: string;
  updated_at?: string;
}

interface ApiListResponse<T> {
  status: number;
  data: T[];
  message?: string;
}

export default function CouponsPage() {
  const [coupons, setCoupons] = useState<Coupon[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [error, setError] = useState<string | null>(null);

  const fetchCoupons = async () => {
    try {
      setLoader(true);
      setError(null);

      const res = await fetch(`${apiUrl}/coupons`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`, // remove if public
        },
        cache: "no-store",
      });

      const result: ApiListResponse<Coupon> = await res.json();
      setLoader(false);

      if (result?.status === 200 && Array.isArray(result?.data)) {
        setCoupons(result.data);
      } else {
        setError("Unexpected API response.");
        console.error("Unexpected response:", result);
      }
    } catch (e) {
      setLoader(false);
      setError("Failed to load coupons.");
      console.error("Error fetching coupons:", e);
    }
  };

  useEffect(() => {
    fetchCoupons();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return coupons;
    return coupons.filter((c) => {
      const code = c.code?.toLowerCase() ?? "";
      const desc = (c.description ?? "").toString().toLowerCase();
      return code.includes(q) || desc.includes(q);
    });
  }, [search, coupons]);

  const money = (v: number | string | null | undefined) => {
    if (v === null || v === undefined) return "—";
    const n = typeof v === "string" ? Number(v) : v;
    if (Number.isNaN(n)) return String(v);
    return n.toFixed(2);
  };

  const fmtDiscount = (type: DiscountType, value: number | string) => {
    const n = typeof value === "string" ? Number(value) : value;
    if (Number.isNaN(n)) return String(value);
    return type === "percentage" ? `${n}%` : money(n);
    // tip: show currency symbol if you have one, e.g. `$${money(n)}`
  };

  const fmtDate = (d?: string | null) => (d ? d : "—");

  return (
    <AdminLayout>
      <div className="mb-6">
        <Breadcrumb
          items={[
            { label: "Admin", href: "/admin" },
            { label: "Coupons" },
          ]}
        />
      </div>

      <div className="mb-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Coupons</h1>
            <p className="text-sm text-gray-600 mt-1">Manage discount coupons</p>
          </div>
          <div className="flex gap-2">
            <button
              onClick={fetchCoupons}
              className="px-4 py-2 rounded-lg border border-gray-300 hover:bg-gray-100 transition text-sm font-medium"
              title="Refresh"
            >
              ↻ Refresh
            </button>
            <Link
              href="/admin/coupons/create"
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
            >
              + Add Coupon
            </Link>
          </div>
        </div>
      </div>

      {/* Search */}
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by code or description…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* States */}
      {loader && <div className="text-center py-8 text-gray-500">Loading…</div>}
      {!loader && error && (
        <div className="text-center py-8 text-red-600">{error}</div>
      )}
      {!loader && !error && filtered.length === 0 && (
        <div className="text-center py-8 text-gray-500">No coupons found</div>
      )}

      {!loader && !error && filtered.length > 0 && (
        <ResponsiveTable<Coupon>
          data={filtered}
          keyField="id"
          columns={[
            { key: "id", label: "ID", mobileHide: true },
            { key: "code", label: "Code" },
            { key: "description", label: "Description", mobileHide: true, render: (desc) => desc ? desc : <span className="text-gray-400">—</span> },
            { key: "discount_value", label: "Discount", render: (value, row) => (
              <span className="whitespace-nowrap">
                {fmtDiscount(row.discount_type, value)}
              </span>
            )},
            { key: "min_purchase_amount", label: "Min Purchase", mobileHide: true, render: (v) => money(v) },
            { key: "max_discount_amount", label: "Max Discount", mobileHide: true, render: (v) => money(v) },
            { key: "valid_from", label: "Valid From", mobileHide: true, render: (d) => fmtDate(d) },
            { key: "valid_to", label: "Valid To", mobileHide: true, render: (d) => fmtDate(d) },
            { key: "usage_limit", label: "Usage Limit" },
            { key: "status", label: "Status", render: (status) => (
              <span
                className={`px-2 py-1 text-xs rounded-full font-medium ${
                  status === "active"
                    ? "bg-green-100 text-green-700"
                    : "bg-red-100 text-red-700"
                }`}
              >
                {status === "active" ? "Active" : "Inactive"}
              </span>
            )},
            { key: "actions", label: "Actions", render: () => (
              <div className="flex gap-2 justify-center">
                <button className="p-2 rounded hover:bg-blue-100 text-blue-600 transition" title="View">
                  👁
                </button>
                <button className="p-2 rounded hover:bg-yellow-100 text-yellow-600 transition" title="Edit">
                  ✏️
                </button>
                <button className="p-2 rounded hover:bg-red-100 text-red-600 transition" title="Delete">
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
