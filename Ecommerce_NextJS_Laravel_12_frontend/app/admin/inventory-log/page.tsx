"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for category
export interface InventoryLog {
  id: number;
  product_id: number;
  variant_id: number;
  change_type: "in"|"out";
  quantity_changed: number;
  note: string;
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

export default function InventoryLogPage() {
  const [inventoryLogs, setInventoryLogs] = useState<InventoryLog[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchInventoryLogs = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/inventory-log?page=${page}&per_page=${perPage}`, {
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
        setInventoryLogs(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching inventory logs:", error);
    }
  };

  useEffect(() => {
    fetchInventoryLogs(currentPage);
  }, [perPage]);

  // Filter categories based on search text
  const filteredInventoryLogs = inventoryLogs.filter((inventoryLog) =>
    inventoryLog.id.toString().includes(search.toLowerCase()) ||
    inventoryLog.note.toLowerCase().includes(search.toLowerCase())
  );

  const handlePageChange = (page: number) => {
    fetchInventoryLogs(page);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Inventory Log" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Inventory Log</h1>
            <p className="text-gray-600 mt-1">Track inventory adjustments</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search inventory logs..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/inventory-log/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Inventory Log
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredInventoryLogs.length > 0 ? (
          <>
            <ResponsiveTable<InventoryLog>
              columns={[
                { key: "id", label: "ID", mobileHide: true },
                { key: "product_id", label: "Product ID" },
                { key: "variant_id", label: "Variant ID", mobileHide: true },
                {
                  key: "change_type",
                  label: "Type",
                  render: (value: "in" | "out") => (
                    <span
                      className={`px-2 py-1 text-xs rounded-full ${
                        value === "in"
                          ? "bg-green-100 text-green-700"
                          : "bg-red-100 text-red-700"
                      }`}
                    >
                      {value.toUpperCase()}
                    </span>
                  ),
                },
                { key: "quantity_changed", label: "Qty" },
                { key: "note", label: "Note", mobileHide: true },
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
              data={filteredInventoryLogs}
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
            No inventory log found
          </div>
        )}
      </div>
    </AdminLayout>
  );
}