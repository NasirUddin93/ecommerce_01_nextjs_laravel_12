"use client";

import { createContext, useCallback, useContext, useEffect, useMemo, useState } from "react";
import { apiUrl } from "../common/http";

export interface WishlistItem {
  id: number;
  product_id: number;
  product: {
    id: number;
    name: string;
    description: string;
    price: number;
    stock_quantity: number;
    images: Array<{ id: number; image_url: string }>;
  };
  created_at: string;
}

interface WishlistContextType {
  wishlistItems: WishlistItem[];
  loading: boolean;
  error: string;
  refreshWishlist: () => Promise<void>;
  addToWishlist: (productId: number) => Promise<void>;
  removeFromWishlist: (productId: number) => Promise<void>;
  isWishlisted: (productId: number) => boolean;
}

const WishlistContext = createContext<WishlistContextType | undefined>(undefined);

function getAuthToken() {
  return typeof window !== "undefined" ? localStorage.getItem("authToken") : null;
}

export function WishlistProvider({ children }: { children: React.ReactNode }) {
  const [wishlistItems, setWishlistItems] = useState<WishlistItem[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const refreshWishlist = useCallback(async () => {
    const authToken = getAuthToken();

    if (!authToken) {
      setWishlistItems([]);
      setError("");
      return;
    }

    try {
      setLoading(true);
      const response = await fetch(`${apiUrl}/wishlist`, {
        headers: {
          Authorization: `Bearer ${authToken}`,
          Accept: "application/json",
        },
      });

      if (!response.ok) {
        throw new Error("Failed to fetch wishlist");
      }

      const data = await response.json();
      setWishlistItems(data.data || []);
      setError("");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to fetch wishlist");
    } finally {
      setLoading(false);
    }
  }, []);

  const addToWishlist = useCallback(async (productId: number) => {
    const authToken = getAuthToken();

    if (!authToken) {
      throw new Error("Please log in to use the wishlist.");
    }

    const response = await fetch(`${apiUrl}/wishlist`, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${authToken}`,
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ product_id: productId }),
    });

    if (!response.ok) {
      throw new Error("Failed to add to wishlist");
    }

    const data = await response.json();
    if (data.data) {
      setWishlistItems((prev) => {
        const exists = prev.some((item) => item.product_id === productId);
        return exists ? prev : [data.data, ...prev];
      });
    } else {
      await refreshWishlist();
    }
  }, [refreshWishlist]);

  const removeFromWishlist = useCallback(async (productId: number) => {
    const authToken = getAuthToken();

    if (!authToken) {
      throw new Error("Please log in to use the wishlist.");
    }

    const response = await fetch(`${apiUrl}/wishlist/${productId}`, {
      method: "DELETE",
      headers: {
        Authorization: `Bearer ${authToken}`,
        Accept: "application/json",
      },
    });

    if (!response.ok) {
      throw new Error("Failed to remove from wishlist");
    }

    setWishlistItems((prev) => prev.filter((item) => item.product_id !== productId));
  }, []);

  const isWishlisted = useCallback((productId: number) => {
    return wishlistItems.some((item) => item.product_id === productId);
  }, [wishlistItems]);

  useEffect(() => {
    refreshWishlist();
  }, [refreshWishlist]);

  const value = useMemo(() => ({
    wishlistItems,
    loading,
    error,
    refreshWishlist,
    addToWishlist,
    removeFromWishlist,
    isWishlisted,
  }), [wishlistItems, loading, error, refreshWishlist, addToWishlist, removeFromWishlist, isWishlisted]);

  return (
    <WishlistContext.Provider value={value}>
      {children}
    </WishlistContext.Provider>
  );
}

export function useWishlist() {
  const context = useContext(WishlistContext);
  if (context === undefined) {
    throw new Error("useWishlist must be used within a WishlistProvider");
  }
  return context;
}
