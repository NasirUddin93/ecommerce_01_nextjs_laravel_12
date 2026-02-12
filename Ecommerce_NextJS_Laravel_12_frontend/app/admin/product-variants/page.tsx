"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

// TypeScript interface for category
interface ProductVariants {
  id: number;
  product_id: number;
  size_id: number;
  color: string;
  additional_price: string;
  stock_quantity: number;
  product?: {
    id: number;
    name: string;
    sku: string;
  };
  size?: {
    id: number;
    name: string;
  };
}

interface Product {
  id: number;
  name: string;
  sku: string;
}

interface Size {
  id: number;
  name: string;
}

export default function ProductVariants() {

  const [productVariants, setProductVariants] = useState<ProductVariants[]>([]);
  const [products, setProducts] = useState<Product[]>([]);
  const [sizes, setSizes] = useState<Size[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [showModal, setShowModal] = useState(false);
  const [formData, setFormData] = useState({
    product_id: "",
    size_id: "",
    color: "",
    additional_price: "",
    stock_quantity: "",
  });
  const [submitting, setSubmitting] = useState(false);

  const fetchSizes = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/product-variants`, {
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
        setProductVariants(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching sizes:", error);
    }
  };

  const fetchProducts = async () => {
    try {
      const res = await fetch(`${apiUrl}/products`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });
      const result = await res.json();
      if (result.status === 200 && Array.isArray(result.data)) {
        setProducts(result.data);
      }
    } catch (error) {
      console.error("Error fetching products:", error);
    }
  };

  const fetchSizesList = async () => {
    try {
      const res = await fetch(`${apiUrl}/sizes`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
      });
      const result = await res.json();
      if (result.status === 200 && Array.isArray(result.data)) {
        setSizes(result.data);
      }
    } catch (error) {
      console.error("Error fetching sizes:", error);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitting(true);

    try {
      const res = await fetch(`${apiUrl}/product-variants`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify({
          product_id: parseInt(formData.product_id),
          size_id: formData.size_id ? parseInt(formData.size_id) : null,
          color: formData.color || null,
          additional_price: formData.additional_price ? parseFloat(formData.additional_price) : 0,
          stock_quantity: parseInt(formData.stock_quantity),
        }),
      });

      const result = await res.json();
      
      if (result.status === 201) {
        alert("Product variant added successfully!");
        setShowModal(false);
        setFormData({
          product_id: "",
          size_id: "",
          color: "",
          additional_price: "",
          stock_quantity: "",
        });
        fetchSizes(); // Refresh the list
      } else {
        alert("Failed to add product variant: " + (result.message || "Unknown error"));
      }
    } catch (error) {
      console.error("Error adding variant:", error);
      alert("Failed to add product variant");
    } finally {
      setSubmitting(false);
    }
  };

  useEffect(() => {
    fetchSizes();
    fetchProducts();
    fetchSizesList();
  }, []);

  // Filter categories based on search text
  const filteredProductVariants = productVariants.filter((productVariant) =>
    productVariant.color?.toLowerCase().includes(search.toLowerCase()) ||
    productVariant.product?.name?.toLowerCase().includes(search.toLowerCase()) ||
    productVariant.size?.name?.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Product Variants" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Product Variants</h1>
            <p className="text-gray-600 mt-1">Manage product variant options</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search by product, size, or color..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <button
              onClick={() => setShowModal(true)}
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add New Variant
            </button>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredProductVariants.length > 0 ? (
          <ResponsiveTable<ProductVariants>
            columns={[
              {
                key: "id",
                label: "ID",
                mobileHide: true,
              },
              {
                key: "product",
                label: "Product",
                render: (_: any, row: ProductVariants) => (
                  <div>
                    <div className="font-medium text-gray-900">
                      {row.product?.name || `Product #${row.product_id}`}
                    </div>
                    <div className="text-xs text-gray-500">
                      SKU: {row.product?.sku || "N/A"}
                    </div>
                  </div>
                ),
              },
              {
                key: "size",
                label: "Size",
                render: (_: any, row: ProductVariants) =>
                  row.size?.name || (row.size_id ? `Size #${row.size_id}` : "N/A"),
              },
              {
                key: "color",
                label: "Color",
                render: (_: any, row: ProductVariants) => (
                  <div className="flex items-center gap-2">
                    {row.color && (
                      <div
                        className="w-5 h-5 rounded border border-gray-300"
                        style={{ backgroundColor: row.color }}
                        title={row.color}
                      ></div>
                    )}
                    <span>{row.color || "N/A"}</span>
                  </div>
                ),
              },
              {
                key: "additional_price",
                label: "Additional Price",
                mobileHide: true,
                render: (value: string) =>
                  value ? `৳${Number(value).toFixed(2)}` : "৳0.00",
              },
              {
                key: "stock_quantity",
                label: "Stock",
              },
              {
                key: "actions",
                label: "Actions",
                render: (_: any, row: ProductVariants) => (
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
            data={filteredProductVariants}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">
            No product variants found
          </div>
        )}
      </div>

      {/* Add Variant Modal */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-xl w-full max-w-2xl max-h-[90vh] overflow-y-auto m-4">
            <div className="p-6">
              <div className="flex justify-between items-center mb-6">
                <h2 className="text-2xl font-bold text-gray-900">Add New Product Variant</h2>
                <button
                  onClick={() => setShowModal(false)}
                  className="text-gray-400 hover:text-gray-600 text-2xl"
                >
                  ×
                </button>
              </div>

              <form onSubmit={handleSubmit} className="space-y-4">
                {/* Product Selection */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Product <span className="text-red-500">*</span>
                  </label>
                  <select
                    required
                    value={formData.product_id}
                    onChange={(e) => setFormData({ ...formData, product_id: e.target.value })}
                    className="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">Select a product</option>
                    {products.map((product) => (
                      <option key={product.id} value={product.id}>
                        {product.name} ({product.sku})
                      </option>
                    ))}
                  </select>
                </div>

                {/* Size Selection */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Size (Optional)
                  </label>
                  <select
                    value={formData.size_id}
                    onChange={(e) => setFormData({ ...formData, size_id: e.target.value })}
                    className="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">No size</option>
                    {sizes.map((size) => (
                      <option key={size.id} value={size.id}>
                        {size.name}
                      </option>
                    ))}
                  </select>
                </div>

                {/* Color */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Color (Optional)
                  </label>
                  <div className="flex gap-2">
                    <input
                      type="text"
                      value={formData.color}
                      onChange={(e) => setFormData({ ...formData, color: e.target.value })}
                      placeholder="e.g., Red, Blue, #FF5733"
                      className="flex-1 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                    <input
                      type="color"
                      value={formData.color.startsWith('#') ? formData.color : '#000000'}
                      onChange={(e) => setFormData({ ...formData, color: e.target.value })}
                      className="w-16 h-10 border border-gray-300 rounded-lg cursor-pointer"
                    />
                  </div>
                </div>

                {/* Additional Price */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Additional Price (Optional)
                  </label>
                  <input
                    type="number"
                    step="0.01"
                    min="0"
                    value={formData.additional_price}
                    onChange={(e) => setFormData({ ...formData, additional_price: e.target.value })}
                    placeholder="0.00"
                    className="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  />
                  <p className="text-xs text-gray-500 mt-1">Extra price added to base product price</p>
                </div>

                {/* Stock Quantity */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Stock Quantity <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="number"
                    required
                    min="0"
                    value={formData.stock_quantity}
                    onChange={(e) => setFormData({ ...formData, stock_quantity: e.target.value })}
                    placeholder="0"
                    className="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  />
                </div>

                {/* Action Buttons */}
                <div className="flex gap-3 pt-4">
                  <button
                    type="submit"
                    disabled={submitting}
                    className="flex-1 bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed transition"
                  >
                    {submitting ? "Adding..." : "Add Variant"}
                  </button>
                  <button
                    type="button"
                    onClick={() => setShowModal(false)}
                    className="flex-1 bg-gray-200 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-300 transition"
                  >
                    Cancel
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </AdminLayout>
  );
}