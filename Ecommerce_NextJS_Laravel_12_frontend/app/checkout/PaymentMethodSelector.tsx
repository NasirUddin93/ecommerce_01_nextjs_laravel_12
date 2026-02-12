"use client";

import { useState } from "react";
import Image from "next/image";

interface PaymentMethod {
  id: string;
  code: string;
  name: string;
  description: string;
  icon: string;
}

interface PaymentMethodSelectorProps {
  selectedMethod: string | null;
  onMethodChange: (methodCode: string) => void;
}

export default function PaymentMethodSelector({
  selectedMethod,
  onMethodChange,
}: PaymentMethodSelectorProps) {
  const paymentMethods: PaymentMethod[] = [
    {
      id: "1",
      code: "cod",
      name: "Cash on Delivery",
      description: "Pay when you receive your order at your doorstep",
      icon: "💰",
    },
    {
      id: "2",
      code: "bkash",
      name: "bKash",
      description: "Fast and secure mobile payment using bKash",
      icon: "📱",
    },
    {
      id: "3",
      code: "nagad",
      name: "Nagad",
      description: "Mobile financial service by Bangladesh Post Office",
      icon: "📲",
    },
    {
      id: "4",
      code: "rocket",
      name: "Rocket",
      description: "Payment service by Dutch-Bangla Bank",
      icon: "🚀",
    },
  ];

  return (
    <div className="space-y-4">
      <h2 className="text-xl font-bold text-gray-800">Select Payment Method</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {paymentMethods.map((method) => (
          <div
            key={method.id}
            onClick={() => onMethodChange(method.code)}
            className={`p-4 border-2 rounded-lg cursor-pointer transition-all ${
              selectedMethod === method.code
                ? "border-blue-500 bg-blue-50"
                : "border-gray-200 bg-white hover:border-gray-300"
            }`}
          >
            <div className="flex items-start gap-3">
              <div className="text-3xl">{method.icon}</div>
              <div className="flex-1">
                <div className="flex items-center gap-2">
                  <input
                    type="radio"
                    name="payment-method"
                    value={method.code}
                    checked={selectedMethod === method.code}
                    onChange={() => onMethodChange(method.code)}
                    className="w-4 h-4"
                  />
                  <h3 className="font-semibold text-gray-800">{method.name}</h3>
                </div>
                <p className="text-sm text-gray-600 mt-1">{method.description}</p>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
