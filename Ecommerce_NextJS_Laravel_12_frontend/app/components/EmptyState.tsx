"use client";

import { ShoppingBag, Search } from "lucide-react";
import Link from "next/link";

interface EmptyStateProps {
  type?: "no-results" | "empty-cart" | "no-wishlist";
  onReset?: () => void;
}

export default function EmptyState({
  type = "no-results",
  onReset,
}: EmptyStateProps) {
  const getStateContent = () => {
    switch (type) {
      case "no-results":
        return {
          icon: Search,
          title: "No Products Found",
          message: "We couldn't find any products matching your search.",
          buttonText: "Clear Filters",
          action: onReset,
        };
      case "empty-cart":
        return {
          icon: ShoppingBag,
          title: "Your Cart is Empty",
          message: "Start shopping to add items to your cart.",
          buttonText: "Continue Shopping",
          link: "/shop",
        };
      case "no-wishlist":
        return {
          icon: ShoppingBag,
          title: "Your Wishlist is Empty",
          message: "Add products to your wishlist to save them for later.",
          buttonText: "Start Shopping",
          link: "/shop",
        };
      default:
        return {
          icon: ShoppingBag,
          title: "No Items",
          message: "No items to display.",
          buttonText: "Go Back",
          link: "/",
        };
    }
  };

  const state = getStateContent();
  const Icon = state.icon;
  const isLink = "link" in state;

  return (
    <div className="flex flex-col items-center justify-center py-20 px-4">
      <Icon className="h-24 w-24 text-gray-300 mb-6" />
      <h3 className="text-2xl font-bold text-gray-900 mb-2 text-center">
        {state.title}
      </h3>
      <p className="text-gray-600 text-center mb-8 max-w-sm">{state.message}</p>

      {isLink ? (
        <Link
          href={state.link || "/"}
          className="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg font-semibold transition-colors"
        >
          {state.buttonText}
        </Link>
      ) : (
        <button
          onClick={state.action}
          className="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg font-semibold transition-colors"
        >
          {state.buttonText}
        </button>
      )}
    </div>
  );
}
