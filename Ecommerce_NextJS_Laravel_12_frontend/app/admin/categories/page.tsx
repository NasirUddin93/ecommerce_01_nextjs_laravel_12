"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import { useRouter } from "next/navigation";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable, { Column } from "../components/ResponsiveTable";

// TypeScript interface for category
interface Category {
  id: number;
  name: string;
  description: string;
  status: number;
}

export default function CategoriesPage() {
  const router = useRouter();
  const [categories, setCategories] = useState<Category[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchCategories = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/categories`, {
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
        setCategories(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching categories:", error);
    }
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  // Filter categories based on search text
  const filteredCategories = categories.filter((category) =>
    category.name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Categories" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <h1 className="text-2xl font-bold">Categories</h1>

          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search categories..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 p-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/categories/create"
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Category
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredCategories.length > 0 ? (
          <ResponsiveTable<Category>
            columns={[
              {
                key: "id",
                label: "ID",
                mobileHide: true,
              },
              {
                key: "name",
                label: "Name",
              },
              {
                key: "description",
                label: "Description",
                mobileHide: true,
              },
              {
                key: "status",
                label: "Status",
                render: (status: number) => (
                  <span
                    className={`px-2 py-1 text-xs rounded-full ${
                      status === 1
                        ? "bg-green-100 text-green-700"
                        : "bg-red-100 text-red-700"
                    }`}
                  >
                    {status === 1 ? "Active" : "Inactive"}
                  </span>
                ),
              },
              {
                key: "id",
                label: "Actions",
                render: (id: number) => (
                  <div className="flex gap-2 justify-end flex-wrap">
                    <button
                      onClick={() => router.push(`/admin/categories/${id}`)}
                      className="text-blue-600 hover:text-blue-800 p-2 rounded hover:bg-blue-50 inline-block"
                      title="View"
                    >
                      👁
                    </button>
                    <button
                      onClick={() => router.push(`/admin/categories/${id}`)}
                      className="text-yellow-600 hover:text-yellow-800 p-2 rounded hover:bg-yellow-50 inline-block"
                      title="Edit"
                    >
                      ✏️
                    </button>
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
            data={filteredCategories}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">
            No categories found
          </div>
        )}
      </div>
    </AdminLayout>
  );
}
