"use client";

import { Suspense, useEffect, useState } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { CheckCircle, XCircle } from "lucide-react";

function AuthCallbackContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [status, setStatus] = useState<"loading" | "success" | "error">("loading");
  const [message, setMessage] = useState("Completing authentication...");

  useEffect(() => {
    const token = searchParams.get("token");
    const email = searchParams.get("email");
    const error = searchParams.get("error");

    // Handle error
    if (error) {
      setStatus("error");
      setMessage("Authentication failed. Please try again.");
      
      setTimeout(() => {
        router.push("/login");
      }, 3000);
      return;
    }

    // Handle success
    if (token && email) {
      try {
        // Store auth data
        localStorage.setItem("authToken", token);
        localStorage.setItem("userEmail", email);
        localStorage.setItem("userRole", "customer");

        setStatus("success");
        setMessage("Authentication successful! Redirecting...");

        // Get redirect URL from localStorage or default to home
        const redirectUrl = localStorage.getItem("oauth_redirect") || "/";
        localStorage.removeItem("oauth_redirect");

        // Redirect after 2 seconds
        setTimeout(() => {
          router.push(redirectUrl);
        }, 2000);
      } catch (err) {
        setStatus("error");
        setMessage("Failed to save authentication data");
        
        setTimeout(() => {
          router.push("/login");
        }, 3000);
      }
    } else {
      // Missing parameters
      setStatus("error");
      setMessage("Invalid authentication response");
      
      setTimeout(() => {
        router.push("/login");
      }, 3000);
    }
  }, [router, searchParams]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-8">
        {/* Loading State */}
        {status === "loading" && (
          <div className="text-center">
            <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-blue-600 mx-auto mb-6"></div>
            <h2 className="text-xl font-semibold text-gray-900 mb-2">
              {message}
            </h2>
            <p className="text-gray-600">Please wait...</p>
          </div>
        )}

        {/* Success State */}
        {status === "success" && (
          <div className="text-center">
            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <CheckCircle className="w-10 h-10 text-green-600" />
            </div>
            <h2 className="text-xl font-semibold text-gray-900 mb-2">
              {message}
            </h2>
            <p className="text-gray-600">Welcome back!</p>
          </div>
        )}

        {/* Error State */}
        {status === "error" && (
          <div className="text-center">
            <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <XCircle className="w-10 h-10 text-red-600" />
            </div>
            <h2 className="text-xl font-semibold text-gray-900 mb-2">
              {message}
            </h2>
            <p className="text-gray-600 mb-6">Redirecting to login page...</p>
            <button
              onClick={() => router.push("/login")}
              className="bg-blue-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
            >
              Go to Login
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

export default function AuthCallbackPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen flex items-center justify-center bg-gray-50">
          <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-8">
            <div className="text-center">
              <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-blue-600 mx-auto mb-6"></div>
              <h2 className="text-xl font-semibold text-gray-900 mb-2">
                Loading authentication...
              </h2>
              <p className="text-gray-600">Please wait...</p>
            </div>
          </div>
        </div>
      }
    >
      <AuthCallbackContent />
    </Suspense>
  );
}
