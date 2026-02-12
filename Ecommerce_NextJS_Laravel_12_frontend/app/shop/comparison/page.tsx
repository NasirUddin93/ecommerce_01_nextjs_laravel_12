"use client";
import React, { useState } from "react";
import Layout from "../../components/Layouts";
import Image from "next/image";
import Link from "next/link";
import { X, ShoppingCart, Heart, Star } from "lucide-react";
import { useComparison, ComparisonProduct } from "../../contexts/ComparisonContext";
import { trackEvent } from "../../common/analytics";

export default function ComparisonPage() {
  const { comparisonProducts, removeProduct, clearComparison } = useComparison();
  const [wishlist, setWishlist] = useState<number[]>([]);

  const toggleWishlist = (productId: number) => {
    setWishlist((prev) =>
      prev.includes(productId) ? prev.filter((id) => id !== productId) : [...prev, productId]
    );
    trackEvent("toggle_wishlist", { product_id: productId });
  };

  const handleAddToCart = (product: ComparisonProduct) => {
    trackEvent("add_to_cart", {
      product_id: product.id,
      product_name: product.name,
      price: product.price,
    });
  };

  if (comparisonProducts.length === 0) {
    return (
      <Layout>
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
          <div className="text-center py-16">
            <h1 className="text-3xl font-bold text-gray-900 mb-4">Compare Products</h1>
            <p className="text-gray-600 mb-8">You haven't added any products to compare yet.</p>
            <Link
              href="/shop"
              className="inline-block bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
            >
              Continue Shopping
            </Link>
          </div>
        </div>
      </Layout>
    );
  }

  // Get all specifications from products
  const specifications = [
    "Price",
    "Rating",
    "Stock",
    "Badge",
    ...new Set(comparisonProducts.flatMap((p: ComparisonProduct) => ["Category", "Brand"])),
  ];

  return (
    <Layout>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="flex items-center justify-between mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Compare Products</h1>
          {comparisonProducts.length > 0 && (
            <button
              onClick={clearComparison}
              className="text-red-600 hover:text-red-700 font-semibold"
            >
              Clear All
            </button>
          )}
        </div>

        {/* Horizontal scroll comparison table */}
        <div className="overflow-x-auto bg-white rounded-lg shadow">
          <table className="w-full">
            <thead>
              <tr className="border-b border-gray-200">
                <th className="px-6 py-4 text-left text-sm font-semibold text-gray-900 bg-gray-50 sticky left-0 z-10 min-w-[150px]">
                  Specification
                </th>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <th
                    key={product.id}
                    className="px-6 py-4 text-center text-sm font-semibold text-gray-900 bg-gray-50 min-w-[250px]"
                  >
                    <div className="flex flex-col items-center gap-4">
                      <button
                        onClick={() => removeProduct(product.id)}
                        className="ml-auto text-gray-400 hover:text-red-600 transition-colors"
                      >
                        <X className="h-5 w-5" />
                      </button>
                      <Image
                        src={product.image}
                        alt={product.name}
                        width={150}
                        height={150}
                        className="h-32 w-32 object-cover rounded"
                      />
                      <h3 className="font-semibold text-gray-900 text-center">{product.name}</h3>
                    </div>
                  </th>
                ))}
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200">
              {/* Price Row */}
              <tr className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50 sticky left-0 z-10">
                  Price
                </td>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <td key={product.id} className="px-6 py-4 text-center text-sm text-gray-900">
                    <div className="font-semibold text-lg text-blue-600">৳{product.price.toFixed(2)}</div>
                    {product.originalPrice && (
                      <div className="text-sm text-gray-500 line-through">
                        ৳{product.originalPrice.toFixed(2)}
                      </div>
                    )}
                  </td>
                ))}
              </tr>

              {/* Rating Row */}
              <tr className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50 sticky left-0 z-10">
                  Rating
                </td>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <td key={product.id} className="px-6 py-4 text-center text-sm text-gray-900">
                    <div className="flex items-center justify-center gap-1">
                      <Star className="h-4 w-4 text-yellow-400 fill-yellow-400" />
                      <span className="font-semibold">{product.rating.toFixed(1)}</span>
                    </div>
                    <div className="text-xs text-gray-500">({product.reviews} reviews)</div>
                  </td>
                ))}
              </tr>

              {/* Stock Row */}
              <tr className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50 sticky left-0 z-10">
                  Stock Status
                </td>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <td key={product.id} className="px-6 py-4 text-center text-sm text-gray-900">
                    {product.stock && product.stock > 0 ? (
                      <span className="text-green-600 font-semibold">{product.stock} in stock</span>
                    ) : (
                      <span className="text-red-600 font-semibold">Out of stock</span>
                    )}
                  </td>
                ))}
              </tr>

              {/* Badge Row */}
              <tr className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50 sticky left-0 z-10">
                  Badge
                </td>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <td key={product.id} className="px-6 py-4 text-center text-sm text-gray-900">
                    {product.badge ? (
                      <span className="inline-block bg-red-100 text-red-800 px-3 py-1 rounded-full text-xs font-semibold">
                        {product.badge}
                      </span>
                    ) : (
                      <span className="text-gray-400">-</span>
                    )}
                  </td>
                ))}
              </tr>

              {/* Action Row */}
              <tr className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50 sticky left-0 z-10">
                  Actions
                </td>
                {comparisonProducts.map((product: ComparisonProduct) => (
                  <td key={product.id} className="px-6 py-4 text-center">
                    <div className="flex flex-col gap-2">
                      <button
                        onClick={() => handleAddToCart(product)}
                        className="inline-flex items-center justify-center gap-2 bg-blue-600 text-white px-4 py-2 rounded font-semibold hover:bg-blue-700 transition-colors text-sm"
                      >
                        <ShoppingCart className="h-4 w-4" />
                        Add to Cart
                      </button>
                      <button
                        onClick={() => toggleWishlist(product.id)}
                        className={`inline-flex items-center justify-center gap-2 px-4 py-2 rounded font-semibold transition-colors text-sm ${
                          wishlist.includes(product.id)
                            ? "bg-red-100 text-red-600 hover:bg-red-200"
                            : "bg-gray-100 text-gray-600 hover:bg-gray-200"
                        }`}
                      >
                        <Heart className={`h-4 w-4 ${wishlist.includes(product.id) ? "fill-current" : ""}`} />
                        {wishlist.includes(product.id) ? "Wishlisted" : "Wishlist"}
                      </button>
                    </div>
                  </td>
                ))}
              </tr>
            </tbody>
          </table>
        </div>

        {/* Recommendation Section */}
        <div className="mt-12 p-8 bg-blue-50 rounded-lg border border-blue-200">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Comparison Summary</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {comparisonProducts.map((product: ComparisonProduct) => (
              <div key={product.id} className="bg-white p-4 rounded border border-gray-200">
                <h3 className="font-semibold text-gray-900 mb-2">{product.name}</h3>
                <ul className="text-sm text-gray-600 space-y-1">
                  <li>
                    <strong>Price:</strong> ৳{product.price.toFixed(2)}
                    {product.originalPrice && (
                      <>
                        {" "}
                        <span className="line-through text-gray-400">৳{product.originalPrice.toFixed(2)}</span>
                        {" "}
                        <span className="text-green-600">
                          Save {(((product.originalPrice - product.price) / product.originalPrice) * 100).toFixed(0)}%
                        </span>
                      </>
                    )}
                  </li>
                  <li>
                    <strong>Rating:</strong> {product.rating.toFixed(1)} ⭐ ({product.reviews} reviews)
                  </li>
                  <li>
                    <strong>Stock:</strong> {product.stock && product.stock > 0 ? "In Stock" : "Out of Stock"}
                  </li>
                </ul>
              </div>
            ))}
          </div>
        </div>

        <div className="mt-12 text-center">
          <Link
            href="/shop"
            className="inline-block bg-gray-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-gray-700 transition-colors"
          >
            Continue Shopping
          </Link>
        </div>
      </div>
    </Layout>
  );
}
