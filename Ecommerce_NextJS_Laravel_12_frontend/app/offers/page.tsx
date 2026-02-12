"use client";

import { useState, useEffect } from "react";
import Layout from "../components/Layouts";
import SimpleProductCard from "../components/SimpleProductCard";
import Link from "next/link";
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

interface Discount {
  id: number;
  title: string;
  description: string;
  discount_percentage: number;
}

export default function OffersPage() {
  const [products, setProducts] = useState<Product[]>([]);
  const [discounts, setDiscounts] = useState<Discount[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);

        // Fetch products
        const productsRes = await fetch(`${apiUrl}/products`, {
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
        });

        if (!productsRes.ok) {
          throw new Error("Failed to fetch products");
        }

        const productsData = await productsRes.json();
        const activeProducts = (productsData.data || productsData)
          .filter((p: Product) => p.status === "active")
          .slice(0, 12);

        setProducts(activeProducts);

        // Try to fetch discounts (if endpoint exists)
        try {
          const discountsRes = await fetch(`${apiUrl}/discounts`, {
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          });
          if (discountsRes.ok) {
            const discountsData = await discountsRes.json();
            setDiscounts((discountsData.data || discountsData).slice(0, 3));
          }
        } catch (err) {
          console.log("Discounts endpoint not available, continuing without");
        }
      } catch (err) {
        console.error("Error fetching data:", err);
        setError("Failed to load offers. Please try again later.");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  return (
    <Layout>
      <div className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section className="relative bg-gradient-to-r from-red-600 to-red-700 h-96 flex items-center justify-center text-white">
          <div className="relative z-10 text-center max-w-2xl mx-auto px-4">
            <h1 className="text-5xl font-extrabold mb-4">
              Unbeatable Offers Just For You!
            </h1>
            <p className="text-xl mb-8">
              Discover amazing deals on your favorite products.
            </p>
            <Link
              href="#offers"
              className="inline-block bg-white text-red-600 hover:bg-gray-100 font-bold py-3 px-8 rounded-full transition duration-300"
            >
              Shop All Offers
            </Link>
          </div>
        </section>

        <div className="container mx-auto p-8">
          {/* Limited Time Offer Banner */}
          <div className="bg-yellow-400 text-gray-900 text-center p-4 rounded-lg shadow-md mb-8">
            <p className="text-lg font-semibold">
              🎉 Limited Time Offers! Grab them before they're gone! 🎉
            </p>
          </div>

          {/* Discounts Section */}
          {discounts.length > 0 && (
            <div className="mb-16">
              <h2 className="text-4xl font-bold text-gray-800 mb-10 text-center">
                Featured Discounts
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                {discounts.map((discount) => (
                  <div
                    key={discount.id}
                    className="bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300 overflow-hidden"
                  >
                    <div className="bg-gradient-to-r from-orange-500 to-red-500 p-6 text-white h-48 flex flex-col justify-center items-center">
                      <p className="text-6xl font-bold">
                        {discount.discount_percentage}%
                      </p>
                      <p className="text-lg mt-2">OFF</p>
                    </div>
                    <div className="p-6">
                      <h3 className="text-2xl font-bold text-gray-800 mb-2">
                        {discount.title}
                      </h3>
                      <p className="text-gray-600 mb-4">
                        {discount.description}
                      </p>
                      <Link
                        href="/shop"
                        className="w-full block text-center bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-lg transition duration-300"
                      >
                        Shop Now
                      </Link>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Products Section */}
          <div id="offers">
            <h2 className="text-4xl font-bold text-gray-800 mb-10 text-center">
              Special Offers on Products
            </h2>

            {loading && (
              <div className="text-center py-12">
                <div className="inline-block">
                  <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
                </div>
                <p className="text-gray-500 mt-4">Loading offers...</p>
              </div>
            )}

            {error && (
              <div className="bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg">
                {error}
              </div>
            )}

            {!loading && !error && products.length === 0 && (
              <div className="text-center py-12">
                <p className="text-gray-500 text-lg">No offers available.</p>
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
        </div>
      </div>
    </Layout>
  );
}
