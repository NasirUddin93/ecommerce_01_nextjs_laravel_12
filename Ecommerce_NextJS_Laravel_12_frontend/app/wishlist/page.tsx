"use client";

import { useEffect } from "react";
import Layout from "../components/Layouts";
import ProtectedRoute from "../components/ProtectedRoute";
import { Heart, ShoppingCart, Trash2, Package } from "lucide-react";
import { useCart } from "../contexts/CartContext";
import { useWishlist } from "../contexts/WishlistContext";
import Link from "next/link";

interface WishlistItem {
  id: number;
  product_id: number;
  product: {
    id: number;
    name: string;
    description: string;
    price: number;
    stock_quantity: number;
    images: Array<{ id: number; image_url: string }>;
  };
  created_at: string;
}

export default function WishlistPage() {
  const { wishlistItems, loading, error, removeFromWishlist, refreshWishlist } = useWishlist();
  const { addToCart } = useCart();

  useEffect(() => {
    refreshWishlist();
  }, [refreshWishlist]);

  const handleAddToCart = (product: WishlistItem["product"]) => {
    addToCart({
      id: product.id,
      name: product.name,
      price: product.price,
      image: product.images[0]?.image_url || "/placeholder.png",
      quantity: 1,
    });
  };

  return (
    <ProtectedRoute fallbackUrl="/login?redirect=/wishlist">
      <Layout>
        <div className="max-w-6xl mx-auto px-4 py-8">
          <div className="mb-8">
            <h1 className="text-3xl font-bold text-gray-900 mb-2 flex items-center gap-3">
              <Heart className="w-8 h-8 text-red-500 fill-red-500" />
              My Wishlist
            </h1>
            <p className="text-gray-600">
              {wishlistItems.length > 0
                ? `You have ${wishlistItems.length} item${
                    wishlistItems.length > 1 ? "s" : ""
                  } in your wishlist`
                : "Your wishlist is empty"}
            </p>
          </div>

          {loading && (
            <div className="flex justify-center items-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
          )}

          {error && (
            <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-lg mb-6">
              {error}
            </div>
          )}

          {!loading && wishlistItems.length === 0 && (
            <div className="text-center py-12 bg-white rounded-lg shadow-sm border">
              <Heart className="mx-auto h-16 w-16 text-gray-300 mb-4" />
              <h2 className="text-2xl font-bold text-gray-900 mb-2">
                Your wishlist is empty
              </h2>
              <p className="text-gray-600 mb-6">
                Start adding items you love to your wishlist!
              </p>
              <Link
                href="/"
                className="inline-block bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
              >
                Browse Products
              </Link>
            </div>
          )}

          {!loading && wishlistItems.length > 0 && (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {wishlistItems.map((item) => (
                <div
                  key={item.id}
                  className="bg-white rounded-lg shadow-sm border hover:shadow-md transition-shadow"
                >
                  {/* Product Image */}
                  <div className="relative aspect-square bg-gray-100 rounded-t-lg overflow-hidden">
                    <img
                      src={item.product.images[0]?.image_url || "/placeholder.png"}
                      alt={item.product.name}
                      className="w-full h-full object-cover"
                    />
                    {item.product.stock_quantity === 0 && (
                      <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                        <span className="bg-red-500 text-white px-4 py-2 rounded-lg font-semibold">
                          Out of Stock
                        </span>
                      </div>
                    )}
                  </div>

                  {/* Product Info */}
                  <div className="p-4">
                    <h3 className="font-semibold text-lg text-gray-900 mb-2 line-clamp-2">
                      {item.product.name}
                    </h3>
                    <p className="text-gray-600 text-sm mb-3 line-clamp-2">
                      {item.product.description}
                    </p>
                    <div className="flex items-center justify-between mb-4">
                      <span className="text-2xl font-bold text-blue-600">
                        ৳{item.product.price.toFixed(2)}
                      </span>
                      {item.product.stock_quantity > 0 && (
                        <span className="text-sm text-gray-500">
                          {item.product.stock_quantity} in stock
                        </span>
                      )}
                    </div>

                    {/* Actions */}
                    <div className="flex gap-2">
                      <button
                        onClick={() => handleAddToCart(item.product)}
                        disabled={item.product.stock_quantity === 0}
                        className="flex-1 bg-blue-600 text-white px-4 py-2 rounded-lg font-semibold hover:bg-blue-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                      >
                        <ShoppingCart className="w-4 h-4" />
                        Add to Cart
                      </button>
                      <button
                        onClick={() => removeFromWishlist(item.product_id)}
                        className="px-4 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-red-50 hover:border-red-300 hover:text-red-600 transition-colors"
                        title="Remove from wishlist"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </Layout>
    </ProtectedRoute>
  );
}
