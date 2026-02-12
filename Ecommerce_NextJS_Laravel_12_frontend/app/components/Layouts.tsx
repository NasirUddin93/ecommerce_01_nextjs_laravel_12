// components/Layout.tsx
"use client";

import { ReactNode, useState, useEffect } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { ShoppingCart, User, Search, Scale } from "lucide-react";
// import { useCart } from "@/contexts/CartContext";
import { useCart } from "../contexts/CartContext";
import { useComparison } from "../contexts/ComparisonContext";

interface LayoutProps {
  children: ReactNode;
}

export default function Layout({ children }: LayoutProps) {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [isSticky, setIsSticky] = useState(false);
  const [isVisible, setIsVisible] = useState(true);
  const [lastScrollY, setLastScrollY] = useState(0);
  const pathname = usePathname();
  const { getCartItemsCount } = useCart(); // Get cart count from context
  const { comparisonProducts } = useComparison(); // Get comparison count

  // Smart scroll behavior
  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      
      // Set sticky state
      if (currentScrollY > 100) {
        setIsSticky(true);
      } else {
        setIsSticky(false);
      }

      // Smart hide/show on mobile (only when sticky)
      if (window.innerWidth < 768 && currentScrollY > 100) {
        if (currentScrollY > lastScrollY && currentScrollY > 200) {
          // Scrolling down - hide
          setIsVisible(false);
        } else {
          // Scrolling up - show
          setIsVisible(true);
        }
      } else {
        // Always visible on desktop or at top
        setIsVisible(true);
      }

      setLastScrollY(currentScrollY);
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, [lastScrollY]);

  const navigation = [
    { name: "Home", href: "/" },
    { name: "Shop", href: "/shop" },
    { name: "Featured Products", href: "/featured-products" },
    { name: "Categories", href: "/categories" },
    { name: "New Arrivals", href: "/new-arrivals" },
    { name: "Best Sellers", href: "/best-sellers" },
    { name: "Sale", href: "/sale" },
    { name: "About", href: "/about" },
    { name: "Contact", href: "/contact" },
  ];

  const isActiveRoute = (href: string) => {
    if (href === "/") return pathname === "/";
    return pathname.startsWith(href);
  };

  return (
    <div className="min-h-screen flex flex-col">
      {/* Header */}
      <header 
        className={`bg-white border-b border-gray-200 transition-all duration-300 ${
          isSticky 
            ? 'fixed top-0 left-0 right-0 z-50 shadow-md' 
            : 'relative'
        } ${
          !isVisible && isSticky 
            ? '-translate-y-full' 
            : 'translate-y-0'
        }`}
      >
        {/* Top Bar - Hide when sticky */}
        <div 
          className={`bg-gray-900 text-white py-2 px-4 text-xs sm:text-sm transition-all duration-300 overflow-hidden ${
            isSticky ? 'h-0 py-0 opacity-0' : 'h-auto opacity-100'
          }`}
        >
          <div className="max-w-7xl mx-auto flex justify-between items-center">
            <span className="text-gray-300">✨ Free shipping on orders over ৳5000</span>
            <div className="flex space-x-6">
              <Link href="/cart" className="text-gray-300 hover:text-white transition-colors">
                My Orders
              </Link>
              <Link href="/contact" className="text-gray-300 hover:text-white transition-colors">
                Support
              </Link>
            </div>
          </div>
        </div>

        {/* Main Header */}
        <div className={`max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 transition-all duration-300 ${
          isSticky ? 'py-2' : 'py-0'
        }`}>
          <div className={`flex justify-between items-center transition-all duration-300 ${
            isSticky ? 'h-14' : 'h-16'
          }`}>
            {/* Logo */}
            <Link href="/" className="flex items-center">
              <span className={`font-bold text-gray-900 transition-all duration-300 ${
                isSticky ? 'text-xl' : 'text-2xl'
              }`}>ShopStyle</span>
            </Link>

            {/* Desktop Navigation - Hide when sticky on mobile, show essential items */}
            <nav className={`hidden md:flex space-x-1 transition-opacity duration-300 ${
              isSticky ? 'lg:flex opacity-80' : 'opacity-100'
            }`}>
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  href={item.href}
                  className={`px-3 py-2 rounded-md text-sm font-medium transition-all ${
                    isActiveRoute(item.href)
                      ? "bg-blue-50 text-blue-600 border border-blue-200"
                      : "text-gray-700 hover:bg-gray-50"
                  }`}
                >
                  {item.name}
                </Link>
              ))}
            </nav>

            {/* Header Actions */}
            <div className="flex items-center space-x-2 sm:space-x-3">
              {/* Search - Compact on sticky */}
              <div className={`hidden sm:flex items-center border border-gray-300 rounded-lg bg-white hover:border-gray-400 transition-all duration-300 ${
                isSticky ? 'px-2 py-1.5' : 'px-3 py-2'
              }`}>
                <Search className={`text-gray-500 transition-all duration-300 ${
                  isSticky ? 'h-3.5 w-3.5' : 'h-4 w-4'
                }`} />
                <input
                  type="text"
                  placeholder="Search..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onKeyPress={(e) => {
                    if (e.key === "Enter" && searchQuery.trim()) {
                      window.location.href = `/search?q=${encodeURIComponent(searchQuery)}`;
                    }
                  }}
                  className={`bg-transparent border-none focus:outline-none focus:ring-0 px-2 transition-all duration-300 ${
                    isSticky ? 'text-xs w-32' : 'text-sm w-48'
                  }`}
                />
              </div>

              {/* User Account */}
              <Link 
                href="/account" 
                className={`p-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-all duration-300 ${
                  isSticky ? 'scale-95' : 'scale-100'
                }`} 
                title="Account"
              >
                <User className={`transition-all duration-300 ${
                  isSticky ? 'h-4 w-4' : 'h-5 w-5'
                }`} />
              </Link>

              {/* Shopping Cart */}
              <Link 
                href="/cart" 
                className={`relative p-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-all duration-300 ${
                  isSticky ? 'scale-95' : 'scale-100'
                }`}
              >
                <ShoppingCart className={`transition-all duration-300 ${
                  isSticky ? 'h-4 w-4' : 'h-5 w-5'
                }`} />
                {getCartItemsCount() > 0 && (
                  <span className={`absolute bg-red-500 text-white text-xs font-bold rounded-full flex items-center justify-center transition-all duration-300 ${
                    isSticky ? 'top-0.5 right-0.5 h-4 w-4 text-[10px]' : 'top-1 right-1 h-5 w-5'
                  }`}>
                    {getCartItemsCount()}
                  </span>
                )}
              </Link>

              {/* Comparison */}
              <Link 
                href="/shop/comparison" 
                className={`relative p-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-all duration-300 ${
                  isSticky ? 'scale-95' : 'scale-100'
                }`} 
                title="Compare Products"
              >
                <Scale className={`transition-all duration-300 ${
                  isSticky ? 'h-4 w-4' : 'h-5 w-5'
                }`} />
                {comparisonProducts.length > 0 && (
                  <span className={`absolute bg-blue-500 text-white text-xs font-bold rounded-full flex items-center justify-center transition-all duration-300 ${
                    isSticky ? 'top-0.5 right-0.5 h-4 w-4 text-[10px]' : 'top-1 right-1 h-5 w-5'
                  }`}>
                    {comparisonProducts.length}
                  </span>
                )}
              </Link>

              {/* Mobile Menu Button */}
              <button
                onClick={() => setIsMenuOpen(!isMenuOpen)}
                className="md:hidden p-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-colors"
                aria-label="Toggle menu"
              >
                <div className="w-6 h-6 flex flex-col justify-center space-y-1">
                  <span className={`block h-0.5 w-6 bg-current transition-all duration-300 ${isMenuOpen ? 'rotate-45 translate-y-2' : ''}`}></span>
                  <span className={`block h-0.5 w-6 bg-current transition-all duration-300 ${isMenuOpen ? 'opacity-0' : ''}`}></span>
                  <span className={`block h-0.5 w-6 bg-current transition-all duration-300 ${isMenuOpen ? '-rotate-45 -translate-y-2' : ''}`}></span>
                </div>
              </button>
            </div>
          </div>
        </div>

        {/* Mobile Menu */}
        {isMenuOpen && (
          <div className="md:hidden bg-white border-t border-gray-200">
            <div className="px-4 py-4 space-y-2">
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  href={item.href}
                  className={`block px-3 py-2 rounded-md text-sm font-medium transition-all ${
                    isActiveRoute(item.href)
                      ? "bg-blue-50 text-blue-600"
                      : "text-gray-700 hover:bg-gray-50"
                  }`}
                  onClick={() => setIsMenuOpen(false)}
                >
                  {item.name}
                </Link>
              ))}
            </div>
          </div>
        )}
      </header>

      {/* Main Content - Add padding when header is sticky */}
      <main className={`flex-grow transition-all duration-300 ${
        isSticky ? 'pt-14' : 'pt-0'
      }`}>{children}</main>

      {/* Footer */}
      <footer className="bg-gray-900 text-white border-t border-gray-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            {/* Company Info */}
            <div>
              <h3 className="text-lg font-bold mb-4 text-white">ShopStyle</h3>
              <p className="text-gray-400 text-sm leading-relaxed">
                Your one-stop destination for the latest fashion trends and accessories.
              </p>
            </div>

            {/* Quick Links */}
            <div>
              <h4 className="font-bold mb-4 text-white text-base">Quick Links</h4>
              <ul className="space-y-2">
                <li><Link href="/about" className="text-gray-400 text-sm hover:text-white transition-colors">About Us</Link></li>
                <li><Link href="/contact" className="text-gray-400 text-sm hover:text-white transition-colors">Contact</Link></li>
                <li><Link href="/shop" className="text-gray-400 text-sm hover:text-white transition-colors">Shop All</Link></li>
                <li><Link href="/sale" className="text-gray-400 text-sm hover:text-white transition-colors">Sale</Link></li>
              </ul>
            </div>

            {/* Products */}
            <div>
              <h4 className="font-bold mb-4 text-white text-base">Products</h4>
              <ul className="space-y-2">
                <li><Link href="/featured-products" className="text-gray-400 text-sm hover:text-white transition-colors">Featured</Link></li>
                <li><Link href="/best-sellers" className="text-gray-400 text-sm hover:text-white transition-colors">Best Sellers</Link></li>
                <li><Link href="/new-arrivals" className="text-gray-400 text-sm hover:text-white transition-colors">New Arrivals</Link></li>
                <li><Link href="/categories" className="text-gray-400 text-sm hover:text-white transition-colors">Categories</Link></li>
              </ul>
            </div>

            {/* Newsletter */}
            <div>
              <h4 className="font-bold mb-4 text-white text-base">Newsletter</h4>
              <p className="text-gray-400 mb-4 text-sm">Subscribe for exclusive offers</p>
              <form className="flex flex-col space-y-2">
                <input
                  type="email"
                  placeholder="Enter your email"
                  className="px-4 py-2 rounded-lg text-gray-900 text-sm placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500 border border-gray-300"
                />
                <button
                  type="submit"
                  className="bg-blue-600 hover:bg-blue-700 text-white py-2 rounded-lg text-sm font-semibold transition-colors"
                >
                  Subscribe
                </button>
              </form>
            </div>
          </div>

          <div className="border-t border-gray-800 mt-8 pt-8 text-center">
            <p className="text-gray-400 text-sm">&copy; {new Date().getFullYear()} ShopStyle. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}