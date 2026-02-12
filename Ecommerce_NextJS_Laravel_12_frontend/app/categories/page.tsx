"use client";

import { useState, useEffect } from "react";
import Layout from "../components/Layouts";
import Link from "next/link";
import { apiUrl } from "../common/http";

interface Category {
  id: number;
  name: string;
  description: string;
  status: number;
}

export default function CategoriesPage() {
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        setLoading(true);
        const res = await fetch(`${apiUrl}/categories`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
        });

        if (!res.ok) {
          throw new Error("Failed to fetch categories");
        }

        const result = await res.json();
        const activeCategories = (result.data || result).filter(
          (cat: Category) => cat.status === 1
        );
        setCategories(activeCategories);
      } catch (err) {
        console.error("Error fetching categories:", err);
        setError("Failed to load categories. Please try again later.");
      } finally {
        setLoading(false);
      }
    };

    fetchCategories();
  }, []);

  return (
    <Layout>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-3xl font-bold mb-4 text-gray-900">Categories</h1>
        <p className="mb-8 text-gray-600 text-lg">Explore our product categories.</p>

        {loading && (
          <div className="text-center py-12">
            <div className="inline-block">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
            </div>
            <p className="text-gray-500 mt-4">Loading categories...</p>
          </div>
        )}

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg">
            {error}
          </div>
        )}

        {!loading && !error && categories.length === 0 && (
          <div className="text-center py-12">
            <p className="text-gray-500 text-lg">No categories found.</p>
          </div>
        )}

        {!loading && !error && categories.length > 0 && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {categories.map((category) => (
              <Link
                key={category.id}
                href={`/shop?category=${category.id}`}
                className="group relative overflow-hidden rounded-lg border border-gray-200 hover:border-blue-500 transition-all hover:shadow-lg"
              >
                <div className="bg-gradient-to-br from-blue-50 to-blue-100 aspect-square flex items-center justify-center p-6">
                  <div className="text-center">
                    <div className="text-4xl mb-2">📦</div>
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition">
                      {category.name}
                    </h3>
                  </div>
                </div>
                <div className="p-4">
                  <p className="text-sm text-gray-600 line-clamp-2">
                    {category.description || "Browse our collection"}
                  </p>
                  <div className="mt-4 pt-4 border-t border-gray-200">
                    <span className="inline-block text-sm font-semibold text-blue-600 group-hover:text-blue-700">
                      View Products →
                    </span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}
      </div>
    </Layout>
  );
}
