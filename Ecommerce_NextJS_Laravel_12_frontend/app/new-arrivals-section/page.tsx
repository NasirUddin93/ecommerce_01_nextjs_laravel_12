"use client"
import { Clock, TrendingUp, Star } from "lucide-react";
import Link from "next/link";
import { getImageUrl } from "../common/http";
import { useCart } from "../contexts/CartContext";
import { useEffect, useState } from "react";

interface Product {
  id: number;
  category_id: number;
  brand_id: number;
  name: string;
  sku: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  weight: number;
  is_seasonal: boolean;
  seasonal_start_date: Date | string | null;
  seasonal_end_date: Date | string | null;
  images?: { image_url: string }[];
  status?: string;
}

interface NewArrivalsProps {
  products?: Product[];
}

export default function NewArrivals({ products: initialProducts = [] }: NewArrivalsProps) {
  const { addToCart } = useCart();
  const [products, setProducts] = useState<Product[]>(initialProducts);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Fetch new arrivals products
    const fetchNewArrivals = async () => {
      try {
        setLoading(true);
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/products?new_arrivals=true`, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (response.ok) {
          const data = await response.json();
          setProducts(data.data || data);
        } else {
          setProducts(initialProducts);
        }
      } catch (error) {
        console.error('Failed to fetch new arrivals:', error);
        setProducts(initialProducts);
      } finally {
        setLoading(false);
      }
    };

    if (initialProducts.length === 0) {
      fetchNewArrivals();
    } else {
      setLoading(false);
    }
  }, [initialProducts]);

  useEffect(() => {
    if (products && products.length > 0) {
      console.log('NewArrivals component - Products data:', products);
      products.forEach(p => {
        console.log(`Product: ${p.name}, Images:`, p.images);
        if (p.images && p.images.length > 0) {
          const imageUrl = p.images[0].image_url;
          const resolvedUrl = getImageUrl(imageUrl);
          console.log(`  Original: ${imageUrl} -> Resolved: ${resolvedUrl}`);
        }
      });
    }
  }, [products]);

  const handleAddToCart = (product: Product) => {
    const productWithNumberPrice = {
      ...product,
      base_price: Number(product.base_price),
      seasonal_start_date: product.seasonal_start_date ? new Date(product.seasonal_start_date) : new Date(),
      seasonal_end_date: product.seasonal_end_date ? new Date(product.seasonal_end_date) : new Date(),
    };
    addToCart(productWithNumberPrice);
  };

  const handleImageError = (e: React.SyntheticEvent<HTMLImageElement>) => {
    console.error('Image failed to load:', e.currentTarget.src);
    e.currentTarget.style.display = 'none';
    if (e.currentTarget.parentElement) {
      const placeholder = document.createElement('div');
      placeholder.className = 'flex items-center justify-center w-full h-full bg-gray-200 text-gray-400';
      placeholder.textContent = 'Image not found';
      e.currentTarget.parentElement.appendChild(placeholder);
    }
  };

  const renderStars = (rating: number) => {
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
    <section className="bg-gray-50 py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between mb-12">
          <div>
            <div className="flex items-center gap-2 mb-2">
              <Clock className="h-6 w-6 text-blue-600" />
              <h2 className="text-3xl font-bold text-gray-900">New Arrivals</h2>
            </div>
            <p className="text-lg text-gray-600">Check out our latest products</p>
          </div>
          <Link
            href="/new-arrivals"
            className="text-blue-600 hover:text-blue-700 font-semibold flex items-center gap-2"
          >
            View All
            <TrendingUp className="h-5 w-5" />
          </Link>
        </div>

        {loading ? (
          <div className="flex items-center justify-center py-12">
            <div className="text-center">
              <div className="animate-spin rounded-full h-12 w-12 border-b-4 border-blue-600 mx-auto mb-4"></div>
              <p className="text-gray-600">Loading new arrivals...</p>
            </div>
          </div>
        ) : products && products.length > 0 ? (
          <>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {products.map((product) => (
            <div
              key={product.id}
              className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden group border border-gray-100"
            >
              <div className="relative aspect-square bg-gray-100">
                {product.images && product.images.length > 0 && product.images[0].image_url ? (
                  <img
                    src={getImageUrl(product.images[0].image_url)}
                    alt={product.name}
                    onError={handleImageError}
                    className="object-cover w-full h-full group-hover:scale-105 transition-transform"
                  />
                ) : (
                  <div className="flex items-center justify-center w-full h-full bg-gray-200 text-gray-400">
                    No Image
                  </div>
                )}
                <div className="absolute top-3 left-3 flex gap-2">
                  {product.stock_quantity > 0 && (
                    <span className="bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">
                      NEW
                    </span>
                  )}
                  {product.is_seasonal && (
                    <span className="bg-red-500 text-white px-2 py-1 rounded text-xs font-semibold">
                      SALE
                    </span>
                  )}
                </div>
              </div>

              <div className="p-4">
                <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2">
                  {product.name}
                </h3>

                <div className="flex items-center mb-2">
                  <div className="flex items-center">
                    {renderStars(4)}
                  </div>
                  <span className="text-sm text-gray-600 ml-2">
                    (0 reviews)
                  </span>
                </div>

                <div className="flex items-center justify-between">
                  <span className="text-xl font-bold text-gray-900">
                    ৳{product.base_price}
                  </span>
                  <button
                    onClick={() => handleAddToCart(product)}
                    className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm font-semibold transition-colors"
                  >
                    Add to Cart
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>

        <div className="text-center mt-12">
          <Link
            href="/new-arrivals"
            className="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 transition-colors"
          >
            View All New Arrivals
          </Link>
        </div>
            </>
        ) : (
          <div className="text-center py-12">
            <p className="text-gray-600">No new arrivals available at the moment.</p>
          </div>
        )}
      </div>
    </section>
  );
}
