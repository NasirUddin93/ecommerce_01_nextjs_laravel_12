"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken, localBaseUrl } from "../../common/http";
import AdminLayout from "../AdminLayout";
import { Product } from "./product";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable, { Column } from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

interface PaginationInfo {
  current_page: number;
  total: number;
  per_page: number;
  last_page: number;
  from: number;
  to: number;
}

export default function ProductList() {
  
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [perPage, setPerPage] = useState(10);
  const [pagination, setPagination] = useState<PaginationInfo>({
    current_page: 1,
    total: 0,
    per_page: 10,
    last_page: 1,
    from: 0,
    to: 0,
  });

  const getImageUrl = (imageUrl: string) => {
    if (!imageUrl) return '';
    if (imageUrl.startsWith('http')) return imageUrl;
    if (imageUrl.startsWith('/storage/')) return `${localBaseUrl}${imageUrl}`;
    return `${localBaseUrl}${imageUrl.startsWith('/') ? '' : '/'}${imageUrl}`;
  };

  const fetchProducts = async (page: number = 1, itemsPerPage: number = 10) => {
    try {
      setLoading(true);
      const res = await fetch(`${apiUrl}/products?page=${page}&per_page=${itemsPerPage}`, {
        headers: { Authorization: `Bearer ${adminToken()}` },
      });
      const data = await res.json();
      setProducts(data.data || []);
      if (data.pagination) {
        setPagination(data.pagination);
        setCurrentPage(data.pagination.current_page);
      }
    } catch (err) {
      console.error("Error fetching products:", err);
    } finally {
      setLoading(false);
    }
  };
  // Handle delete product
  const handleDelete = async (id: number) => {
    if (!confirm("Are you sure you want to delete this product?")) return;

    try {
      const res = await fetch(`${apiUrl}/products/${id}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${adminToken()}` },
      });

      if (res.ok) {
        alert("✅ Product deleted successfully!");
        fetchProducts(currentPage, perPage); // Refresh current page
      } else {
        const err = await res.json();
        alert("❌ Error deleting product: " + err.message);
      }
    } catch (error) {
      console.error("Error deleting product:", error);
      alert("Error deleting product!");
    }
  };

  // Handle page change
  const handlePageChange = (page: number) => {
    if (page >= 1 && page <= pagination.last_page) {
      setCurrentPage(page);
      fetchProducts(page, perPage);
    }
  };

  // Handle per page change
  const handlePerPageChange = (newPerPage: number) => {
    setPerPage(newPerPage);
    setCurrentPage(1);
    fetchProducts(1, newPerPage);
  };

  // Filter products by search text
  const filteredProducts = products.filter((p) =>
    p.name.toLowerCase().includes(search.toLowerCase())
  );

    // Fetch all products
  useEffect(() => {
    fetchProducts(currentPage, perPage);
  }, []);

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Products" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <h1 className="text-2xl font-bold">Product List</h1>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search product..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg p-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <a
              href="/admin/products/create"
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Product
            </a>
          </div>
        </div>

        {loading ? (
          <p className="text-center text-gray-500">Loading products...</p>
        ) : filteredProducts.length === 0 ? (
          <p className="text-center text-gray-500">No products found.</p>
        ) : (
          <>
            <ResponsiveTable<Product>
              columns={[
                {
                  key: "images",
                  label: "Image",
                  render: (images: any) => {
                    if (images && images.length > 0) {
                      return (
                        <img
                          src={getImageUrl(images[0].image_url)}
                          alt="Product"
                          className="w-10 h-10 object-cover rounded border"
                        />
                      );
                    }
                    return (
                      <div className="w-10 h-10 bg-gray-200 rounded flex items-center justify-center border">
                        <span className="text-xs text-gray-400">-</span>
                      </div>
                    );
                  },
                  mobileHide: true,
                },
                {
                  key: "name",
                  label: "Name",
                },
                {
                  key: "category",
                  label: "Category",
                  render: (category: any) => category?.name || "-",
                  mobileHide: false,
                },
                {
                  key: "brand",
                  label: "Brand",
                  render: (brand: any) => brand?.name || "-",
                  mobileHide: true,
                },
                {
                  key: "base_price",
                  label: "Price",
                  render: (price: number) => `৳${price}`,
                  mobileHide: false,
                },
                {
                  key: "stock_quantity",
                  label: "Stock",
                  mobileHide: false,
                },
                {
                  key: "status",
                  label: "Status",
                  render: (status: string) => (
                    <span
                      className={`px-2 py-1 rounded text-xs font-semibold ${
                        status === "active"
                          ? "bg-green-100 text-green-800"
                          : "bg-red-100 text-red-800"
                      }`}
                    >
                      {status}
                    </span>
                  ),
                  mobileHide: false,
                },
                {
                  key: "id",
                  label: "Actions",
                  render: (id: number, row: Product) => (
                    <div className="flex gap-2 justify-end flex-wrap">
                      <a
                        href={`/admin/products/${id}`}
                        className="text-blue-600 hover:text-blue-800 p-2 rounded hover:bg-blue-50 inline-block"
                        title="View"
                      >
                        👁
                      </a>
                      <a
                        href={`/admin/products/edit/${id}`}
                        className="text-yellow-600 hover:text-yellow-800 p-2 rounded hover:bg-yellow-50 inline-block"
                        title="Edit"
                      >
                        ✏️
                      </a>
                      <button
                        onClick={() => handleDelete(id)}
                        className="text-red-600 hover:text-red-800 p-2 rounded hover:bg-red-50"
                        title="Delete"
                      >
                        🗑
                      </button>
                    </div>
                  ),
                },
              ]}
              data={filteredProducts}
              keyField="id"
              loading={loading}
            />
          </>
        )}

        {/* Pagination Controls */}
        {!loading && filteredProducts.length > 0 && (
          <div className="mt-6 bg-white p-4 rounded-lg shadow space-y-4">
            <div className="flex flex-col sm:flex-row items-center justify-between gap-4">
              {/* Per Page Selector */}
              <div className="flex items-center gap-2">
                <label className="text-sm text-gray-700">Show:</label>
                <select
                  value={perPage}
                  onChange={(e) => handlePerPageChange(Number(e.target.value))}
                  className="border border-gray-300 rounded px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value={5}>5</option>
                  <option value={10}>10</option>
                  <option value={20}>20</option>
                  <option value={50}>50</option>
                  <option value={100}>100</option>
                </select>
                <span className="text-sm text-gray-700 hidden sm:inline">entries</span>
              </div>

              {/* Pagination Info */}
              <div className="text-sm text-gray-700 text-center sm:text-left">
                Showing {pagination.from} to {pagination.to} of {pagination.total} products
              </div>
            </div>

            {/* Page Navigation */}
            <ResponsivePagination
              currentPage={currentPage}
              lastPage={pagination.last_page}
              onPageChange={handlePageChange}
            />
          </div>
        )}
      </div>
    </AdminLayout>
  );
}