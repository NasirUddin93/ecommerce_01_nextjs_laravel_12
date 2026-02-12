"use client";

import { useState, useEffect } from "react";
import Layout from "../components/Layouts";
import SimpleProductCard from "../components/SimpleProductCard";
import { apiUrl } from "../common/http";

interface Product {
  id: number;
  name: string;
  sku: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  status: string;
  category_id: number;
  brand_id: number;
  images: Array<{
    id: number;
    image_url: string;
    is_primary: boolean;
  }>;
  created_at: string;
}

export default function NewArrivalsPage() {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        setLoading(true);
        const res = await fetch(`${apiUrl}/products`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
        });

        if (!res.ok) {
          throw new Error("Failed to fetch products");
        }

        const result = await res.json();
        const allProducts = (result.data || result).filter(
          (p: Product) => p.status === "active"
        );

        // Sort by creation date to get newest first
        const newArrivals = allProducts
          .sort(
            (a: Product, b: Product) =>
              new Date(b.created_at).getTime() -
              new Date(a.created_at).getTime()
          )
          .slice(0, 24); // Limit to 24 products

        setProducts(newArrivals);
      } catch (err) {
        console.error("Error fetching products:", err);
        setError("Failed to load products. Please try again later.");
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, []);

  return (
    <Layout>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-3xl font-bold mb-4 text-gray-900">New Arrivals</h1>
        <p className="mb-8 text-gray-600 text-lg">
          Browse our latest collection of products.
        </p>

        {loading && (
          <div className="text-center py-12">
            <div className="inline-block">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
            </div>
            <p className="text-gray-500 mt-4">Loading products...</p>
          </div>
        )}

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg">
            {error}
          </div>
        )}

        {!loading && !error && products.length === 0 && (
          <div className="text-center py-12">
            <p className="text-gray-500 text-lg">No products found.</p>
          </div>
        )}

        {!loading && !error && products.length > 0 && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {products.map((product) => (
              <SimpleProductCard key={product.id} product={product} />
            ))}
          </div>
        )}
      </div>
    </Layout>
  );
}
  