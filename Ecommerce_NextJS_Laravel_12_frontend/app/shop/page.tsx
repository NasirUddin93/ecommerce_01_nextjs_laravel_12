"use client";
import React, { useState, useMemo, useEffect } from 'react';
import Layout from '../components/Layouts';
import SimpleProductCard from '../components/SimpleProductCard';
import { Search, Filter, ChevronLeft, ChevronRight } from 'lucide-react';
import { apiUrl } from '../common/http';

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
  category: number[];
  brand: number[];
  priceRange: [number, number];
  searchQuery: string;
}

const ShopPage: React.FC = () => {
  const [products, setProducts] = useState<APIProduct[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [brands, setBrands] = useState<Brand[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filters, setFilters] = useState<FilterState>({
    category: [],
    brand: [],
    priceRange: [0, 10000000],
    searchQuery: ''
  });
  const [sortBy, setSortBy] = useState<string>('featured');
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [productsPerPage, setProductsPerPage] = useState<number>(12);
  const [isFilterOpen, setIsFilterOpen] = useState<boolean>(false);

  // Fetch categories, brands, and products
  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        setError(null);
        console.log("Fetching from API URL:", apiUrl);
        
        const [productsRes, categoriesRes, brandsRes] = await Promise.all([
          fetch(`${apiUrl}/products`, {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          }),
          fetch(`${apiUrl}/categories`, {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          }),
          fetch(`${apiUrl}/brands`, {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          })
        ]);

        console.log("Products Response Status:", productsRes.status);
        console.log("Categories Response Status:", categoriesRes.status);
        console.log("Brands Response Status:", brandsRes.status);

        if (!productsRes.ok) {
          throw new Error(`Products API failed: ${productsRes.status}`);
        }
        if (!categoriesRes.ok) {
          throw new Error(`Categories API failed: ${categoriesRes.status}`);
        }
        if (!brandsRes.ok) {
          throw new Error(`Brands API failed: ${brandsRes.status}`);
        }

        const productsData = await productsRes.json();
        const categoriesData = await categoriesRes.json();
        const brandsData = await brandsRes.json();

        console.log("Products Data:", productsData);
        console.log("Categories Data:", categoriesData);
        console.log("Brands Data:", brandsData);

        const activeProducts = (productsData.data || productsData).filter(
          (p: APIProduct) => p.status === "active" || p.status === 1 || p.status === "1"
        );

        console.log("Active Products:", activeProducts);

        setProducts(activeProducts);
        setCategories((categoriesData.data || categoriesData).filter((c: Category) => c));
        setBrands((brandsData.data || brandsData).filter((b: Brand) => b));
      } catch (err) {
        const errorMessage = err instanceof Error ? err.message : "Unknown error";
        console.error("Error fetching data:", errorMessage);
        setError(errorMessage);
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
      if (filters.searchQuery && !product.name.toLowerCase().includes(filters.searchQuery.toLowerCase()) &&
          !product.description?.toLowerCase().includes(filters.searchQuery.toLowerCase())) {
        return false;
      }

      // Category filter
      if (filters.category.length > 0 && !filters.category.includes(product.category_id)) {
        return false;
      }

      // Brand filter
      if (filters.brand.length > 0 && !filters.brand.includes(product.brand_id)) {
        return false;
      }

      // Price range filter
      const price = typeof product.base_price === 'string' ? parseFloat(product.base_price) : product.base_price;
      if (price < filters.priceRange[0] || price > filters.priceRange[1]) {
        return false;
      }

      return true;
    });

    // Sort products
    switch (sortBy) {
      case 'price-low':
        filtered.sort((a, b) => {
          const priceA = typeof a.base_price === 'string' ? parseFloat(a.base_price) : a.base_price;
          const priceB = typeof b.base_price === 'string' ? parseFloat(b.base_price) : b.base_price;
          return priceA - priceB;
        });
        break;
      case 'price-high':
        filtered.sort((a, b) => {
          const priceA = typeof a.base_price === 'string' ? parseFloat(a.base_price) : a.base_price;
          const priceB = typeof b.base_price === 'string' ? parseFloat(b.base_price) : b.base_price;
          return priceB - priceA;
        });
        break;
      case 'newest':
        filtered.sort((a, b) => 
          new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
        );
        break;
      default:
        // Featured - default order
        break;
    }

    return filtered;
  }, [products, filters, sortBy]);

  // Pagination
  const totalProducts = filteredAndSortedProducts.length;
  const totalPages = Math.ceil(totalProducts / productsPerPage);
  const startIndex = (currentPage - 1) * productsPerPage;
  const endIndex = startIndex + productsPerPage;
  const currentProducts = filteredAndSortedProducts.slice(startIndex, endIndex);

  // Reset to first page when filters change
  useEffect(() => {
    setCurrentPage(1);
  }, [filters, sortBy]);

  const handleClearFilters = () => {
    setFilters({
      category: [],
      brand: [],
      priceRange: [0, 10000000],
      searchQuery: ''
    });
  };

  const toggleCategory = (categoryId: number) => {
    setFilters(prev => ({
      ...prev,
      category: prev.category.includes(categoryId)
        ? prev.category.filter(c => c !== categoryId)
        : [...prev.category, categoryId]
    }));
  };

  const toggleBrand = (brandId: number) => {
    setFilters(prev => ({
      ...prev,
      brand: prev.brand.includes(brandId)
        ? prev.brand.filter(b => b !== brandId)
        : [...prev.brand, brandId]
    }));
  };

  return (
    <Layout>
      <div className="bg-gray-50 min-h-screen">
        {/* Header */}
        <div className="bg-white shadow-sm border-b">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">Shop</h1>
            <p className="text-gray-600">Discover our amazing products</p>
          </div>
        </div>

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div className="flex flex-col lg:flex-row gap-8">
            {/* Sidebar - Filters */}
            <div className="lg:w-64 flex-shrink-0">
              <div className="bg-white rounded-lg shadow-sm p-6 sticky top-20">
                <h2 className="text-lg font-bold text-gray-900 mb-4">Filters</h2>

                {/* Clear Filters */}
                {(filters.category.length > 0 || filters.brand.length > 0 || filters.searchQuery) && (
                  <button
                    onClick={handleClearFilters}
                    className="w-full mb-4 text-sm text-blue-600 hover:text-blue-700 font-semibold"
                  >
                    Clear All Filters
                  </button>
                )}

                {/* Categories */}
                {categories.length > 0 && (
                  <div className="mb-6">
                    <h3 className="font-semibold text-gray-900 mb-3 text-sm">Categories</h3>
                    <div className="space-y-2">
                      {categories.map(category => (
                        <label key={category.id} className="flex items-center gap-2 cursor-pointer">
                          <input
                            type="checkbox"
                            checked={filters.category.includes(category.id)}
                            onChange={() => toggleCategory(category.id)}
                            className="w-4 h-4 rounded border-gray-300"
                          />
                          <span className="text-sm text-gray-700">{category.name}</span>
                        </label>
                      ))}
                    </div>
                  </div>
                )}

                {/* Brands */}
                {brands.length > 0 && (
                  <div className="mb-6">
                    <h3 className="font-semibold text-gray-900 mb-3 text-sm">Brands</h3>
                    <div className="space-y-2">
                      {brands.slice(0, 10).map(brand => (
                        <label key={brand.id} className="flex items-center gap-2 cursor-pointer">
                          <input
                            type="checkbox"
                            checked={filters.brand.includes(brand.id)}
                            onChange={() => toggleBrand(brand.id)}
                            className="w-4 h-4 rounded border-gray-300"
                          />
                          <span className="text-sm text-gray-700">{brand.name}</span>
                        </label>
                      ))}
                    </div>
                  </div>
                )}

                {/* Price Range */}
                <div className="mb-6">
                  <h3 className="font-semibold text-gray-900 mb-3 text-sm">Price Range</h3>
                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <span className="text-sm text-gray-600">Min: ৳{filters.priceRange[0]}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="text-sm text-gray-600">Max: ৳{filters.priceRange[1]}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Main Content */}
            <div className="flex-1">
              {/* Toolbar */}
              <div className="bg-white rounded-lg shadow-sm p-4 mb-6">
                <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                  <div className="text-sm text-gray-600">
                    {loading ? (
                      <span>Loading products...</span>
                    ) : (
                      <span>Showing {currentProducts.length} of {totalProducts} products</span>
                    )}
                  </div>

                  <div className="flex items-center gap-4">
                    <select
                      value={sortBy}
                      onChange={(e) => setSortBy(e.target.value)}
                      className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value="featured">Featured</option>
                      <option value="newest">Newest</option>
                      <option value="price-low">Price: Low to High</option>
                      <option value="price-high">Price: High to Low</option>
                    </select>

                    <select
                      value={productsPerPage}
                      onChange={(e) => setProductsPerPage(Number(e.target.value))}
                      className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value={12}>12 per page</option>
                      <option value={24}>24 per page</option>
                      <option value={48}>48 per page</option>
                    </select>
                  </div>
                </div>

                {/* Search Bar */}
                <div className="mt-4">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
                    <input
                      type="text"
                      placeholder="Search products..."
                      value={filters.searchQuery}
                      onChange={(e) => setFilters({ ...filters, searchQuery: e.target.value })}
                      className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                  </div>
                </div>
              </div>

              {/* Products Grid */}
              {loading ? (
                <div className="text-center py-12">
                  <div className="inline-block">
                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
                  </div>
                  <p className="text-gray-500 mt-4">Loading products...</p>
                </div>
              ) : error ? (
                <div className="bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg">
                  <p className="font-semibold">Error loading products</p>
                  <p className="text-sm mt-1">{error}</p>
                  <p className="text-sm mt-2">Make sure your Laravel API is running at {apiUrl}</p>
                </div>
              ) : currentProducts.length > 0 ? (
                <>
                  <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8">
                    {currentProducts.map(product => (
                      <SimpleProductCard key={product.id} product={product} />
                    ))}
                  </div>

                  {/* Pagination */}
                  {totalPages > 1 && (
                    <div className="flex items-center justify-center gap-2 py-8">
                      <button
                        onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                        disabled={currentPage === 1}
                        className="p-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <ChevronLeft className="w-5 h-5" />
                      </button>

                      {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
                        <button
                          key={page}
                          onClick={() => setCurrentPage(page)}
                          className={`px-3 py-2 rounded-lg ${
                            currentPage === page
                              ? 'bg-blue-600 text-white'
                              : 'border border-gray-300 hover:bg-gray-50'
                          }`}
                        >
                          {page}
                        </button>
                      ))}

                      <button
                        onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                        disabled={currentPage === totalPages}
                        className="p-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <ChevronRight className="w-5 h-5" />
                      </button>
                    </div>
                  )}
                </>
              ) : (
                <div className="text-center py-12 bg-white rounded-lg">
                  <p className="text-gray-500 text-lg">No products found matching your filters.</p>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
};

export default ShopPage;
