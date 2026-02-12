"use client";

import { useEffect, useState } from "react";
import { useSearchParams } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import Layout from "../components/Layouts";
import { Star, Heart, ArrowLeft } from "lucide-react";
import { apiUrl } from "../common/http";
import { trackSearch, trackPageView } from "../common/analytics";

interface Product {
  id: number;
  name: string;
  price: number;
  originalPrice?: number;
  rating: number;
  reviews: number;
  stock: number;
  images?: Array<{ image_path?: string; image_url?: string }>;
}

export default function SearchPage() {
  const searchParams = useSearchParams();
  const query = searchParams.get("q") || "";
  
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(false);
  const [sortBy, setSortBy] = useState("relevance");
  const [priceRange, setPriceRange] = useState([0, 10000]);
  const [ratingFilter, setRatingFilter] = useState(0);

  const searchProducts = async (searchQuery: string) => {
    if (!searchQuery.trim()) {
      setProducts([]);
      return;
    }

    try {
      setLoading(true);
      // Track search event
      trackSearch(searchQuery);
      
      const params = new URLSearchParams({
        search: searchQuery,
        sort: sortBy,
        min_price: String(priceRange[0]),
        max_price: String(priceRange[1]),
        min_rating: String(ratingFilter),
      });

      const res = await fetch(`${apiUrl}/products/search?${params}`);
      const data = await res.json();
      
      if (data.status === 200 && Array.isArray(data.data)) {
        setProducts(data.data);
      } else {
        setProducts([]);
      }
    } catch (error) {
      console.error("Search error:", error);
      setProducts([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    // Track page view
    trackPageView("Search Results");
    searchProducts(query);
  }, [query, sortBy, priceRange, ratingFilter]);

  const getImageUrl = (product: Product): string => {
    if (product.images && product.images.length > 0) {
      return product.images[0].image_path || product.images[0].image_url || "/placeholder.jpg";
    }
    return "/placeholder.jpg";
  };

  return (
    <Layout>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* Header */}
        <div className="mb-8">
          <Link href="/" className="inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 mb-4">
            <ArrowLeft className="h-5 w-5" />
            Back to Home
          </Link>
          <h1 className="text-3xl font-bold text-gray-900">Search Results</h1>
          {query && (
            <p className="text-lg text-gray-600 mt-2">
              Results for "<span className="font-semibold">{query}</span>"
              {products.length > 0 && <span> ({products.length} products found)</span>}
            </p>
          )}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Filters Sidebar */}
          <div className="md:col-span-1">
            <div className="bg-white rounded-lg p-6 shadow-sm">
              <h3 className="text-lg font-bold mb-4">Filters</h3>

              {/* Sort */}
              <div className="mb-6">
                <h4 className="font-semibold text-gray-900 mb-3">Sort By</h4>
                <select
                  value={sortBy}
                  onChange={(e) => setSortBy(e.target.value)}
                  className="w-full p-2 border border-gray-300 rounded-lg text-sm"
                >
                  <option value="relevance">Relevance</option>
                  <option value="price_low">Price: Low to High</option>
                  <option value="price_high">Price: High to Low</option>
                  <option value="newest">Newest</option>
                  <option value="rating">Top Rated</option>
                </select>
              </div>

              {/* Price Range */}
              <div className="mb-6">
                <h4 className="font-semibold text-gray-900 mb-3">Price Range</h4>
                <div className="flex gap-2 mb-3">
                  <input
                    type="number"
                    placeholder="Min"
                    value={priceRange[0]}
                    onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
                    className="flex-1 p-2 border border-gray-300 rounded-lg text-sm"
                  />
                  <input
                    type="number"
                    placeholder="Max"
                    value={priceRange[1]}
                    onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000])}
                    className="flex-1 p-2 border border-gray-300 rounded-lg text-sm"
                  />
                </div>
                <div className="text-sm text-gray-600">৳{priceRange[0]} - ৳{priceRange[1]}</div>
              </div>

              {/* Rating Filter */}
              <div className="mb-6">
                <h4 className="font-semibold text-gray-900 mb-3">Rating</h4>
                <div className="space-y-2">
                  {[5, 4, 3, 2, 1, 0].map((rating) => (
                    <label key={rating} className="flex items-center gap-2 cursor-pointer">
                      <input
                        type="radio"
                        name="rating"
                        value={rating}
                        checked={ratingFilter === rating}
                        onChange={(e) => setRatingFilter(parseInt(e.target.value))}
                        className="rounded"
                      />
                      <span className="text-sm text-gray-700">
                        {rating > 0 ? `${rating}+ Stars` : "All Ratings"}
                      </span>
                    </label>
                  ))}
                </div>
              </div>
            </div>
          </div>

          {/* Products Grid */}
          <div className="md:col-span-3">
            {loading ? (
              <div className="text-center py-12">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
                <p className="mt-4 text-gray-600">Searching...</p>
              </div>
            ) : products.length > 0 ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {products.map((product) => (
                  <div
                    key={product.id}
                    className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden group border border-gray-100"
                  >
                    <div className="relative aspect-square bg-gray-100">
                      <Image
                        src={getImageUrl(product)}
                        alt={product.name}
                        fill
                        className="object-cover group-hover:scale-105 transition-transform"
                        loading="lazy"
                      />
                      <button className="absolute top-2 right-2 bg-white p-2 rounded-full shadow-md hover:bg-red-50 transition-colors">
                        <Heart className="h-5 w-5 text-gray-600 hover:text-red-600" />
                      </button>
                    </div>
                    <div className="p-4">
                      <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2">{product.name}</h3>
                      <div className="flex items-center gap-1 mb-2">
                        {[...Array(5)].map((_, i) => (
                          <Star
                            key={i}
                            className={`h-4 w-4 ${
                              i < Math.floor(product.rating)
                                ? "fill-yellow-400 text-yellow-400"
                                : "text-gray-300"
                            }`}
                          />
                        ))}
                        <span className="text-sm text-gray-600 ml-1">({product.reviews})</span>
                      </div>
                      <div className="flex items-center gap-2 mb-3">
                        <span className="text-xl font-bold text-gray-900">৳{product.price}</span>
                        {product.originalPrice && (
                          <span className="text-sm text-gray-500 line-through">৳{product.originalPrice}</span>
                        )}
                      </div>

                      {product.stock !== undefined && (
                        <div className="mb-3">
                          {product.stock === 0 ? (
                            <p className="text-red-600 text-sm font-semibold">Out of Stock</p>
                          ) : product.stock <= 5 ? (
                            <p className="text-orange-600 text-sm font-semibold">Only {product.stock} left!</p>
                          ) : (
                            <p className="text-green-600 text-sm font-semibold">In Stock</p>
                          )}
                        </div>
                      )}

                      <button
                        disabled={product.stock === 0}
                        className={`w-full px-4 py-2 rounded-lg text-sm font-semibold transition-colors ${
                          product.stock === 0
                            ? "bg-gray-300 text-gray-600 cursor-not-allowed"
                            : "bg-blue-600 hover:bg-blue-700 text-white"
                        }`}
                      >
                        {product.stock === 0 ? "Out of Stock" : "Add to Cart"}
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-12 bg-white rounded-lg">
                <p className="text-gray-500 text-lg mb-4">
                  {query ? `No products found matching "${query}"` : "Enter a search term to find products"}
                </p>
                <Link
                  href="/"
                  className="inline-block bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Continue Shopping
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>
    </Layout>
  );
}
