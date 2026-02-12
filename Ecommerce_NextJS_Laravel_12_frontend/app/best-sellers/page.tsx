"use client";
import React, { useState, useMemo, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Layout from '../components/Layouts';
import { apiUrl, getImageUrl } from '../common/http';
import { Search, Filter, Grid, List, Award, TrendingUp, Zap, ShoppingCart } from 'lucide-react';

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

interface Category {
  id: number;
  name: string;
}

interface Brand {
  id: number;
  name: string;
}

interface FilterState {
  categories: number[];
  brands: number[];
  priceRange: [number, number];
}

interface ViewMode {
  type: 'ranked' | 'grid' | 'list';
  columns: number;
}

const BestSellersPage = () => {
  const router = useRouter();
  const [products, setProducts] = useState<Product[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [brands, setBrands] = useState<Brand[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filters, setFilters] = useState<FilterState>({
    categories: [],
    brands: [],
    priceRange: [0, 10000000],
  });
  const [sortBy, setSortBy] = useState<string>('newest');
  const [searchQuery, setSearchQuery] = useState('');
  const [viewMode, setViewMode] = useState<ViewMode>({ type: 'ranked', columns: 3 });
  const [isFilterOpen, setIsFilterOpen] = useState(false);

  // Fetch data on mount
  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        const [productsRes, categoriesRes, brandsRes] = await Promise.all([
          fetch(`${apiUrl}/products`, {
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
              Accept: 'application/json',
            },
          }),
          fetch(`${apiUrl}/categories`, {
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
              Accept: 'application/json',
            },
          }),
          fetch(`${apiUrl}/brands`, {
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
              Accept: 'application/json',
            },
          }),
        ]);

        if (!productsRes.ok || !categoriesRes.ok || !brandsRes.ok) {
          throw new Error('Failed to fetch data');
        }

        const productsData = await productsRes.json();
        const categoriesData = await categoriesRes.json();
        const brandsData = await brandsRes.json();

        const activeProducts = (productsData.data || productsData).filter(
          (p: Product) => p.status === 'active'
        );
        setProducts(activeProducts);
        setCategories(categoriesData.data || categoriesData);
        setBrands(brandsData.data || brandsData);
      } catch (err) {
        console.error('Error fetching data:', err);
        setError('Failed to load best sellers. Please try again later.');
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  // Filter and sort products
  const filteredAndSortedProducts = useMemo(() => {
    let filtered = products.filter(product => {
      // Search filter
      if (searchQuery && 
          !product.name.toLowerCase().includes(searchQuery.toLowerCase()) &&
          !product.sku.toLowerCase().includes(searchQuery.toLowerCase()) &&
          !product.description.toLowerCase().includes(searchQuery.toLowerCase())) {
        return false;
      }

      // Category filter
      if (filters.categories.length > 0 && !filters.categories.includes(product.category_id)) {
        return false;
      }

      // Brand filter
      if (filters.brands.length > 0 && !filters.brands.includes(product.brand_id)) {
        return false;
      }

      // Price range filter
      if (Number(product.base_price) < filters.priceRange[0] || Number(product.base_price) > filters.priceRange[1]) {
        return false;
      }

      // Stock filter
      if (product.stock_quantity === 0) {
        return false;
      }

      return true;
    });

    // Sort products
    switch (sortBy) {
      case 'price-low':
        filtered.sort((a, b) => Number(a.base_price) - Number(b.base_price));
        break;
      case 'price-high':
        filtered.sort((a, b) => Number(b.base_price) - Number(a.base_price));
        break;
      case 'newest':
        filtered.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
        break;
      default:
        filtered.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
    }

    return filtered;
  }, [filters, sortBy, searchQuery, products]);

  // Calculate average price
  const averagePrice = useMemo(() => {
    if (products.length === 0) return '0.00';
    const total = products.reduce((sum, product) => sum + Number(product.base_price), 0);
    return (total / products.length).toFixed(2);
  }, [products]);

  const handleClearFilters = () => {
    setFilters({
      categories: [],
      brands: [],
      priceRange: [0, 10000000],
    });
    setSearchQuery('');
  };

  const gridClasses = useMemo(() => {
    const baseClasses = 'grid gap-6';
    
    switch (viewMode.type) {
      case 'list':
        return `${baseClasses} grid-cols-1`;
      case 'ranked':
        return `${baseClasses} grid-cols-1`;
      default:
        return `${baseClasses} grid-cols-1 sm:grid-cols-2 lg:grid-cols-${viewMode.columns}`;
    }
  }, [viewMode]);

  const hasActiveFilters = useMemo(() => {
    return (
      filters.categories.length > 0 ||
      filters.brands.length > 0 ||
      filters.priceRange[0] > 0 ||
      filters.priceRange[1] < 10000000 ||
      searchQuery
    );
  }, [filters, searchQuery]);

  if (loading) {
    return (
      <Layout>
        <div className="min-h-screen flex items-center justify-center">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
            <p className="text-gray-600">Loading best sellers...</p>
          </div>
        </div>
      </Layout>
    );
  }

  if (error) {
    return (
      <Layout>
        <div className="min-h-screen flex items-center justify-center">
          <div className="text-center">
            <p className="text-red-600 mb-4">{error}</p>
            <button
              onClick={() => window.location.reload()}
              className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700"
            >
              Retry
            </button>
          </div>
        </div>
      </Layout>
    );
  }

  return (
    <Layout>
      <div className="bg-gray-50">
        {/* Header Section */}
        <div className="bg-white shadow-sm border-b">
          <div className="container mx-auto px-4 py-8">
            <div className="flex items-center justify-between mb-4">
              <div>
                <h1 className="text-3xl font-bold text-gray-900 flex items-center gap-2 mb-2">
                  <Zap className="h-8 w-8 text-yellow-500" />
                  Best Sellers
                </h1>
                <p className="text-gray-600">Discover our most popular products loved by customers</p>
              </div>
              <div className="flex items-center gap-4">
                <div className="text-right hidden sm:block">
                  <p className="text-3xl font-bold text-gray-900">{filteredAndSortedProducts.length}</p>
                  <p className="text-sm text-gray-600">Products</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="flex flex-col lg:flex-row gap-8">
          {/* Filters Sidebar */}
          <div className="lg:w-64 flex-shrink-0">
            <div className="bg-white p-6 rounded-lg shadow-sm border">
              <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
                <Filter className="h-5 w-5" />
                Filters
              </h3>
              
              {/* Price Range */}
              <div className="mb-6">
                <label className="text-sm font-medium text-gray-700 mb-3 block">Price Range</label>
                <div className="space-y-2">
                  <div className="flex gap-2">
                    <input
                      type="number"
                      placeholder="Min"
                      value={filters.priceRange[0]}
                      onChange={(e) => setFilters(prev => ({
                        ...prev,
                        priceRange: [Number(e.target.value), prev.priceRange[1]]
                      }))}
                      className="flex-1 px-3 py-2 border border-gray-300 rounded text-sm"
                    />
                    <input
                      type="number"
                      placeholder="Max"
                      value={filters.priceRange[1]}
                      onChange={(e) => setFilters(prev => ({
                        ...prev,
                        priceRange: [prev.priceRange[0], Number(e.target.value)]
                      }))}
                      className="flex-1 px-3 py-2 border border-gray-300 rounded text-sm"
                    />
                  </div>
                </div>
              </div>

              {/* Categories */}
              {categories.length > 0 && (
                <div className="mb-6">
                  <label className="text-sm font-medium text-gray-700 mb-3 block">Categories</label>
                  <div className="space-y-2">
                    {categories.slice(0, 5).map((cat) => (
                      <label key={cat.id} className="flex items-center gap-2 cursor-pointer">
                        <input
                          type="checkbox"
                          checked={filters.categories.includes(cat.id)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setFilters(prev => ({
                                ...prev,
                                categories: [...prev.categories, cat.id]
                              }));
                            } else {
                              setFilters(prev => ({
                                ...prev,
                                categories: prev.categories.filter(id => id !== cat.id)
                              }));
                            }
                          }}
                          className="rounded"
                        />
                        <span className="text-sm text-gray-700">{cat.name}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Brands */}
              {brands.length > 0 && (
                <div className="mb-6">
                  <label className="text-sm font-medium text-gray-700 mb-3 block">Brands</label>
                  <div className="space-y-2">
                    {brands.slice(0, 5).map((brand) => (
                      <label key={brand.id} className="flex items-center gap-2 cursor-pointer">
                        <input
                          type="checkbox"
                          checked={filters.brands.includes(brand.id)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setFilters(prev => ({
                                ...prev,
                                brands: [...prev.brands, brand.id]
                              }));
                            } else {
                              setFilters(prev => ({
                                ...prev,
                                brands: prev.brands.filter(id => id !== brand.id)
                              }));
                            }
                          }}
                          className="rounded"
                        />
                        <span className="text-sm text-gray-700">{brand.name}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Clear Filters */}
              {hasActiveFilters && (
                <button
                  onClick={handleClearFilters}
                  className="w-full px-4 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 text-sm"
                >
                  Clear All Filters
                </button>
              )}
            </div>
          </div>

          {/* Main Content */}
          <div className="flex-1">
            {/* Toolbar */}
            <div className="bg-white rounded-xl shadow-sm border p-6 mb-6">
              <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                {/* Left Side */}
                <div className="flex items-center gap-4">
                  {/* Results Count */}
                  <div className="text-sm text-gray-600">
                    Showing {filteredAndSortedProducts.length} of {products.length} products
                  </div>

                  {/* Active Filters Indicator */}
                  {hasActiveFilters && (
                    <button
                      onClick={handleClearFilters}
                      className="text-sm text-blue-600 hover:text-blue-700"
                    >
                      Clear All
                    </button>
                  )}
                </div>

                {/* Right Side */}
                <div className="flex items-center gap-4">
                  {/* Search */}
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="text"
                      placeholder="Search products..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      className="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                    />
                  </div>

                  {/* Sort Options */}
                  <select
                    value={sortBy}
                    onChange={(e) => setSortBy(e.target.value)}
                    className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="newest">Newest</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                  </select>
                </div>
              </div>

              {/* Active Filters Display */}
              {hasActiveFilters && (
                <div className="flex flex-wrap gap-2 mt-4 pt-4 border-t border-gray-200">
                  {searchQuery && (
                    <span className="inline-flex items-center gap-1 bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm">
                      Search: "{searchQuery}"
                      <button onClick={() => setSearchQuery('')} className="hover:text-blue-900">
                        ×
                      </button>
                    </span>
                  )}
                </div>
              )}
            </div>

            {/* Products Grid */}
            {filteredAndSortedProducts.length > 0 ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {filteredAndSortedProducts.map((product) => {
                  const primaryImage = product.images?.find(img => img.is_primary) || product.images?.[0];
                  const imageUrl = primaryImage ? getImageUrl(primaryImage.image_url) : '/placeholder.jpg';

                  return (
                    <div key={product.id} className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden group border border-gray-100">
                      <div className="relative aspect-square bg-gray-100 overflow-hidden">
                        <img
                          src={imageUrl}
                          alt={product.name}
                          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                          onError={(e) => {
                            e.currentTarget.src = '/placeholder.jpg';
                          }}
                        />
                        {product.stock_quantity > 0 && (
                          <div className="absolute top-2 left-2 bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">
                            In Stock
                          </div>
                        )}
                        {product.stock_quantity === 0 && (
                          <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                            <span className="text-white font-semibold">Out of Stock</span>
                          </div>
                        )}
                      </div>
                      <div className="p-4">
                        <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 text-sm">{product.name}</h3>
                        <p className="text-gray-600 text-xs mb-3 line-clamp-1">{product.sku}</p>
                        <div className="flex items-center justify-between">
                          <span className="text-lg font-bold text-gray-900">৳{Number(product.base_price).toFixed(2)}</span>
                          <button className="bg-blue-600 text-white p-2 rounded-lg hover:bg-blue-700 transition-colors">
                            <ShoppingCart className="h-4 w-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            ) : (
              <div className="text-center py-12">
                <p className="text-gray-600 mb-4">No products found matching your criteria.</p>
                <button
                  onClick={handleClearFilters}
                  className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700"
                >
                  Clear Filters
                </button>
              </div>
            )}
          </div>
          </div>
        </div>
      </div>
    </Layout>
  );
};

export default BestSellersPage;