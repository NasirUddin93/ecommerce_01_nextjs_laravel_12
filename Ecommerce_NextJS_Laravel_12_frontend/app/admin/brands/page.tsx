"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken} from "../../common/http";
import Link from "next/link";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable, { Column } from "../components/ResponsiveTable";


export default function BrandList() {

  interface Brand{
      id:number;
      name: string;
      status: number;
  }

  const [brands, setBrands] = useState<Brand[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  const fetchBrands = async () => {
    try {
      const res = await fetch(`${apiUrl}/brands`, {
        headers: { Authorization: `Bearer ${adminToken()}` },
      });
      const data = await res.json();
      console.log("Brands API Response:", data);
      // Handle both wrapped and unwrapped responses
      const brandsData = Array.isArray(data) ? data : (data.data || []);
      console.log("Brands Data to Set:", brandsData);
      setBrands(brandsData);        
    } catch (err) {
      console.error("Error fetching brands:", err);
      setBrands([]);
    } finally {
      setLoading(false);
    }
  };
  // Handle delete product
  const handleDelete = async (id: number) => {
    if (!confirm("Are you sure you want to delete this brand?")) return;

    try {
      const res = await fetch(`${apiUrl}/brands/${id}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${adminToken()}` },
      });

      if (res.ok) {
        setBrands(brands.filter((p) => p.id !== id));
        alert("✅ Brands deleted successfully!");
      } else {
        const err = await res.json();
        alert("❌ Error deleting brand: " + err.message);
      }
    } catch (error) {
      console.error("Error deleting brands:", error);
      alert("Error deleting brand!");
    }
  };

  // Filter brands by search text
  const filteredBrands = brands.filter((b) =>
    b.name.toLowerCase().includes(search.toLowerCase())
  );

  console.log("Brands:", brands);
  console.log("Filtered Brands:", filteredBrands);
  console.log("Loading:", loading);

    // Fetch all brands
  useEffect(() => {
    fetchBrands();
  }, []);

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Brands" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Brand Management</h1>
            <p className="text-gray-600 mt-1">Manage your brand catalog</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search brands..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/brands/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Brand
            </Link>
          </div>
        </div>

        {loading ? (
          <p className="text-center text-gray-500">Loading brands...</p>
        ) : filteredBrands.length === 0 ? (
          <p className="text-center text-gray-500">No brands found.</p>
        ) : (
          <ResponsiveTable<Brand>
            columns={[
              {
                key: "id",
                label: "ID",
                mobileHide: true,
              },
              {
                key: "name",
                label: "Brand Name",
              },
              {
                key: "status",
                label: "Status",
                render: (status: number) => (
                  <span
                    className={`px-3 py-1 rounded-full text-xs font-semibold ${
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
                key: "actions",
                label: "Actions",
                render: (_: any, row: Brand) => (
                  <div className="flex gap-2 justify-end flex-wrap">
                    <Link
                      href={`/admin/brands/${row.id}`}
                      className="px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md text-sm font-medium inline-block"
                      title="View"
                    >
                      View
                    </Link>
                    <Link
                      href={`/admin/brands/edit/${row.id}`}
                      className="px-3 py-2 text-yellow-600 hover:bg-yellow-50 rounded-md text-sm font-medium inline-block"
                      title="Edit"
                    >
                      Edit
                    </Link>
                    <button
                      onClick={() => handleDelete(row.id)}
                      className="px-3 py-2 text-red-600 hover:bg-red-50 rounded-md text-sm font-medium"
                      title="Delete"
                    >
                      Delete
                    </button>
                  </div>
                ),
              },
            ]}
            data={filteredBrands}
            keyField="id"
            loading={loading}
          />
        )}
      </div>
    </AdminLayout>
  );
}