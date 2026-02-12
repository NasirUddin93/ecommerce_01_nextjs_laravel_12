"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for pagination
interface PaginationData {
  total: number;
  per_page: number;
  current_page: number;
  last_page: number;
  from: number;
  to: number;
}

// TypeScript interface for category
export interface Discount {
  id: number;
  product_id: number;
  category_id: number;
  discount_type: 'percentage' | 'fixed';
  discount_value: number;
  valid_from: Date;
  valid_to: Date;
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}

export default function DiscountsPage() {
  const [discounts, setDiscounts] = useState<Discount[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [perPage, setPerPage] = useState(10);
  const [pagination, setPagination] = useState<PaginationData | null>(null);

  const fetchDiscounts = async (page: number = 1, limit: number = 10) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/discounts?page=${page}&per_page=${limit}`, {
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
        setDiscounts(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching discounts:", error);
    }
  };

  useEffect(() => {
    fetchDiscounts(currentPage, perPage);
  }, [currentPage, perPage]);

  // Filter discounts based on search text
  const filteredDiscounts = discounts.filter((discount) =>
    discount.id.toString().includes(search.toLowerCase()) ||
    discount.discount_type.includes(search.toLowerCase())
  );

  const handlePageChange = (newPage: number) => {
    setCurrentPage(newPage);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Discounts" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Discounts</h1>
            <p className="text-gray-600 mt-1">Manage product discounts</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by ID, discount type..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/discounts/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Discount
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredDiscounts.length > 0 ? (
          <>
            <ResponsiveTable<Discount>
              columns={[
                { key: "id", label: "ID", mobileHide: true },
                { key: "product_id", label: "Product ID" },
                { key: "category_id", label: "Category ID", mobileHide: true },
                {
                  key: "discount_type",
                  label: "Type",
                  render: (value: "percentage" | "fixed") => (
                    <span
                      className={`px-2 py-1 text-xs rounded-full ${
                        value === "percentage"
                          ? "bg-blue-100 text-blue-700"
                          : "bg-green-100 text-green-700"
                      }`}
                    >
                      {value === "percentage" ? "%" : "৳"}
                    </span>
                  ),
                },
                { key: "discount_value", label: "Value" },
                {
                  key: "valid_from",
                  label: "Valid From",
                  mobileHide: true,
                  render: (value: Date) => new Date(value).toLocaleDateString(),
                },
                {
                  key: "valid_to",
                  label: "Valid To",
                  mobileHide: true,
                  render: (value: Date) => new Date(value).toLocaleDateString(),
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
              data={filteredDiscounts}
              keyField="id"
              loading={loader}
            />

            {pagination && pagination.last_page > 1 && (
              <ResponsivePagination
                currentPage={currentPage}
                lastPage={pagination.last_page}
                total={pagination.total}
                from={pagination.from}
                to={pagination.to}
                perPage={perPage}
                onPageChange={handlePageChange}
                onPerPageChange={setPerPage}
              />
            )}
          </>
        ) : (
          <div className="text-center py-6 text-gray-500">
            No discounts found
          </div>
        )}
      </div>
    </AdminLayout>
  );
}