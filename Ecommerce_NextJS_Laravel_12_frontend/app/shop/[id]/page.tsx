"use client";

import { useState, useEffect } from "react";
import { useParams } from "next/navigation";
import Layout from "../../components/Layouts";
import { apiUrl, getImageUrl } from "../../common/http";
import {
  ShoppingCart, Heart, Share2, Star, ChevronLeft, ChevronRight, Truck, Shield, RefreshCw,
  ChevronDown, ChevronUp, MessageCircle, Zap, Award, Leaf, Lock, Clock, MapPin, Check,
  Video, AlertCircle, Eye
} from "lucide-react";
import { useCart } from "../../contexts/CartContext";
import { useWishlist } from "../../contexts/WishlistContext";
import Link from "next/link";

interface ProductImage {
  id: number;
  image_url: string;
  is_primary: boolean;
}

interface Category {
  id: number;
  name: string;
}

interface Brand {
  id: number;
  name: string;
}

interface Review {
  id: number;
  rating: number;
  title: string;
  comment: string;
  author: string;
  verified: boolean;
  helpful: number;
  date: string;
}

interface QA {
  id: number;
  question: string;
  answer: string;
  author: string;
  date: string;
}

interface Variant {
  id: string;
  name: string;
  value: string;
  color?: string;
  image?: string;
  price?: number;
  stock: number;
}

interface Product {
  id: number;
  name: string;
  sku: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  weight: number;
  status: string;
  category_id: number;
  brand_id: number;
  images: ProductImage[];
  category?: Category;
  brand?: Brand;
  created_at: string;
  is_seasonal: boolean;
  seasonal_start_date: Date;
  seasonal_end_date: Date;
}

