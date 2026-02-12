"use client";
import React from "react";
import Image from "next/image";
import Link from "next/link";
import { Heart, Eye, Scale, ShoppingCart, Star } from "lucide-react";
import { useComparison, ComparisonProduct } from "../contexts/ComparisonContext";
import { useWishlist } from "../contexts/WishlistContext";
import { trackProductView, trackAddToCart } from "../common/analytics";

interface ProductCardProps {
  id?: number;
  product?: any;
  name?: string;
  price?: number;
  originalPrice?: number;
  image?: string;
  rating?: number;
  reviews?: number;
  reviewCount?: number;
  badge?: string;
  stock?: number;
  images?: Array<{ image_path?: string; image_url?: string }>;
  onQuickView?: (product: any) => void;
  onAddToCart?: (product: any) => void;
  isNew?: boolean;
  isBestseller?: boolean;
  discount?: number;
  brand?: string;
}

const ProductCard: React.FC<ProductCardProps> = (props) => {
  const {
    addProduct,
    removeProduct,
    isInComparison,
    canAddMore,
  } = useComparison();
  
  const { isWishlisted, addToWishlist, removeFromWishlist } = useWishlist();

  // Handle both old and new prop structures
  const product = props.product || {
    id: props.id,
    name: props.name,
    price: props.price,
    originalPrice: props.originalPrice,
    image: props.image,
    rating: props.rating,
    reviewCount: props.reviews || props.reviewCount,
    badge: props.badge,
    stock: props.stock,
    images: props.images,
    brand: props.brand,
  };

  const id = product.id;
  const name = product.name;
  const price = product.price;
  const originalPrice = product.originalPrice || product.original_price;
  const image = product.image || product.images?.[0]?.image_path || product.images?.[0]?.image_url;
  const rating = product.rating || 4.5;
  const reviews = product.reviewCount || product.reviews || product.review_count || 0;
  const badge = product.badge || (product.isNew ? "New" : "");
  const stock = product.stock || 0;
  const images = product.images;

  const renderStars = (rating: number) => {
    return Array.from({ length: 5 }).map((_, index) => (
      <Star
        key={index}
        className={`w-3 h-3 ${
          index < Math.floor(rating) ? "fill-yellow-400 text-yellow-400" : "text-gray-300"
        }`}
      />
    ));
  };

  const handleWishlist = async (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (!id) {
      return;
    }
    try {
      if (isWishlisted(id)) {
        await removeFromWishlist(id);
      } else {
        await addToWishlist(id);
      }
    } catch (err) {
      alert(err instanceof Error ? err.message : "Wishlist update failed");
    }
  };

  const handleQuickView = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    trackProductView(id, name, price);
    if (props.onQuickView) {
      props.onQuickView(product);
    }
  };

  const handleAddToCart = (e?: React.MouseEvent) => {
    if (e) {
      e.preventDefault();
      e.stopPropagation();
    }
    trackAddToCart(id, name, price, 1);
    if (props.onAddToCart) {
      props.onAddToCart(product);
    }
  };

  const handleComparison = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    const compProduct: ComparisonProduct = {
      id,
      name,
      price,
      originalPrice,
      image,
      rating,
      reviews,
      badge,
      stock,
      images,
    };

    if (isInComparison(id)) {
      removeProduct(id);
    } else if (canAddMore()) {
      addProduct(compProduct);
    } else {
      alert("You can compare up to 4 products. Remove one to add another.");
    }
  };

  const discount = originalPrice
    ? Math.round(((originalPrice - price) / originalPrice) * 100)
    : props.discount || 0;

  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-all duration-300 group">
      <div className="relative overflow-hidden">
        {/* Product Image */}
        <div className="aspect-square bg-gray-100 relative">
          {image ? (
            <Image
              src={image}
              alt={name}
              fill
              priority
              quality={75}
              className="object-cover group-hover:scale-110 transition-transform duration-300"
            />
          ) : (
            <div className="w-full h-full bg-gradient-to-br from-gray-200 to-gray-300 flex items-center justify-center">
              <span className="text-gray-500 text-sm">Product Image</span>
            </div>
          )}

          {/* Badges */}
          <div className="absolute top-2 left-2 flex flex-col gap-1">
            {badge && (
              <span className="bg-red-500 text-white px-2 py-1 rounded text-xs font-medium">
                {badge}
              </span>
            )}
            {props.isBestseller && (
              <span className="bg-orange-500 text-white px-2 py-1 rounded text-xs font-medium">
                Bestseller
              </span>
            )}
            {discount > 0 && (
              <span className="bg-green-500 text-white px-2 py-1 rounded text-xs font-medium">
                -{discount}%
              </span>
            )}
          </div>

          {/* Stock Status */}
          <div className="absolute top-2 right-2">
            {stock > 0 ? (
              <span className="bg-green-100 text-green-800 px-2 py-1 rounded text-xs font-medium">
                In Stock
              </span>
            ) : (
              <span className="bg-red-100 text-red-800 px-2 py-1 rounded text-xs font-medium">
                Out of Stock
              </span>
            )}
          </div>

          {/* Hover Actions */}
          <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-10 transition-all duration-300 flex items-center justify-center gap-2 opacity-0 group-hover:opacity-100">
            <button
              onClick={handleAddToCart}
              className="bg-white rounded-full p-2 shadow-lg hover:bg-blue-500 hover:text-white transition-colors duration-200"
              disabled={stock === 0}
              title="Add to Cart"
            >
              <ShoppingCart className="w-5 h-5" />
            </button>
            <button
              onClick={handleQuickView}
              className="bg-white rounded-full p-2 shadow-lg hover:bg-blue-500 hover:text-white transition-colors duration-200"
              title="Quick View"
            >
              <Eye className="w-5 h-5" />
            </button>
            <button
              onClick={handleComparison}
              className={`rounded-full p-2 shadow-lg transition-colors duration-200 ${
                isInComparison(id)
                  ? "bg-blue-500 text-white"
                  : "bg-white hover:bg-blue-500 hover:text-white"
              }`}
              title={isInComparison(id) ? "Remove from comparison" : "Add to comparison"}
            >
              <Scale className="w-5 h-5" />
            </button>
            <button
              onClick={handleWishlist}
              className={`rounded-full p-2 shadow-lg transition-colors duration-200 ${
                id && isWishlisted(id)
                  ? "bg-red-500 text-white"
                  : "bg-white hover:bg-red-500 hover:text-white"
              }`}
              title={id && isWishlisted(id) ? "Remove from wishlist" : "Add to wishlist"}
            >
              <Heart className={`w-5 h-5 ${id && isWishlisted(id) ? "fill-current" : ""}`} />
            </button>
          </div>
        </div>
      </div>

      <div className="p-4">
        {/* Brand */}
        {props.brand && (
          <p className="text-sm text-gray-500 mb-1">{props.brand}</p>
        )}

        {/* Product Name */}
        <h3 className="font-semibold text-lg mb-2 line-clamp-2 hover:text-blue-600 cursor-pointer transition-colors">
          {name}
        </h3>

        {/* Rating */}
        <div className="flex items-center gap-2 mb-2">
          <div className="flex">{renderStars(rating)}</div>
          <span className="text-sm text-gray-600">({reviews})</span>
        </div>

        {/* Price */}
        <div className="flex items-center gap-2 mb-3">
          <span className="text-xl font-bold text-gray-900">৳{price.toFixed(2)}</span>
          {originalPrice > price && (
            <span className="text-sm text-gray-500 line-through">
              ৳{originalPrice.toFixed(2)}
            </span>
          )}
        </div>

        {/* Add to Cart Button */}
        <button
          onClick={handleAddToCart}
          disabled={stock === 0}
          className={`w-full py-2 px-4 rounded-lg font-medium transition-colors duration-200 ${
            stock === 0
              ? "bg-gray-300 text-gray-500 cursor-not-allowed"
              : "bg-blue-600 text-white hover:bg-blue-700"
          }`}
        >
          {stock === 0 ? "Out of Stock" : "Add to Cart"}
        </button>
      </div>
    </div>
  );
};

export default ProductCard;