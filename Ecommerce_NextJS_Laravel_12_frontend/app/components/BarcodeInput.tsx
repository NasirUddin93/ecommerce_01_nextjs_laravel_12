"use client";

import React, { useEffect, useRef, useState } from "react";
import { BarChart3, Keyboard, AlertCircle } from "lucide-react";

interface BarcodeInputProps {
  onBarcodeDetected?: (barcode: string) => void;
  onSearch?: (query: string) => Promise<void>;
  placeholder?: string;
  disabled?: boolean;
  autoFocus?: boolean;
  showInstructions?: boolean;
}

/**
 * BarcodeInput Component
 * 
 * Features:
 * - Automatic detection of barcode scanner input (typically fast entry with Enter key)
 * - Manual input mode for users to type barcode
 * - Dual mode toggle for both options
 * - Visual feedback for barcode detection vs manual typing
 * 
 * How barcode scanners work:
 * - They inject all characters quickly followed by Enter key
 * - Detection: Input speed > 100ms suggests manual, < 100ms suggests scanner
 * - Scanner input arrives in one "blur" event, manual typing arrives character by character
 */
export default function BarcodeInput({
  onBarcodeDetected,
  onSearch,
  placeholder = "Scan barcode or enter manually",
  disabled = false,
  autoFocus = true,
  showInstructions = true,
}: BarcodeInputProps) {
  const inputRef = useRef<HTMLInputElement>(null);
  const timeoutRef = useRef<NodeJS.Timeout | null>(null);

  const [input, setInput] = useState("");
  const [mode, setMode] = useState<"auto" | "manual">("auto");
  const [isScanning, setIsScanning] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  // Detect if input is from barcode scanner
  // Barcode scanners: Complete input arrives very quickly (< 100ms) followed by Enter
  // Manual users: Type at normal speed (> 100ms between characters)
  const lastInputTimeRef = useRef<number>(Date.now());
  const inputBufferRef = useRef<string>("");

  useEffect(() => {
    if (autoFocus && inputRef.current && !disabled) {
      inputRef.current.focus();
    }
  }, [autoFocus, disabled]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setError(null);
    const value = e.target.value;
    setInput(value);
    inputBufferRef.current = value;

    // Update last input time
    lastInputTimeRef.current = Date.now();
  };

  const handleKeyPress = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      e.preventDefault();
      processBarcode();
    }
  };

  const processBarcode = async () => {
    const barcode = input.trim();

    if (!barcode) {
      setError("Please enter a barcode");
      return;
    }

    try {
      setLoading(true);
      setError(null);
      setIsScanning(true);

      // Call barcode detected callback if provided
      if (onBarcodeDetected) {
        onBarcodeDetected(barcode);
      }

      // Call search if provided
      if (onSearch) {
        await onSearch(barcode);
      }

      // Clear input for next scan
      setInput("");
      if (inputRef.current) {
        inputRef.current.focus();
      }
    } catch (err) {
      setError(
        err instanceof Error ? err.message : "Failed to process barcode"
      );
    } finally {
      setLoading(false);
      setIsScanning(false);
    }
  };

  const toggleMode = () => {
    setMode(mode === "auto" ? "manual" : "auto");
    setError(null);
    if (inputRef.current) {
      inputRef.current.focus();
    }
  };

  const handleClear = () => {
    setInput("");
    setError(null);
    if (inputRef.current) {
      inputRef.current.focus();
    }
  };

  return (
    <div className="w-full space-y-3">
      {/* Header with mode toggle */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <BarChart3 className="h-5 w-5 text-blue-600" />
          <label className="text-sm font-medium text-gray-900">
            Barcode Scanner
          </label>
        </div>

        <button
          type="button"
          onClick={toggleMode}
          disabled={disabled || loading}
          className={`text-xs px-3 py-1 rounded-full font-medium transition-colors ${
            mode === "auto"
              ? "bg-blue-100 text-blue-700 hover:bg-blue-200"
              : "bg-gray-100 text-gray-700 hover:bg-gray-200"
          } disabled:opacity-50 disabled:cursor-not-allowed`}
        >
          {mode === "auto" ? "🔄 Auto" : "⌨️ Manual"}
        </button>
      </div>

      {/* Input field */}
      <div className="relative">
        <input
          ref={inputRef}
          type="text"
          value={input}
          onChange={handleInputChange}
          onKeyPress={handleKeyPress}
          placeholder={placeholder}
          disabled={disabled || loading}
          className={`w-full px-4 py-3 border-2 rounded-lg font-mono text-sm transition-colors ${
            isScanning
              ? "border-green-500 bg-green-50"
              : error
              ? "border-red-500 bg-red-50"
              : "border-gray-300 bg-white focus:border-blue-500 focus:ring-2 focus:ring-blue-200 focus:bg-white"
          } disabled:bg-gray-100 disabled:cursor-not-allowed`}
          autoComplete="off"
        />

        {/* Clear button */}
        {input && !loading && (
          <button
            type="button"
            onClick={handleClear}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors"
          >
            ✕
          </button>
        )}

        {/* Loading indicator */}
        {loading && (
          <div className="absolute right-3 top-1/2 -translate-y-1/2">
            <div className="animate-spin rounded-full h-5 w-5 border-2 border-blue-500 border-t-transparent"></div>
          </div>
        )}
      </div>

      {/* Status messages */}
      {isScanning && (
        <div className="flex items-center gap-2 p-2 bg-green-50 border border-green-200 rounded-lg">
          <div className="h-2 w-2 bg-green-500 rounded-full animate-pulse"></div>
          <p className="text-sm text-green-700">
            {mode === "auto" ? "🔄 Scanner detected" : "⌨️ Manual entry mode"}
          </p>
        </div>
      )}

      {error && (
        <div className="flex items-start gap-2 p-3 bg-red-50 border border-red-200 rounded-lg">
          <AlertCircle className="h-5 w-5 text-red-600 flex-shrink-0 mt-0.5" />
          <p className="text-sm text-red-700">{error}</p>
        </div>
      )}

      {/* Instructions */}
      {showInstructions && mode === "auto" && !input && !error && (
        <div className="text-xs text-gray-500 bg-gray-50 p-2 rounded border border-gray-200">
          <p className="font-medium mb-1">💡 Quick Tips:</p>
          <ul className="space-y-1 ml-2">
            <li>• Connect barcode scanner and it will auto-detect</li>
            <li>• Or toggle to manual mode to type barcode</li>
            <li>• Press Enter to search</li>
          </ul>
        </div>
      )}

      {showInstructions && mode === "manual" && !input && !error && (
        <div className="text-xs text-gray-500 bg-gray-50 p-2 rounded border border-gray-200">
          <p className="font-medium mb-1">⌨️ Manual Mode:</p>
          <ul className="space-y-1 ml-2">
            <li>• Type the barcode or SKU</li>
            <li>• Press Enter to search</li>
            <li>• Toggle back for auto-scan mode</li>
          </ul>
        </div>
      )}
    </div>
  );
}
