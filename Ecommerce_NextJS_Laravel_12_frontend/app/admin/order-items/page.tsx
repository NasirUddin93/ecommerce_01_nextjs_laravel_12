"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken, getImageUrl } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

interface OrderItemProductImage {
  id: number;
  image_path?: string | null;
  image_url?: string | null;
}

interface OrderItemProduct {
  id: number;
  name: string;
  sku?: string | null;
  images?: OrderItemProductImage[];
}

interface OrderItemVariantSize {
  id: number;
  name: string;
}

interface OrderItemVariant {
  id: number;
  color?: string | null;
  size?: OrderItemVariantSize | null;
}

interface OrderItemOrder {
  id: number;
}

export interface OrderItem {
  id: number;
  order_id: number;
  product_id: number;
  variant_id: number;
  quantity: number;
  price_at_purchase: number;
  discount_applied: number;
  order?: OrderItemOrder | null;
  product?: OrderItemProduct | null;
  variant?: OrderItemVariant | null;
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}

export default function OrderItemsPage() {
  const [orderItems, setOrderItems] = useState<OrderItem[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<{total: number; per_page: number; current_page: number; last_page: number; from: number; to: number} | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchOrders = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/order-items?page=${page}&per_page=${perPage}`, {
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
        setOrderItems(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching orders:", error);
    }
  };

  useEffect(() => {
    fetchOrders(currentPage);
  }, [currentPage, perPage]);

  const handlePageChange = (page: number) => {
    setCurrentPage(page);
  };


  const formatCurrency = (value: number) => `৳${Number(value || 0).toLocaleString()}`;

  const filteredOrderItems = orderItems.filter((orderItem) => {
    const term = search.toLowerCase();
    if (!term) return true;

    const productName = orderItem.product?.name?.toLowerCase() || "";
    const productSku = orderItem.product?.sku?.toLowerCase() || "";
    const variantColor = orderItem.variant?.color?.toLowerCase() || "";
    const variantSize = orderItem.variant?.size?.name?.toLowerCase() || "";
    const orderId = String(orderItem.order_id || "");

    return (
      orderId.includes(term) ||
      productName.includes(term) ||
      productSku.includes(term) ||
      variantColor.includes(term) ||
      variantSize.includes(term)
    );
  });

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Order Items" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Order Items</h1>
            <p className="text-gray-600 mt-1">Manage order line items</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by order ID, product, SKU, or variant..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/order-items/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Item
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : orderItems.length > 0 ? (
          <>
            <ResponsiveTable<OrderItem>
              columns={[
                { key: "id", label: "Item ID", mobileHide: true },
                { key: "order_id", label: "Order" },
                {
                  key: "product",
                  label: "Product",
                  render: (_: any, row: OrderItem) => (
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
                          {row.product?.name || "Unknown Product"}
                        </p>
                        <p className="text-xs text-gray-500">
                          SKU: {row.product?.sku || "—"}
                        </p>
                      </div>
                    </div>
                  ),
                },
                {
                  key: "variant",
                  label: "Variant",
                  render: (_: any, row: OrderItem) =>
                    row.variant ? (
                      <div className="text-sm">
                        <p>{row.variant.size?.name || "—"}</p>
                        <p className="text-xs text-gray-500">
                          Color: {row.variant.color || "—"}
                        </p>
                      </div>
                    ) : (
                      <span className="text-xs text-gray-500">No variant</span>
                    ),
                },
                { key: "quantity", label: "Qty" },
                {
                  key: "price_at_purchase",
                  label: "Unit Price",
                  mobileHide: true,
                  render: (value: number) => formatCurrency(value),
                },
                {
                  key: "discount_applied",
                  label: "Discount",
                  mobileHide: true,
                  render: (value: number) => formatCurrency(value || 0),
                },
                {
                  key: "subtotal",
                  label: "Subtotal",
                  render: (_: any, row: OrderItem) =>
                    formatCurrency(
                      row.quantity * (row.price_at_purchase || 0) -
                        (row.discount_applied || 0)
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
              data={filteredOrderItems}
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
          <div className="text-center py-6 text-gray-500">{search ? "No matching order items found" : "No order items found"}</div>
        )}
      </div>
    </AdminLayout>
  );
}