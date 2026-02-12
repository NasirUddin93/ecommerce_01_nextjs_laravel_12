"use client";
import React, { createContext, useContext, useState, ReactNode } from "react";

export interface ComparisonProduct {
  id: number;
  name: string;
  price: number;
  originalPrice?: number;
  image: string;
  rating: number;
  reviews: number;
  badge?: string;
  stock?: number;
  images?: Array<{ image_path?: string; image_url?: string }>;
  description?: string;
  category?: string;
  brand?: string;
}

interface ComparisonContextType {
  comparisonProducts: ComparisonProduct[];
  addProduct: (product: ComparisonProduct) => void;
  removeProduct: (productId: number) => void;
  clearComparison: () => void;
  isInComparison: (productId: number) => boolean;
  canAddMore: () => boolean;
}

const ComparisonContext = createContext<ComparisonContextType | undefined>(undefined);

export const ComparisonProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [comparisonProducts, setComparisonProducts] = useState<ComparisonProduct[]>([]);

  const MAX_COMPARISON_PRODUCTS = 4;

  const addProduct = (product: ComparisonProduct) => {
    if (comparisonProducts.length < MAX_COMPARISON_PRODUCTS) {
      if (!comparisonProducts.find((p) => p.id === product.id)) {
        setComparisonProducts([...comparisonProducts, product]);
      }
    }
  };

  const removeProduct = (productId: number) => {
    setComparisonProducts(comparisonProducts.filter((p) => p.id !== productId));
  };

  const clearComparison = () => {
    setComparisonProducts([]);
  };

  const isInComparison = (productId: number) => {
    return comparisonProducts.some((p) => p.id === productId);
  };

  const canAddMore = () => {
    return comparisonProducts.length < MAX_COMPARISON_PRODUCTS;
  };

  return (
    <ComparisonContext.Provider
      value={{
        comparisonProducts,
        addProduct,
        removeProduct,
        clearComparison,
        isInComparison,
        canAddMore,
      }}
    >
      {children}
    </ComparisonContext.Provider>
  );
};

export const useComparison = () => {
  const context = useContext(ComparisonContext);
  if (context === undefined) {
    throw new Error("useComparison must be used within a ComparisonProvider");
  }
  return context;
};
