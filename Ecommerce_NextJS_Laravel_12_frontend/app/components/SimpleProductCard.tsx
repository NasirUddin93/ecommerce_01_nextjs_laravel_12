"use client";

import Link from "next/link";
import { Star, ShoppingCart } from "lucide-react";
import { useState } from "react";
import { localBaseUrl } from "../common/http";

interface APIProduct {
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
}

interface SimpleProductCardProps {
  product: APIProduct;
}

export default function SimpleProductCard({ product }: SimpleProductCardProps) {
  const [imageLoaded, setImageLoaded] = useState(false);

  const getImageUrl = (imageUrl: string) => {
    if (!imageUrl) return '';
    if (imageUrl.startsWith('http')) return imageUrl;
    if (imageUrl.startsWith('/storage/')) return `${localBaseUrl}${imageUrl}`;
    return `${localBaseUrl}${imageUrl.startsWith('/') ? '' : '/'}${imageUrl}`;
  };

  const primaryImage = product.images?.find(img => img.is_primary) || product.images?.[0];
  const imageUrl = primaryImage ? getImageUrl(primaryImage.image_url) : '';

  const renderStars = (rating: number = 4) => {
    return Array.from({ length: 5 }).map((_, index) => (
      <Star
        key={index}
        className={`h-4 w-4 ${
          index < Math.floor(rating)
            ? "text-yellow-400 fill-current"
            : "text-gray-300"
        }`}
      />
    ));
  };

  return (
    <Link href={`/shop/${product.id}`}>
      <div className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden group border border-gray-100 h-full cursor-pointer">
        {/* Image Container */}
        <div className="relative aspect-square bg-gray-100 overflow-hidden">
          {imageUrl ? (
            <img
              src={imageUrl}
              alt={product.name}
              className="object-cover w-full h-full group-hover:scale-105 transition-transform duration-300"
              onLoad={() => setImageLoaded(true)}
              onError={(e) => {
                console.error("Image failed to load:", imageUrl);
                e.currentTarget.src = `https://via.placeholder.com/300x300?text=${encodeURIComponent(product.name)}`;
              }}
            />
          ) : (
            <div className="flex items-center justify-center w-full h-full bg-gray-200 text-gray-400">
              <span className="text-center text-sm px-2">No Image</span>
            </div>
          )}

          {/* Badges */}
          <div className="absolute top-2 left-2 flex gap-2">
            {product.stock_quantity > 0 && (
              <span className="bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">
                In Stock
              </span>
            )}
          </div>

          {/* Stock Status */}
          {product.stock_quantity === 0 && (
            <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
              <span className="text-white font-semibold">Out of Stock</span>
            </div>
          )}

          {/* Hover Add to Cart */}
          <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-all duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">
            <button
              onClick={(e) => {
                e.preventDefault();
                e.stopPropagation();
                alert("Add to cart feature coming soon!");
              }}
              className="bg-white rounded-full p-3 shadow-lg hover:bg-blue-500 hover:text-white transition-colors duration-200"
              disabled={product.stock_quantity === 0}
            >
              <ShoppingCart className="w-6 h-6" />
            </button>
          </div>
        </div>

        {/* Content */}
        <div className="p-4">
          {/* Product Name */}
          <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 group-hover:text-blue-600 transition-colors">
            {product.name}
          </h3>

          {/* Rating */}
          <div className="flex items-center gap-2 mb-3">
            <div className="flex">{renderStars(4)}</div>
            <span className="text-xs text-gray-500">(0 reviews)</span>
          </div>

          {/* Description */}
          <p className="text-sm text-gray-600 mb-3 line-clamp-2">
            {product.description || "High-quality product"}
          </p>

          {/* Price */}
          <div className="flex items-center justify-between pt-3 border-t border-gray-100">
            <span className="text-xl font-bold text-gray-900">
              ৳{Number(product.base_price).toFixed(2)}
            </span>
            {product.stock_quantity > 0 && (
              <span className="text-xs text-gray-500">
                {product.stock_quantity} available
              </span>
            )}
          </div>
        </div>
      </div>
    </Link>
  );
}
