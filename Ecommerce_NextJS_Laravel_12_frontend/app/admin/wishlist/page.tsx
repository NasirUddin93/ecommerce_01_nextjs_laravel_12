"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken, getImageUrl } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

interface WishlistUser {
  id: number;
  name?: string | null;
  email?: string | null;
}

interface WishlistProductImage {
  id: number;
  image_url?: string | null;
  image_path?: string | null;
}

interface WishlistProduct {
  id: number;
  name?: string | null;
  sku?: string | null;
  images?: WishlistProductImage[];
}

interface Wishlist {
  id: number;
  user_id: number;
  product_id: number;
  user?: WishlistUser | null;
  product?: WishlistProduct | null;
  created_at?: string;
  deleted_at?: string | null;
}

export default function WishlistPage() {
  const [wishlists, setWishlists] = useState<Wishlist[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<{total: number; per_page: number; current_page: number; last_page: number; from: number; to: number} | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchWishlists = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/wishlists?page=${page}&per_page=${perPage}`, {
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
        setWishlists(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching wishlists:", error);
    }
  };

  useEffect(() => {
    fetchWishlists(currentPage);
  }, [perPage]);

  const handlePageChange = (page: number) => {
    fetchWishlists(page);
  };

  const filteredWishlists = wishlists.filter((wishlist) => {
    const term = search.toLowerCase();
    if (!term) return true;

    const userName = wishlist.user?.name?.toLowerCase() || "";
    const userEmail = wishlist.user?.email?.toLowerCase() || "";
    const productName = wishlist.product?.name?.toLowerCase() || "";
    const productSku = wishlist.product?.sku?.toLowerCase() || "";
    const userId = String(wishlist.user_id || "");
    const productId = String(wishlist.product_id || "");

    return (
      userId.includes(term) ||
      productId.includes(term) ||
      userName.includes(term) ||
      userEmail.includes(term) ||
      productName.includes(term) ||
      productSku.includes(term)
    );
  });

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Wishlist" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Wishlist</h1>
            <p className="text-gray-600 mt-1">Manage customer wishlists</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by user, product, SKU, or ID..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/wishlist/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Wishlist
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredWishlists.length > 0 ? (
          <>
            <ResponsiveTable<Wishlist>
              columns={[
                { key: "id", label: "ID", mobileHide: true },
                {
                  key: "user",
                  label: "User",
                  render: (_: any, row: Wishlist) => (
                    <div>
                      <p className="font-medium text-gray-900">
                        {row.user?.name || `User #${row.user_id}`}
                      </p>
                      <p className="text-xs text-gray-500">
                        {row.user?.email || "—"}
                      </p>
                    </div>
                  ),
                },
                {
                  key: "product",
                  label: "Product",
                  render: (_: any, row: Wishlist) => (
                    <div className="flex items-center gap-3">
                      {row.product?.images?.length ? (
                        <img
                          src={getImageUrl(
                            row.product.images[0].image_path ||
                              row.product.images[0].image_url ||
                              ""
                          )}
                          alt={row.product?.name || "Product"}
                          className="w-10 h-10 rounded object-cover"
                        />
                      ) : (
                        <div className="w-10 h-10 rounded bg-gray-100 flex items-center justify-center text-xs text-gray-500">
                          N/A
                        </div>
                      )}
                      <div>
                        <p className="font-medium text-gray-900">
                          {row.product?.name || `Product #${row.product_id}`}
                        </p>
                        <p className="text-xs text-gray-500">
                          SKU: {row.product?.sku || "—"}
                        </p>
                      </div>
                    </div>
                  ),
                },
                {
                  key: "created_at",
                  label: "Added",
                  mobileHide: true,
                  render: (value: string | undefined) =>
                    value ? new Date(value).toLocaleDateString() : "—",
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
              data={filteredWishlists}
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
          <div className="text-center py-6 text-gray-500">No wishlists found</div>
        )}
      </div>
    </AdminLayout>
  );
}