export default function ProductDetailsPage() {
  const params = useParams();
  const productId = params.id as string;
  
  const [product, setProduct] = useState<Product | null>(null);
  const [relatedProducts, setRelatedProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedImage, setSelectedImage] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const [showShareMenu, setShowShareMenu] = useState(false);
  const [showZoom, setShowZoom] = useState(false);
  const [zoomPosition, setZoomPosition] = useState({ x: 0, y: 0 });
  
  // New Feature States
  const [selectedVariant, setSelectedVariant] = useState<Variant | null>(null);
  const [expandedSection, setExpandedSection] = useState<string>("specs");
  const [reviews, setReviews] = useState<Review[]>([]);
  const [sortReviewsBy, setSortReviewsBy] = useState("helpful");
  const [filterRating, setFilterRating] = useState<number | null>(null);
  const [newReview, setNewReview] = useState({ rating: 5, title: "", comment: "", name: "" });
  const [showReviewForm, setShowReviewForm] = useState(false);
  const [qa, setQa] = useState<QA[]>([]);
  const [newQuestion, setNewQuestion] = useState("");
  const [showQAForm, setShowQAForm] = useState(false);
  const [recentlyViewed, setRecentlyViewed] = useState<Product[]>([]);
  const [notifyMe, setNotifyMe] = useState(false);
  const [compareProducts, setCompareProducts] = useState<Product[]>([]);
  
  const { addToCart } = useCart();
  const { isWishlisted, addToWishlist, removeFromWishlist } = useWishlist();

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        setLoading(true);
        const res = await fetch(`${apiUrl}/products/${productId}`, {
          headers: { "Content-Type": "application/json", Accept: "application/json" },
        });

        if (!res.ok) throw new Error("Product not found");

        const data = await res.json();
        const productData = data.data || data;
        setProduct(productData);

        // Add to recently viewed
        const viewed = JSON.parse(localStorage.getItem("recentlyViewed") || "[]");
        const filtered = viewed.filter((p: Product) => p.id !== productData.id);
        localStorage.setItem("recentlyViewed", JSON.stringify([productData, ...filtered].slice(0, 5)));

        // Fetch related products
        if (productData.category_id) {
          const relatedRes = await fetch(`${apiUrl}/products`, {
            headers: { "Content-Type": "application/json", Accept: "application/json" },
          });
          const relatedData = await relatedRes.json();
          const related = (relatedData.data || relatedData)
            .filter((p: Product) => p.category_id === productData.category_id && p.id !== productData.id && p.status === "active")
            .slice(0, 4);
          setRelatedProducts(related);
        }

        // Mock data for new features
        setReviews([
          { id: 1, rating: 5, title: "Excellent quality!", comment: "Exceeded my expectations. Great product.", author: "John Doe", verified: true, helpful: 24, date: "2 days ago" },
          { id: 2, rating: 4, title: "Very good", comment: "Good quality, fast shipping.", author: "Jane Smith", verified: true, helpful: 18, date: "1 week ago" },
          { id: 3, rating: 5, title: "Perfect!", comment: "Exactly what I needed.", author: "Mike Johnson", verified: true, helpful: 15, date: "2 weeks ago" },
        ]);

        setQa([
          { id: 1, question: "What is the warranty period?", answer: "This product comes with a 12-month warranty covering manufacturing defects.", author: "Support Team", date: "3 days ago" },
          { id: 2, question: "Is this product waterproof?", answer: "Yes, it is fully waterproof with IP67 rating.", author: "Support Team", date: "1 week ago" },
        ]);
      } catch (err) {
        console.error("Error fetching product:", err);
        setError("Failed to load product. Please try again.");
      } finally {
        setLoading(false);
      }
    };

    if (productId) fetchProduct();
  }, [productId]);

  if (loading) {
    return (
      <Layout>
        <div className="min-h-screen flex items-center justify-center bg-gray-50">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
            <p className="text-gray-600">Loading product details...</p>
          </div>
        </div>
      </Layout>
    );
  }

  if (error || !product) {
    return (
      <Layout>
        <div className="min-h-screen flex items-center justify-center bg-gray-50">
          <div className="text-center">
            <h1 className="text-2xl font-bold text-gray-900 mb-2">Product Not Found</h1>
            <p className="text-gray-600 mb-6">{error || "The product you're looking for doesn't exist."}</p>
            <Link href="/shop" className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700">
              Back to Shop
            </Link>
          </div>
        </div>
      </Layout>
    );
  }

  const primaryImage = product.images?.find(img => img.is_primary) || product.images?.[0];
  const currentImage = product.images?.[selectedImage] || primaryImage;
  const imageUrl = currentImage ? getImageUrl(currentImage.image_url) : '/placeholder.jpg';

  const handleAddToCart = () => {
    if (product) {
      // Add to cart 'quantity' times
      for (let i = 0; i < quantity; i++) {
        addToCart(product);
      }
    }
  };

  const handleWishlistToggle = async () => {
    if (!product) {
      return;
    }

    try {
      if (isWishlisted(product.id)) {
        await removeFromWishlist(product.id);
      } else {
        await addToWishlist(product.id);
      }
    } catch (err) {
      alert(err instanceof Error ? err.message : "Wishlist update failed");
    }
  };

  const handleShare = (platform: string) => {
    const url = window.location.href;
    const title = product.name;
    
    const shareUrls: { [key: string]: string } = {
      facebook: `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`,
      twitter: `https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}&text=${encodeURIComponent(title)}`,
      whatsapp: `https://wa.me/?text=${encodeURIComponent(title + " " + url)}`,
      email: `mailto:?subject=${encodeURIComponent(title)}&body=${encodeURIComponent(url)}`,
    };

    if (shareUrls[platform]) {
      window.open(shareUrls[platform], "_blank");
    }
  };

  const handleImageMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = ((e.clientX - rect.left) / rect.width) * 100;
    const y = ((e.clientY - rect.top) / rect.height) * 100;
    setZoomPosition({ x, y });
  };

  const nextImage = () => {
    if (product.images) {
      setSelectedImage((prev) => (prev + 1) % product.images.length);
    }
  };

  const prevImage = () => {
    if (product.images) {
      setSelectedImage((prev) => (prev - 1 + product.images.length) % product.images.length);
    }
  };

  const avgRating = reviews.length > 0 ? (reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length).toFixed(1) : "0";
  const ratingBreakdown = Array.from({ length: 5 }, (_, i) => {
    const rating = 5 - i;
    const count = reviews.filter(r => r.rating === rating).length;
    return { rating, count, percentage: (count / reviews.length) * 100 };
  });

  const filteredReviews = filterRating ? reviews.filter(r => r.rating === filterRating) : reviews;
  const sortedReviews = [...filteredReviews].sort((a, b) => {
    if (sortReviewsBy === "helpful") return b.helpful - a.helpful;
    if (sortReviewsBy === "newest") return new Date(b.date).getTime() - new Date(a.date).getTime();
    if (sortReviewsBy === "highest") return b.rating - a.rating;
    return a.rating - b.rating;
  });

  return (
    <Layout>
      <div className="bg-gray-50 min-h-screen py-8">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Breadcrumb */}
          <div className="mb-8">
            <div className="flex items-center space-x-2 text-sm text-gray-600">
              <Link href="/" className="hover:text-blue-600">Home</Link>
              <span>/</span>
              <Link href="/shop" className="hover:text-blue-600">Shop</Link>
              <span>/</span>
              <span className="text-gray-900 font-medium">{product.name}</span>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-16">
            {/* Product Images */}
            <div className="space-y-4">
              <div className="relative bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden group">
                <div
                  className="aspect-square flex items-center justify-center bg-gray-100 relative cursor-zoom-in"
                  onMouseEnter={() => setShowZoom(true)}
                  onMouseLeave={() => setShowZoom(false)}
                  onMouseMove={handleImageMouseMove}
                >
                  <img
                    src={imageUrl}
                    alt={product.name}
                    className="w-full h-full object-cover"
                    onError={(e) => {
                      e.currentTarget.src = '/placeholder.jpg';
                    }}
                  />
                  {showZoom && (
                    <div className="absolute top-4 left-4 bg-blue-600 text-white px-3 py-1 rounded-lg text-sm font-semibold flex items-center gap-2">
                      <span>🔍</span> Zoom
                    </div>
                  )}
                </div>

                {showZoom && (
                  <div className="absolute top-0 right-0 w-64 h-64 border-2 border-blue-600 rounded-lg overflow-hidden bg-white shadow-lg hidden lg:block">
                    <img
                      src={imageUrl}
                      alt={`${product.name} - Zoomed`}
                      className="w-full h-full object-cover"
                      style={{
                        transformOrigin: `${zoomPosition.x}% ${zoomPosition.y}%`,
                        transform: 'scale(3)',
                      }}
                      onError={(e) => {
                        e.currentTarget.src = '/placeholder.jpg';
                      }}
                    />
                  </div>
                )}

                {product.images && product.images.length > 1 && (
                  <>
                    <button
                      onClick={prevImage}
                      className="absolute left-4 top-1/2 transform -translate-y-1/2 bg-white rounded-full p-2 shadow-lg hover:shadow-xl transition opacity-0 group-hover:opacity-100 z-10"
                    >
                      <ChevronLeft className="h-6 w-6 text-gray-900" />
                    </button>
                    <button
                      onClick={nextImage}
                      className="absolute right-4 top-1/2 transform -translate-y-1/2 bg-white rounded-full p-2 shadow-lg hover:shadow-xl transition opacity-0 group-hover:opacity-100 z-10"
                    >
                      <ChevronRight className="h-6 w-6 text-gray-900" />
                    </button>
                  </>
                )}

                <div className="absolute top-4 right-4 z-10">
                  {product.stock_quantity > 0 ? (
                    <div className="bg-green-500 text-white px-3 py-1 rounded-full text-sm font-semibold">
                      In Stock ({product.stock_quantity})
                    </div>
                  ) : (
                    <div className="bg-red-500 text-white px-3 py-1 rounded-full text-sm font-semibold">
                      Out of Stock
                    </div>
                  )}
                </div>
              </div>

              {product.images && product.images.length > 1 && (
                <div className="flex gap-2 overflow-auto pb-2">
                  {product.images.map((img, index) => (
                    <button
                      key={img.id}
                      onClick={() => {
                        setSelectedImage(index);
                        setShowZoom(false);
                      }}
                      className={`flex-shrink-0 w-20 h-20 rounded-lg border-2 overflow-hidden transition ${
                        selectedImage === index ? "border-blue-600" : "border-gray-200 hover:border-gray-300"
                      }`}
                    >
                      <img
                        src={getImageUrl(img.image_url)}
                        alt={`Product ${index + 1}`}
                        className="w-full h-full object-cover"
                      />
                    </button>
                  ))}
                </div>
              )}

              {/* Feature 9: Video/Media Gallery */}
              <div className="bg-white p-4 rounded-lg border border-gray-200">
                <button className="flex items-center gap-2 text-blue-600 hover:text-blue-700 font-semibold">
                  <Video className="h-5 w-5" />
                  Watch Product Video
                </button>
              </div>
            </div>

            {/* Product Details */}
            <div className="space-y-6">
              {/* Header */}
              <div>
                <div className="flex items-center justify-between mb-2">
                  <h1 className="text-3xl font-bold text-gray-900">{product.name}</h1>
                  <button
                    onClick={handleWishlistToggle}
                    className={`p-2 rounded-lg border-2 transition ${
                      isWishlisted(product.id)
                        ? "border-red-500 bg-red-50"
                        : "border-gray-300 hover:border-red-500"
                    }`}
                  >
                    <Heart
                      className={`h-6 w-6 ${isWishlisted(product.id) ? "fill-red-500 text-red-500" : "text-gray-400"}`}
                    />
                  </button>
                </div>
                <p className="text-gray-600 text-sm mb-2">SKU: {product.sku}</p>
                
                {/* Rating with breakdown */}
                <div className="flex items-center gap-4">
                  <div className="flex items-center gap-2">
                    <div className="flex gap-1">
                      {[1, 2, 3, 4, 5].map((i) => (
                        <Star key={i} className="h-4 w-4 text-yellow-400 fill-yellow-400" />
                      ))}
                    </div>
                    <span className="font-semibold text-gray-900">{avgRating}</span>
                  </div>
                  <span className="text-sm text-gray-600">({reviews.length} reviews)</span>
                </div>
              </div>

              {/* Price */}
              <div className="border-b border-t border-gray-200 py-6">
                <div className="text-4xl font-bold text-gray-900 mb-2">
                  ৳{Number(product.base_price).toFixed(2)}
                </div>
                <p className="text-gray-600">Free shipping on orders over ৳5000</p>
              </div>

              {/* Feature 3: Product Variants */}
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900">Select Variant</h3>
                <div className="flex gap-2 flex-wrap">
                  {["Red", "Blue", "Green", "Black"].map((color) => (
                    <button
                      key={color}
                      onClick={() => setSelectedVariant({ id: color.toLowerCase(), name: "Color", value: color, stock: 10 })}
                      className={`px-4 py-2 rounded-lg border-2 font-semibold transition ${
                        selectedVariant?.value === color
                          ? "border-blue-600 bg-blue-50 text-blue-600"
                          : "border-gray-300 text-gray-700 hover:border-blue-600"
                      }`}
                    >
                      {color}
                    </button>
                  ))}
                </div>
              </div>

              {/* Category & Brand */}
              <div className="grid grid-cols-2 gap-4 p-4 bg-white rounded-lg border border-gray-200">
                <div>
                  <p className="text-sm text-gray-600 mb-1">Category</p>
                  <p className="font-semibold text-gray-900">{product.category?.name || "N/A"}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600 mb-1">Brand</p>
                  <p className="font-semibold text-gray-900">{product.brand?.name || "N/A"}</p>
                </div>
              </div>

              {/* Feature 10: Product Certifications */}
              <div className="flex gap-3 flex-wrap">
                <div className="flex items-center gap-2 bg-green-50 px-3 py-2 rounded-lg border border-green-200">
                  <Leaf className="h-5 w-5 text-green-600" />
                  <span className="text-sm font-semibold text-green-700">Eco Friendly</span>
                </div>
                <div className="flex items-center gap-2 bg-blue-50 px-3 py-2 rounded-lg border border-blue-200">
                  <Award className="h-5 w-5 text-blue-600" />
                  <span className="text-sm font-semibold text-blue-700">Certified</span>
                </div>
                <div className="flex items-center gap-2 bg-purple-50 px-3 py-2 rounded-lg border border-purple-200">
                  <Lock className="h-5 w-5 text-purple-600" />
                  <span className="text-sm font-semibold text-purple-700">Authentic</span>
                </div>
              </div>

              {/* Quantity & Actions */}
              <div className="space-y-4">
                <div className="flex items-center gap-4">
                  <div className="flex items-center border border-gray-300 rounded-lg">
                    <button
                      onClick={() => setQuantity(Math.max(1, quantity - 1))}
                      className="px-4 py-2 text-gray-600 hover:bg-gray-100"
                      disabled={quantity === 1}
                    >
                      -
                    </button>
                    <input
                      type="number"
                      value={quantity}
                      onChange={(e) => setQuantity(Math.max(1, parseInt(e.target.value) || 1))}
                      className="w-16 text-center border-l border-r border-gray-300 py-2 focus:outline-none"
                      min="1"
                      max={product.stock_quantity}
                    />
                    <button
                      onClick={() => setQuantity(Math.min(product.stock_quantity, quantity + 1))}
                      className="px-4 py-2 text-gray-600 hover:bg-gray-100"
                      disabled={quantity >= product.stock_quantity}
                    >
                      +
                    </button>
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <button
                    onClick={handleAddToCart}
                    disabled={product.stock_quantity === 0}
                    className="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed flex items-center justify-center gap-2 transition"
                  >
                    <ShoppingCart className="h-5 w-5" />
                    Add to Cart
                  </button>
                  <div className="relative">
                    <button
                      onClick={() => setShowShareMenu(!showShareMenu)}
                      className="w-full border-2 border-gray-300 text-gray-700 py-3 rounded-lg font-semibold hover:border-blue-600 flex items-center justify-center gap-2 transition"
                    >
                      <Share2 className="h-5 w-5" />
                      Share
                    </button>
                    {showShareMenu && (
                      <div className="absolute bottom-full left-0 mb-2 bg-white border border-gray-200 rounded-lg shadow-lg p-2 z-10 w-40">
                        {["facebook", "twitter", "whatsapp", "email"].map((platform) => (
                          <button
                            key={platform}
                            onClick={() => {
                              handleShare(platform);
                              setShowShareMenu(false);
                            }}
                            className="block w-full text-left px-4 py-2 hover:bg-gray-100 rounded text-sm text-gray-700 capitalize"
                          >
                            {platform}
                          </button>
                        ))}
                      </div>
                    )}
                  </div>
                </div>

                {/* Feature 6: Notify When Back in Stock */}
                {product.stock_quantity === 0 && (
                  <button
                    onClick={() => setNotifyMe(!notifyMe)}
                    className={`w-full py-2 rounded-lg font-semibold flex items-center justify-center gap-2 transition ${
                      notifyMe
                        ? "bg-green-100 text-green-700 border border-green-300"
                        : "bg-gray-100 text-gray-700 border border-gray-300 hover:bg-gray-200"
                    }`}
                  >
                    <AlertCircle className="h-5 w-5" />
                    {notifyMe ? "✓ Notification Set" : "Notify Me When Back in Stock"}
                  </button>
                )}
              </div>

              {/* Trust Badges */}
              <div className="grid grid-cols-3 gap-4 pt-6 border-t border-gray-200">
                <div className="text-center">
                  <Truck className="h-6 w-6 text-blue-600 mx-auto mb-2" />
                  <p className="text-sm font-semibold text-gray-900">Free Shipping</p>
                  <p className="text-xs text-gray-600">Over ৳5000</p>
                </div>
                <div className="text-center">
                  <Shield className="h-6 w-6 text-blue-600 mx-auto mb-2" />
                  <p className="text-sm font-semibold text-gray-900">Secure Payment</p>
                  <p className="text-xs text-gray-600">100% Safe</p>
                </div>
                <div className="text-center">
                  <RefreshCw className="h-6 w-6 text-blue-600 mx-auto mb-2" />
                  <p className="text-sm font-semibold text-gray-900">Easy Returns</p>
                  <p className="text-xs text-gray-600">30 Days</p>
                </div>
              </div>
            </div>
          </div>

          {/* Feature 4: Delivery & Returns Information */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16 bg-white p-6 rounded-lg border border-gray-200">
            <div>
              <h3 className="font-semibold text-gray-900 mb-4 flex items-center gap-2">
                <Clock className="h-5 w-5 text-blue-600" />
                Delivery Information
              </h3>
              <ul className="space-y-2 text-sm text-gray-600">
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  Standard Delivery: 5-7 business days
                </li>
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  Express Delivery: 2-3 business days (+৳999)
                </li>
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  Free shipping on orders over ৳5000
                </li>
                <li className="flex items-center gap-2">
                  <MapPin className="h-4 w-4 text-blue-600" />
                  Available for delivery in 50+ countries
                </li>
              </ul>
            </div>

            <div>
              <h3 className="font-semibold text-gray-900 mb-4 flex items-center gap-2">
                <RefreshCw className="h-5 w-5 text-blue-600" />
                Returns & Warranty
              </h3>
              <ul className="space-y-2 text-sm text-gray-600">
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  30-day return policy
                </li>
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  12-month warranty included
                </li>
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  Free returns for defective items
                </li>
                <li className="flex items-center gap-2">
                  <Check className="h-4 w-4 text-green-600" />
                  Full refund or replacement
                </li>
              </ul>
            </div>
          </div>

          {/* Feature 11: Expandable Sections (Specs, FAQ, Care) */}
          <div className="space-y-4 mb-16">
            {/* Specifications */}
            <div className="bg-white rounded-lg border border-gray-200">
              <button
                onClick={() => setExpandedSection(expandedSection === "specs" ? "" : "specs")}
                className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition font-semibold text-gray-900"
              >
                <span className="flex items-center gap-2">
                  <Zap className="h-5 w-5 text-blue-600" />
                  Product Specifications
                </span>
                {expandedSection === "specs" ? <ChevronUp /> : <ChevronDown />}
              </button>
              {expandedSection === "specs" && (
                <div className="px-6 py-4 border-t border-gray-200 space-y-3">
                  <div className="grid grid-cols-2 gap-4 text-sm">
                    <div><p className="text-gray-600">Weight</p><p className="font-semibold text-gray-900">250g</p></div>
                    <div><p className="text-gray-600">Dimensions</p><p className="font-semibold text-gray-900">10 x 15 x 5 cm</p></div>
                    <div><p className="text-gray-600">Material</p><p className="font-semibold text-gray-900">Premium Stainless Steel</p></div>
                    <div><p className="text-gray-600">Color Options</p><p className="font-semibold text-gray-900">5 Colors</p></div>
                    <div><p className="text-gray-600">Warranty</p><p className="font-semibold text-gray-900">12 Months</p></div>
                    <div><p className="text-gray-600">Model</p><p className="font-semibold text-gray-900">{product.sku}</p></div>
                  </div>
                </div>
              )}
            </div>

            {/* FAQ */}
            <div className="bg-white rounded-lg border border-gray-200">
              <button
                onClick={() => setExpandedSection(expandedSection === "faq" ? "" : "faq")}
                className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition font-semibold text-gray-900"
              >
                <span className="flex items-center gap-2">
                  <MessageCircle className="h-5 w-5 text-blue-600" />
                  Frequently Asked Questions
                </span>
                {expandedSection === "faq" ? <ChevronUp /> : <ChevronDown />}
              </button>
              {expandedSection === "faq" && (
                <div className="px-6 py-4 border-t border-gray-200 space-y-4">
                  <div>
                    <p className="font-semibold text-gray-900 mb-1">How long does shipping take?</p>
                    <p className="text-sm text-gray-600">Standard shipping takes 5-7 business days. Express shipping is available for 2-3 business days.</p>
                  </div>
                  <div>
                    <p className="font-semibold text-gray-900 mb-1">Is this product compatible with...?</p>
                    <p className="text-sm text-gray-600">Yes, this product is compatible with most standard models. Check specifications for details.</p>
                  </div>
                  <div>
                    <p className="font-semibold text-gray-900 mb-1">What is included in the box?</p>
                    <p className="text-sm text-gray-600">The package includes the main product, user manual, and warranty card.</p>
                  </div>
                </div>
              )}
            </div>

            {/* Care Instructions */}
            <div className="bg-white rounded-lg border border-gray-200">
              <button
                onClick={() => setExpandedSection(expandedSection === "care" ? "" : "care")}
                className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition font-semibold text-gray-900"
              >
                <span className="flex items-center gap-2">
                  <Shield className="h-5 w-5 text-blue-600" />
                  Care & Maintenance
                </span>
                {expandedSection === "care" ? <ChevronUp /> : <ChevronDown />}
              </button>
              {expandedSection === "care" && (
                <div className="px-6 py-4 border-t border-gray-200 space-y-3 text-sm text-gray-600">
                  <ul className="space-y-2">
                    <li>• Clean with soft cloth and mild soap</li>
                    <li>• Avoid abrasive cleaners and solvents</li>
                    <li>• Store in cool, dry place</li>
                    <li>• Do not expose to extreme temperatures</li>
                    <li>• Handle with care to avoid damage</li>
                  </ul>
                </div>
              )}
            </div>
          </div>

          {/* Feature 1: Customer Reviews */}
          <div className="mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-8">Customer Reviews</h2>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
              {/* Rating Summary */}
              <div className="bg-white p-6 rounded-lg border border-gray-200">
                <div className="mb-4">
                  <div className="text-4xl font-bold text-gray-900 mb-2">{avgRating}</div>
                  <div className="flex gap-1 mb-2">
                    {[1, 2, 3, 4, 5].map((i) => (
                      <Star key={i} className="h-5 w-5 text-yellow-400 fill-yellow-400" />
                    ))}
                  </div>
                  <p className="text-sm text-gray-600">Based on {reviews.length} reviews</p>
                </div>

                {ratingBreakdown.map((item) => (
                  <div key={item.rating} className="flex items-center gap-2 mb-2">
                    <span className="text-sm text-gray-600 w-12">{item.rating} ★</span>
                    <div className="flex-1 bg-gray-200 rounded-full h-2">
                      <div className="bg-yellow-400 h-full rounded-full" style={{ width: `${item.percentage}%` }}></div>
                    </div>
                    <span className="text-sm text-gray-600 w-8 text-right">{item.count}</span>
                  </div>
                ))}

                <button
                  onClick={() => setShowReviewForm(!showReviewForm)}
                  className="w-full mt-4 bg-blue-600 text-white py-2 rounded-lg font-semibold hover:bg-blue-700 transition"
                >
                  Write a Review
                </button>
              </div>

              {/* Review Filters */}
              <div className="col-span-2">
                <div className="flex items-center gap-4 mb-6">
                  <div>
                    <label className="text-sm font-semibold text-gray-900 block mb-2">Sort by:</label>
                    <select
                      value={sortReviewsBy}
                      onChange={(e) => setSortReviewsBy(e.target.value)}
                      className="px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value="helpful">Most Helpful</option>
                      <option value="newest">Newest First</option>
                      <option value="highest">Highest Rated</option>
                      <option value="lowest">Lowest Rated</option>
                    </select>
                  </div>

                  <div>
                    <label className="text-sm font-semibold text-gray-900 block mb-2">Filter:</label>
                    <select
                      value={filterRating || ""}
                      onChange={(e) => setFilterRating(e.target.value ? parseInt(e.target.value) : null)}
                      className="px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value="">All Ratings</option>
                      {[5, 4, 3, 2, 1].map((rating) => (
                        <option key={rating} value={rating}>{rating} Stars</option>
                      ))}
                    </select>
                  </div>
                </div>

                {/* Review Form */}
                {showReviewForm && (
                  <div className="bg-blue-50 p-6 rounded-lg border border-blue-200 mb-6">
                    <h3 className="font-semibold text-gray-900 mb-4">Share Your Review</h3>
                    <div className="space-y-4">
                      <div>
                        <label className="text-sm font-semibold text-gray-900 block mb-2">Rating</label>
                        <div className="flex gap-2">
                          {[1, 2, 3, 4, 5].map((i) => (
                            <button
                              key={i}
                              onClick={() => setNewReview({ ...newReview, rating: i })}
                              className="transition"
                            >
                              <Star
                                className={`h-6 w-6 ${
                                  i <= newReview.rating
                                    ? "text-yellow-400 fill-yellow-400"
                                    : "text-gray-300"
                                }`}
                              />
                            </button>
                          ))}
                        </div>
                      </div>
                      <input
                        type="text"
                        placeholder="Review Title"
                        value={newReview.title}
                        onChange={(e) => setNewReview({ ...newReview, title: e.target.value })}
                        className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <textarea
                        placeholder="Your Review"
                        value={newReview.comment}
                        onChange={(e) => setNewReview({ ...newReview, comment: e.target.value })}
                        className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 h-24"
                      />
                      <input
                        type="text"
                        placeholder="Your Name"
                        value={newReview.name}
                        onChange={(e) => setNewReview({ ...newReview, name: e.target.value })}
                        className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <button className="w-full bg-blue-600 text-white py-2 rounded-lg font-semibold hover:bg-blue-700 transition">
                        Submit Review
                      </button>
                    </div>
                  </div>
                )}

                {/* Reviews List */}
                <div className="space-y-4">
                  {sortedReviews.length === 0 ? (
                    <p className="text-center text-gray-500 py-8">No reviews yet</p>
                  ) : (
                    sortedReviews.map((review) => (
                      <div key={review.id} className="bg-white p-4 rounded-lg border border-gray-200">
                        <div className="flex items-start justify-between mb-2">
                          <div>
                            <div className="flex gap-1 mb-1">
                              {[1, 2, 3, 4, 5].map((i) => (
                                <Star key={i} className={`h-4 w-4 ${i <= review.rating ? "text-yellow-400 fill-yellow-400" : "text-gray-300"}`} />
                              ))}
                            </div>
                            <h4 className="font-semibold text-gray-900">{review.title}</h4>
                          </div>
                          {review.verified && (
                            <div className="flex items-center gap-1 bg-green-100 text-green-700 px-2 py-1 rounded text-xs font-semibold">
                              <Check className="h-3 w-3" />
                              Verified
                            </div>
                          )}
                        </div>
                        <p className="text-sm text-gray-600 mb-3">{review.comment}</p>
                        <div className="flex items-center justify-between text-xs text-gray-500">
                          <span>by {review.author} • {review.date}</span>
                          <button className="text-blue-600 hover:text-blue-700 font-semibold">
                            Helpful ({review.helpful})
                          </button>
                        </div>
                      </div>
                    ))
                  )}
                </div>
              </div>
            </div>
          </div>

          {/* Feature 5: Customer Q&A */}
          <div className="mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-8">Customer Questions</h2>

            {showQAForm && (
              <div className="bg-blue-50 p-6 rounded-lg border border-blue-200 mb-6">
                <h3 className="font-semibold text-gray-900 mb-4">Ask a Question</h3>
                <textarea
                  placeholder="Your Question"
                  value={newQuestion}
                  onChange={(e) => setNewQuestion(e.target.value)}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4 h-24"
                />
                <button className="bg-blue-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-blue-700 transition">
                  Submit Question
                </button>
              </div>
            )}

            <button
              onClick={() => setShowQAForm(!showQAForm)}
              className="mb-6 bg-blue-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-blue-700 transition"
            >
              {showQAForm ? "Cancel" : "Ask a Question"}
            </button>

            <div className="space-y-4">
              {qa.map((item) => (
                <div key={item.id} className="bg-white p-4 rounded-lg border border-gray-200">
                  <p className="font-semibold text-gray-900 mb-2">{item.question}</p>
                  {item.answer && (
                    <div className="bg-gray-50 p-3 rounded-lg border-l-4 border-blue-600 mb-2">
                      <p className="text-sm text-gray-600 mb-1 font-semibold">{item.author}</p>
                      <p className="text-sm text-gray-600">{item.answer}</p>
                    </div>
                  )}
                  <p className="text-xs text-gray-500">{item.date}</p>
                </div>
              ))}
            </div>
          </div>

          {/* Feature 8: Product Comparison */}
          <div className="mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-8">Compare Products</h2>
            <button className="bg-blue-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-blue-700 transition mb-6">
              Add to Comparison
            </button>
            <p className="text-gray-600">You can compare this product with similar items to make the best choice.</p>
          </div>

          {/* Feature 7: Recently Viewed Products */}
          <div className="mb-16">
            <h2 className="text-3xl font-bold text-gray-900 mb-8 flex items-center gap-2">
              <Eye className="h-8 w-8 text-blue-600" />
              Recently Viewed
            </h2>
            <p className="text-gray-600 mb-6">Your browsing history on this session (stored locally)</p>
          </div>

          {/* Related & Similar Products */}
          <div>
            <h2 className="text-3xl font-bold text-gray-900 mb-8">Related Products</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {relatedProducts.map((relatedProduct) => {
                const relatedImage = relatedProduct.images?.find(img => img.is_primary) || relatedProduct.images?.[0];
                return (
                  <Link key={relatedProduct.id} href={`/shop/${relatedProduct.id}`}>
                    <div className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden group border border-gray-100 cursor-pointer h-full">
                      <div className="relative aspect-square bg-gray-100 overflow-hidden">
                        <img
                          src={relatedImage ? getImageUrl(relatedImage.image_url) : '/placeholder.jpg'}
                          alt={relatedProduct.name}
                          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                          onError={(e) => {
                            e.currentTarget.src = '/placeholder.jpg';
                          }}
                        />
                        {relatedProduct.stock_quantity > 0 && (
                          <div className="absolute top-2 left-2 bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">
                            In Stock
                          </div>
                        )}
                      </div>
                      <div className="p-4">
                        <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 text-sm">{relatedProduct.name}</h3>
                        <p className="text-gray-600 text-xs mb-3 line-clamp-1">{relatedProduct.sku}</p>
                        <div className="flex items-center justify-between">
                          <span className="text-lg font-bold text-gray-900">৳{Number(relatedProduct.base_price).toFixed(2)}</span>
                          <button className="bg-blue-600 text-white p-2 rounded-lg hover:bg-blue-700 transition-colors">
                            <ShoppingCart className="h-4 w-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  </Link>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}
