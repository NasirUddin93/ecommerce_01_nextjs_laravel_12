"use client";

import { useState } from "react";
import { Loader, Check } from "lucide-react";

interface ActionButtonProps {
  onClick: () => Promise<void> | void;
  loading?: boolean;
  success?: boolean;
  children: React.ReactNode;
  className?: string;
  disabled?: boolean;
}

export default function ActionButton({
  onClick,
  loading = false,
  success = false,
  children,
  className = "",
  disabled = false,
}: ActionButtonProps) {
  const [isLoading, setIsLoading] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);

  const handleClick = async () => {
    if (isLoading || disabled) return;
    
    setIsLoading(true);
    try {
      await onClick();
      setIsSuccess(true);
      setTimeout(() => setIsSuccess(false), 2000);
    } catch (error) {
      console.error("Error:", error);
    } finally {
      setIsLoading(false);
    }
  };

  const baseClasses =
    "flex items-center justify-center gap-2 transition-all duration-200";
  const defaultClasses = disabled
    ? "bg-gray-300 text-gray-600 cursor-not-allowed"
    : "bg-blue-600 hover:bg-blue-700 text-white";

  return (
    <button
      onClick={handleClick}
      disabled={isLoading || disabled}
      className={`${baseClasses} ${defaultClasses} ${className}`}
    >
      {isLoading && <Loader className="h-4 w-4 animate-spin" />}
      {isSuccess && <Check className="h-4 w-4" />}
      <span>{isSuccess ? "Added!" : children}</span>
    </button>
  );
}
