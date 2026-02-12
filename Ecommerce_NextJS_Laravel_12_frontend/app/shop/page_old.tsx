"use client";
import React, { useState, useMemo, useEffect } from 'react';
import Layout from '../components/Layouts';
import SimpleProductCard from '../components/SimpleProductCard';
import { Search, Filter, Grid, List, ChevronLeft, ChevronRight } from 'lucide-react';
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
  const [filters, setFilters] = useState<FilterState>({
    category: [],
    brand: [],
    priceRange: [0, 10000],
    searchQuery: ''
  });
  const [sortBy, setSortBy] = useState<string>('featured');
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [productsPerPage, setProductsPerPage] = useState<number>(12);
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [isFilterOpen, setIsFilterOpen] = useState<boolean>(false);

  // Fetch categories, brands, and products
  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        
        const [productsRes, categoriesRes, brandsRes] = await Promise.all([
          fetch(`${apiUrl}/products`, {
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          }),
          fetch(`${apiUrl}/categories`, {
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          }),
          fetch(`${apiUrl}/brands`, {
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json",
            },
          })
        ]);

        const productsData = await productsRes.json();
        const categoriesData = await categoriesRes.json();
        const brandsData = await brandsRes.json();

        const activeProducts = (productsData.data || productsData).filter(
          (p: APIProduct) => p.status === "active"
        );

        setProducts(activeProducts);
        setCategories(categoriesData.data || categoriesData);
        setBrands(brandsData.data || brandsData);
      } catch (err) {
        console.error("Error fetching data:", err);
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
      if (product.base_price < filters.priceRange[0] || product.base_price > filters.priceRange[1]) {
        return false;
      }

      return true;
    });

    // Sort products
    switch (sortBy) {
      case 'price-low':
        filtered.sort((a, b) => a.base_price - b.base_price);
        break;
      case 'price-high':
        filtered.sort((a, b) => b.base_price - a.base_price);
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
  }, [filters, sortBy]);

  const handleAddToCart = (product: Product) => {
    console.log('Added to cart:', product);
    // Implement cart logic
  };

  const handleQuickView = (product: Product) => {
    console.log('Quick view:', product);
    // Implement quick view logic
  };

  const handleClearFilters = () => {
    setFilters({
      category: [],
      brand: [],
      priceRange: [0, 1000],
      rating: [],
      searchQuery: ''
    });
  };

  // Helper functions for active filters
  const handleCategoryChange = (category: string) => {
    setFilters(prev => ({
      ...prev,
      category: prev.category.filter(c => c !== category)
    }));
  };

  const handleBrandChange = (brand: string) => {
    setFilters(prev => ({
      ...prev,
      brand: prev.brand.filter(b => b !== brand)
    }));
  };

  const handleRatingChange = (rating: number) => {
    setFilters(prev => ({
      ...prev,
      rating: prev.rating.filter(r => r !== rating)
    }));
  };

  return (
    <Layout>
      <div className="bg-gray-50">
        {/* Header */}
        <div className="bg-white shadow-sm border-b">
          <div className="container mx-auto px-4 py-6">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">Shop</h1>
            <p className="text-gray-600">Discover our amazing products</p>
          </div>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="flex flex-col lg:flex-row gap-8">
          {/* Filters Sidebar */}
          <div className="lg:w-64 flex-shrink-0">
            <FilterSidebar
              filters={filters}
              filterOptions={filterOptions}
              onFilterChange={setFilters}
              onClearFilters={handleClearFilters}
              isOpen={isFilterOpen}
              onClose={() => setIsFilterOpen(false)}
            />
          </div>

          {/* Main Content */}
          <div className="flex-1">
            {/* Toolbar */}
            <div className="bg-white rounded-lg shadow-sm border border-gray-100 p-4 mb-6">
              <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                {/* Left Side */}
                <div className="flex items-center gap-4">
                  {/* Mobile Filter Button */}
                  <button
                    onClick={() => setIsFilterOpen(true)}
                    className="lg:hidden flex items-center gap-2 px-3 py-2 border border-gray-300 rounded-lg hover:bg-gray-50"
                  >
                    <Filter className="w-4 h-4" />
                    <span>Filters</span>
                  </button>

                  {/* Products Count */}
                  <div className="text-sm text-gray-600">
                    Showing {paginationInfo.currentProducts.length} of {paginationInfo.totalProducts} products
                  </div>
                </div>

                {/* Right Side */}
                <div className="flex items-center gap-4">
                  {/* View Mode Toggle */}
                  <div className="flex border border-gray-300 rounded-lg overflow-hidden">
                    <button
                      onClick={() => setViewMode('grid')}
                      className={`p-2 ${viewMode === 'grid' ? 'bg-gray-100' : 'hover:bg-gray-50'}`}
                    >
                      <Grid className="w-4 h-4" />
                    </button>
                    <button
                      onClick={() => setViewMode('list')}
                      className={`p-2 ${viewMode === 'list' ? 'bg-gray-100' : 'hover:bg-gray-50'}`}
                    >
                      <List className="w-4 h-4" />
                    </button>
                  </div>

                  {/* Sort By */}
                  <select
                    value={sortBy}
                    onChange={(e) => setSortBy(e.target.value)}
                    className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    {sortOptions.map(option => (
                      <option key={option.value} value={option.value}>
                        {option.label}
                      </option>
                    ))}
                  </select>

                  {/* Products Per Page */}
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

            {/* Active Filters */}
            {(filters.category.length > 0 || filters.brand.length > 0 || filters.rating.length > 0 || filters.searchQuery) && (
              <div className="flex flex-wrap gap-2 mb-6">
                {filters.searchQuery && (
                  <span className="inline-flex items-center gap-1 bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm">
                    Search: "{filters.searchQuery}"
                    <button onClick={() => setFilters({ ...filters, searchQuery: '' })}>×</button>
                  </span>
                )}
                {filters.category.map(cat => (
                  <span key={cat} className="inline-flex items-center gap-1 bg-gray-100 text-gray-800 px-3 py-1 rounded-full text-sm">
                    {cat}
                    <button onClick={() => handleCategoryChange(cat)}>×</button>
                  </span>
                ))}
                {filters.brand.map(brand => (
                  <span key={brand} className="inline-flex items-center gap-1 bg-gray-100 text-gray-800 px-3 py-1 rounded-full text-sm">
                    {brand}
                    <button onClick={() => handleBrandChange(brand)}>×</button>
                  </span>
                ))}
                {filters.rating.map(rating => (
                  <span key={rating} className="inline-flex items-center gap-1 bg-gray-100 text-gray-800 px-3 py-1 rounded-full text-sm">
                    {rating}★ & Up
                    <button onClick={() => handleRatingChange(rating)}>×</button>
                  </span>
                ))}
              </div>
            )}

            {/* Products Grid */}
            {paginationInfo.currentProducts.length > 0 ? (
              <div className={`
                grid gap-6 mb-8
                ${viewMode === 'grid' 
                  ? 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4' 
                  : 'grid-cols-1'
                }
              `}>
                {paginationInfo.currentProducts.map(product => (
                  <ProductCard
                    key={product.id}
                    product={product}
                    onAddToCart={handleAddToCart}
                    onQuickView={handleQuickView}
                  />
                ))}
              </div>
            ) : (
              <div className="text-center py-12">
                <div className="text-gray-400 text-6xl mb-4">😔</div>
                <h3 className="text-xl font-semibold text-gray-900 mb-2">No products found</h3>
                <p className="text-gray-600 mb-4">Try adjusting your filters or search terms</p>
                <button
                  onClick={handleClearFilters}
                  className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Clear All Filters
                </button>
              </div>
            )}

            {/* Pagination */}
            {paginationInfo.totalPages > 1 && (
              <div className="flex items-center justify-between border-t border-gray-200 pt-8">
                <div className="text-sm text-gray-700">
                  Showing page {paginationInfo.currentPage} of {paginationInfo.totalPages}
                </div>
                <div className="flex items-center gap-1">
                  <button
                    onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                    disabled={currentPage === 1}
                    className="p-2 rounded-lg border border-gray-300 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    <ChevronLeft className="w-5 h-5" />
                  </button>
                  
                  {Array.from({ length: Math.min(5, paginationInfo.totalPages) }, (_, i) => {
                    const pageNum = i + 1;
                    return (
                      <button
                        key={pageNum}
                        onClick={() => setCurrentPage(pageNum)}
                        className={`w-10 h-10 rounded-lg border ${
                          currentPage === pageNum
                            ? 'bg-blue-600 text-white border-blue-600'
                            : 'border-gray-300 hover:bg-gray-50'
                        }`}
                      >
                        {pageNum}
                      </button>
                    );
                  })}

                  <button
                    onClick={() => setCurrentPage(prev => Math.min(prev + 1, paginationInfo.totalPages))}
                    disabled={currentPage === paginationInfo.totalPages}
                    className="p-2 rounded-lg border border-gray-300 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    <ChevronRight className="w-5 h-5" />
                  </button>
                </div>
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