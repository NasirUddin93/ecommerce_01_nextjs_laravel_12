"use client";

import { ShoppingBag, User, Zap, Clock } from "lucide-react";

interface CheckoutModeSelectorProps {
  checkoutMode: "guest" | "registered";
  onModeChange: (mode: "guest" | "registered") => void;
  isLoggedIn: boolean;
}

/**
 * Checkout Mode Selector Component
 * 
 * Allows customers to choose between guest checkout or registered user checkout
 * Shows benefits of each option
 */
export default function CheckoutModeSelector({
  checkoutMode,
  onModeChange,
  isLoggedIn,
}: CheckoutModeSelectorProps) {
  // If already logged in, skip this selector
  if (isLoggedIn) {
    return null;
  }

  return (
    <div className="mb-8 bg-white p-6 rounded-lg shadow-sm border border-gray-200">
      <h2 className="text-2xl font-bold text-gray-900 mb-2">Choose Checkout Method</h2>
      <p className="text-gray-600 mb-6">Select how you'd like to complete your purchase</p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Guest Checkout Option */}
        <button
          onClick={() => onModeChange("guest")}
          className={`group relative p-6 border-2 rounded-lg transition-all duration-200 text-left ${
            checkoutMode === "guest"
              ? "border-blue-600 bg-blue-50 shadow-md"
              : "border-gray-300 hover:border-blue-400 hover:shadow-sm"
          }`}
        >
          {/* Selected Badge */}
          {checkoutMode === "guest" && (
            <div className="absolute top-4 right-4 bg-blue-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
              Selected
            </div>
          )}

          {/* Icon */}
          <div className={`inline-flex items-center justify-center w-12 h-12 rounded-full mb-4 ${
            checkoutMode === "guest" ? "bg-blue-100" : "bg-gray-100"
          }`}>
            <Zap className={`h-6 w-6 ${
              checkoutMode === "guest" ? "text-blue-600" : "text-gray-600"
            }`} />
          </div>

          <h3 className="font-bold text-xl text-gray-900 mb-2">
            Guest Checkout
          </h3>
          <p className="text-gray-600 text-sm mb-4">
            Quick checkout without creating an account
          </p>

          {/* Benefits List */}
          <ul className="space-y-2">
            <li className="flex items-start text-sm text-gray-700">
              <Clock className="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>Fast checkout - no registration needed</span>
            </li>
            <li className="flex items-start text-sm text-gray-700">
              <ShoppingBag className="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>Track order via email</span>
            </li>
            <li className="flex items-start text-sm text-gray-700">
              <User className="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>Optional account creation after purchase</span>
            </li>
          </ul>

          {/* Recommended Badge */}
          <div className="mt-4 pt-4 border-t border-gray-200">
            <span className="inline-block bg-green-100 text-green-800 px-3 py-1 rounded-full text-xs font-semibold">
              ⚡ Fastest Option
            </span>
          </div>
        </button>

        {/* Registered User Option */}
        <button
          onClick={() => onModeChange("registered")}
          className={`group relative p-6 border-2 rounded-lg transition-all duration-200 text-left ${
            checkoutMode === "registered"
              ? "border-blue-600 bg-blue-50 shadow-md"
              : "border-gray-300 hover:border-blue-400 hover:shadow-sm"
          }`}
        >
          {/* Selected Badge */}
          {checkoutMode === "registered" && (
            <div className="absolute top-4 right-4 bg-blue-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
              Selected
            </div>
          )}

          {/* Icon */}
          <div className={`inline-flex items-center justify-center w-12 h-12 rounded-full mb-4 ${
            checkoutMode === "registered" ? "bg-blue-100" : "bg-gray-100"
          }`}>
            <User className={`h-6 w-6 ${
              checkoutMode === "registered" ? "text-blue-600" : "text-gray-600"
            }`} />
          </div>

          <h3 className="font-bold text-xl text-gray-900 mb-2">
            Login / Register
          </h3>
          <p className="text-gray-600 text-sm mb-4">
            Access your account for saved information
          </p>

          {/* Benefits List */}
          <ul className="space-y-2">
            <li className="flex items-start text-sm text-gray-700">
              <Clock className="h-4 w-4 text-blue-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>Use saved addresses - one-click checkout</span>
            </li>
            <li className="flex items-start text-sm text-gray-700">
              <ShoppingBag className="h-4 w-4 text-blue-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>View full order history anytime</span>
            </li>
            <li className="flex items-start text-sm text-gray-700">
              <User className="h-4 w-4 text-blue-600 mr-2 mt-0.5 flex-shrink-0" />
              <span>Manage wishlist & loyalty points</span>
            </li>
          </ul>

          {/* Recommended Badge */}
          <div className="mt-4 pt-4 border-t border-gray-200">
            <span className="inline-block bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-xs font-semibold">
              🎁 Extra Benefits
            </span>
          </div>
        </button>
      </div>

      {/* Additional Info */}
      <div className="mt-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
        <p className="text-sm text-gray-700 text-center">
          <span className="font-semibold">🔒 Secure Checkout:</span> Your information is encrypted and protected
          {checkoutMode === "guest" && (
            <span className="ml-2">
              • You can create an account after completing your order
            </span>
          )}
        </p>
      </div>
    </div>
  );
}
