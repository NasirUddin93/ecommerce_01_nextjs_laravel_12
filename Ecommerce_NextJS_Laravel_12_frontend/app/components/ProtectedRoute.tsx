"use client";

import { useEffect, ReactNode, useState } from "react";
import { useRouter } from "next/navigation";

interface ProtectedRouteProps {
  children: ReactNode;
  fallbackUrl?: string;
  requireAdmin?: boolean;
}

/**
 * ProtectedRoute Component
 * 
 * Wraps components that require authentication
 * Redirects to login if user is not authenticated
 * Optionally requires admin role
 */
export default function ProtectedRoute({ 
  children, 
  fallbackUrl = "/login", 
  requireAdmin = false 
}: ProtectedRouteProps) {
  const router = useRouter();
  const [isMounted, setIsMounted] = useState(false);
  const [token, setToken] = useState<string | null>(null);
  const [userRole, setUserRole] = useState<string | null>(null);

  useEffect(() => {
    setIsMounted(true);
    const storedToken = localStorage.getItem("authToken");
    const storedRole = localStorage.getItem("userRole");
    setToken(storedToken);
    setUserRole(storedRole);

    // Check authentication
    if (!storedToken) {
      // Not logged in - redirect to login
      const currentPath = window.location.pathname;
      const hasRedirect = fallbackUrl.includes("redirect=");
      const separator = fallbackUrl.includes("?") ? "&" : "?";
      const targetUrl = hasRedirect
        ? fallbackUrl
        : `${fallbackUrl}${separator}redirect=${encodeURIComponent(currentPath)}`;
      router.push(targetUrl);
      return;
    }

    // Check admin requirement
    if (requireAdmin && storedRole !== "admin") {
      router.push("/unauthorized");
      return;
    }
  }, [router, fallbackUrl, requireAdmin]);

  if (!isMounted) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading...</p>
        </div>
      </div>
    );
  }

  if (!token) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Checking authentication...</p>
        </div>
      </div>
    );
  }

  if (requireAdmin && userRole !== "admin") {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="text-6xl mb-4">🔒</div>
          <h1 className="text-2xl font-bold text-gray-800 mb-2">Access Denied</h1>
          <p className="text-gray-600">You don't have permission to access this page.</p>
        </div>
      </div>
    );
  }

  return <>{children}</>;
}
