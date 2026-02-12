"use client";
import React, { useState, useMemo, useEffect } from 'react';
import Layout from '../components/Layouts';
import SimpleProductCard from '../components/SimpleProductCard';
import { Search, Filter, Flame, Tag, Clock, TrendingDown } from 'lucide-react';
import { apiUrl, getImageUrl } from '../common/http';

interface SaleProduct {
  id: number;
  name: string;
  sku: string;
  description: string;
  category: {
    id: number;
    name: string;
  };
  brand: {
    id: number;
    name: string;
  };
  original_price: number;
  discounted_price: number;
  discount_percentage: number;
  discount_amount: number;
  discount_type: string;
  stock_quantity: number;
  images: Array<{
    id: number;
    image_url: string;
    is_primary: boolean;
  }>;
  sale_end_date: string;
  status: string;
  created_at: string;
}

interface CountdownTimer {
  days: number;
  hours: number;
  minutes: number;
  seconds: number;
}

const SalePage = () => {
  const [products, setProducts] = useState<SaleProduct[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [sortBy, setSortBy] = useState<string>('discount-high');
  const [categoryFilter, setCategoryFilter] = useState<string>('all');
  const [currentTime, setCurrentTime] = useState(new Date());

  // Update current time every second for countdown timers
  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentTime(new Date());
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  // Fetch sale products
  useEffect(() => {
    const fetchSaleProducts = async () => {
      try {
        setLoading(true);
        setError(null);
        
        const response = await fetch(`${apiUrl}/sale-products`);
        if (!response.ok) {
          throw new Error(`Failed to fetch sale products: ${response.status}`);
        }
        
        const data = await response.json();
        setProducts(data.data || []);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load sale products');
        console.error('Error fetching sale products:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchSaleProducts();
  }, []);

  // Calculate countdown timer for a product
  const getCountdownTimer = (endDate: string): CountdownTimer => {
    const end = new Date(endDate).getTime();
    const now = currentTime.getTime();
    const difference = end - now;

    if (difference <= 0) {
      return { days: 0, hours: 0, minutes: 0, seconds: 0 };
    }

    const days = Math.floor(difference / (1000 * 60 * 60 * 24));
    const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((difference % (1000 * 60)) / 1000);

    return { days, hours, minutes, seconds };
  };

  // Get unique categories
  const categories = useMemo(() => {
    const uniqueCategories = new Set(products.map(p => p.category.name));
    return Array.from(uniqueCategories);
  }, [products]);

  // Filter and sort products
  const filteredAndSortedProducts = useMemo(() => {
    let filtered = products.filter(product => {
      // Search filter
      if (searchQuery && 
          !product.name.toLowerCase().includes(searchQuery.toLowerCase()) &&
          !product.brand.name.toLowerCase().includes(searchQuery.toLowerCase()) &&
          !product.description.toLowerCase().includes(searchQuery.toLowerCase())) {
        return false;
      }

      // Category filter
      if (categoryFilter !== 'all' && product.category.name !== categoryFilter) {
        return false;
      }

      return true;
    });

    // Sort products
    switch (sortBy) {
      case 'discount-high':
        filtered.sort((a, b) => Number(b.discount_percentage) - Number(a.discount_percentage));
        break;
      case 'discount-low':
        filtered.sort((a, b) => Number(a.discount_percentage) - Number(b.discount_percentage));
        break;
      case 'price-low':
        filtered.sort((a, b) => Number(a.discounted_price) - Number(b.discounted_price));
        break;
      case 'price-high':
        filtered.sort((a, b) => Number(b.discounted_price) - Number(a.discounted_price));
        break;
      case 'ending-soon':
        filtered.sort((a, b) => 
          new Date(a.sale_end_date).getTime() - new Date(b.sale_end_date).getTime()
        );
        break;
      default:
        break;
    }

    return filtered;
  }, [products, searchQuery, categoryFilter, sortBy]);

  // Calculate sale statistics
  const saleStats = useMemo(() => {
    if (products.length === 0) return null;
    
    const totalProducts = products.length;
    const averageDiscount = (products.reduce((sum, p) => sum + Number(p.discount_percentage), 0) / totalProducts).toFixed(1);
    const maxDiscount = Math.max(...products.map(p => Number(p.discount_percentage)));
    const totalSavings = products.reduce((sum, p) => sum + Number(p.discount_amount), 0);

    return {
      totalProducts,
      averageDiscount,
      maxDiscount: maxDiscount.toFixed(0),
      totalSavings: totalSavings.toFixed(0)
    };
  }, [products]);

  return (
    <Layout>
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-red-600 to-orange-600 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <div className="flex items-center justify-center gap-3 mb-4">
              <Flame className="w-12 h-12 animate-pulse" />
              <h1 className="text-4xl md:text-5xl font-bold">Hot Deals & Sales</h1>
              <Flame className="w-12 h-12 animate-pulse" />
            </div>
            <p className="text-xl md:text-2xl text-red-100 mb-6">
              Save big on your favorite products!
            </p>
            {saleStats && (
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4 max-w-4xl mx-auto mt-8">
                <div className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4">
                  <div className="text-3xl font-bold">{saleStats.totalProducts}</div>
                  <div className="text-sm text-red-100">Products on Sale</div>
                </div>
                <div className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4">
                  <div className="text-3xl font-bold">{saleStats.maxDiscount}%</div>
                  <div className="text-sm text-red-100">Max Discount</div>
                </div>
                <div className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4">
                  <div className="text-3xl font-bold">{saleStats.averageDiscount}%</div>
                  <div className="text-sm text-red-100">Avg. Discount</div>
                </div>
                <div className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4">
                  <div className="text-3xl font-bold">৳{saleStats.totalSavings}</div>
                  <div className="text-sm text-red-100">Total Savings</div>
                </div>
              </div>
            )}
          </div>
        </div>
      </section>

      {/* Filters and Search */}
      <section className="bg-white border-b py-6">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row gap-4 items-center justify-between">
            {/* Search */}
            <div className="relative flex-1 max-w-md w-full">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
              <input
                type="text"
                placeholder="Search sale items..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
              />
            </div>

            {/* Category Filter */}
            <div className="flex items-center gap-2">
              <Filter className="w-5 h-5 text-gray-600" />
              <select
                value={categoryFilter}
                onChange={(e) => setCategoryFilter(e.target.value)}
                className="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-red-500"
              >
                <option value="all">All Categories</option>
                {categories.map(category => (
                  <option key={category} value={category}>{category}</option>
                ))}
              </select>
            </div>

            {/* Sort */}
            <div className="flex items-center gap-2">
              <TrendingDown className="w-5 h-5 text-gray-600" />
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-red-500"
              >
                <option value="discount-high">Highest Discount</option>
                <option value="discount-low">Lowest Discount</option>
                <option value="price-low">Price: Low to High</option>
                <option value="price-high">Price: High to Low</option>
                <option value="ending-soon">Ending Soon</option>
              </select>
            </div>
          </div>

          <div className="mt-4 flex items-center gap-2 text-sm text-gray-600">
            <span className="font-semibold">{filteredAndSortedProducts.length}</span>
            <span>products found</span>
          </div>
        </div>
      </section>

      {/* Products Grid */}
      <section className="py-12 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          {loading ? (
            <div className="text-center py-20">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-red-600"></div>
              <p className="text-gray-600 mt-4">Loading sale products...</p>
            </div>
          ) : error ? (
            <div className="bg-red-50 border border-red-200 text-red-800 px-6 py-4 rounded-lg text-center">
              <p className="font-semibold">Error loading sale products</p>
              <p className="text-sm mt-1">{error}</p>
              <p className="text-sm mt-2">Make sure your Laravel API is running at {apiUrl}</p>
            </div>
          ) : filteredAndSortedProducts.length === 0 ? (
            <div className="text-center py-20">
              <Tag className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-2xl font-bold text-gray-900 mb-2">No Sale Products Found</h3>
              <p className="text-gray-600">
                {searchQuery || categoryFilter !== 'all' 
                  ? 'Try adjusting your filters or search terms'
                  : 'There are currently no products on sale'}
              </p>
            </div>
          ) : (
            <>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                {filteredAndSortedProducts.map(product => {
                  const timer = getCountdownTimer(product.sale_end_date);
                  const isEndingSoon = timer.days === 0 && timer.hours < 24;

                  return (
                    <div key={product.id} className="relative">
                      {/* Discount Badge */}
                      <div className="absolute top-2 left-2 z-10 bg-red-600 text-white px-3 py-1 rounded-full text-sm font-bold shadow-lg">
                        {Number(product.discount_percentage).toFixed(0)}% OFF
                      </div>

                      {/* Ending Soon Badge */}
                      {isEndingSoon && (
                        <div className="absolute top-2 right-2 z-10 bg-orange-600 text-white px-3 py-1 rounded-full text-xs font-bold shadow-lg flex items-center gap-1">
                          <Clock className="w-3 h-3" />
                          Ending Soon
                        </div>
                      )}

                      {/* Product Card */}
                      <div className="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition">
                        <a href={`/shop/${product.id}`} className="block">
                          <div className="aspect-square bg-gray-100 overflow-hidden">
                            <img
                              src={getImageUrl(product.images.find(img => img.is_primary)?.image_url || product.images[0]?.image_url || '/placeholder.jpg')}
                              alt={product.name}
                              className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                              onError={(e) => {
                                e.currentTarget.src = '/placeholder.jpg';
                              }}
                            />
                          </div>
                          <div className="p-4">
                            <h3 className="font-semibold text-gray-900 mb-1 line-clamp-2">{product.name}</h3>
                            <p className="text-sm text-gray-600 mb-2">{product.brand.name}</p>
                            
                            <div className="flex items-baseline gap-2 mb-2">
                              <span className="text-2xl font-bold text-red-600">
                                ৳{Number(product.discounted_price).toFixed(2)}
                              </span>
                              <span className="text-sm text-gray-500 line-through">
                                ৳{Number(product.original_price).toFixed(2)}
                              </span>
                            </div>

                            <div className="text-sm text-green-600 font-semibold mb-3">
                              Save ৳{Number(product.discount_amount).toFixed(2)}
                            </div>

                            {/* Countdown Timer */}
                            <div className="bg-gray-50 rounded-lg p-2 text-center">
                              <div className="text-xs text-gray-600 mb-1">Sale ends in:</div>
                              <div className="flex items-center justify-center gap-2 text-sm font-bold">
                                <span className="bg-red-100 text-red-700 px-2 py-1 rounded">
                                  {timer.days}d
                                </span>
                                <span className="bg-red-100 text-red-700 px-2 py-1 rounded">
                                  {timer.hours}h
                                </span>
                                <span className="bg-red-100 text-red-700 px-2 py-1 rounded">
                                  {timer.minutes}m
                                </span>
                                <span className="bg-red-100 text-red-700 px-2 py-1 rounded">
                                  {timer.seconds}s
                                </span>
                              </div>
                            </div>

                            {product.stock_quantity > 0 ? (
                              <div className="mt-3 text-sm text-green-600">
                                {product.stock_quantity <= 10 && (
                                  <span className="font-semibold">Only {product.stock_quantity} left!</span>
                                )}
                                {product.stock_quantity > 10 && <span>In Stock</span>}
                              </div>
                            ) : (
                              <div className="mt-3 text-sm text-red-600 font-semibold">Out of Stock</div>
                            )}
                          </div>
                        </a>
                      </div>
                    </div>
                  );
                })}
              </div>
            </>
          )}
        </div>
      </section>
    </Layout>
  );
};

export default SalePage;
