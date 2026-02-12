"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

// TypeScript interface for category
interface Size {
  id: number;
  name: string;
  status: number;
}

export default function CategoriesPage() {
  const [sizes, setSizes] = useState<Size[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchSizes = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/sizes`, {
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
        setSizes(result.data);
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
  const filteredSizes = sizes.filter((size) =>
    size.name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Sizes" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Sizes</h1>
            <p className="text-gray-600 mt-1">Manage size options</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search sizes..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/sizes/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add New Size
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredSizes.length > 0 ? (
          <ResponsiveTable<Size>
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "name", label: "Name" },
              {
                key: "status",
                label: "Status",
                render: (value: number) => (
                  <span
                    className={`px-2 py-1 text-xs rounded-full ${
                      value === 1
                        ? "bg-green-100 text-green-700"
                        : "bg-red-100 text-red-700"
                    }`}
                  >
                    {value === 1 ? "Active" : "Inactive"}
                  </span>
                ),
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
            data={filteredSizes}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">No sizes found</div>
        )}
      </div>
    </AdminLayout>
  );
}