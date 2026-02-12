"use client";
import Layout from "../components/Layouts";
import { WifiOff } from "lucide-react";

export default function OfflinePage() {
  return (
    <Layout>
      <div className="min-h-screen flex items-center justify-center bg-gray-50 px-4">
        <div className="text-center">
          <div className="inline-flex items-center justify-center w-24 h-24 bg-gray-200 rounded-full mb-6">
            <WifiOff className="w-12 h-12 text-gray-600" />
          </div>
          <h1 className="text-3xl md:text-4xl font-bold text-gray-800 mb-4">
            You're Offline
          </h1>
          <p className="text-gray-600 mb-8 max-w-md mx-auto">
            It looks like you've lost your internet connection. Please check your network and try again.
          </p>
          <button
            onClick={() => window.location.reload()}
            className="bg-blue-500 text-white px-6 py-3 rounded-lg hover:bg-blue-600 transition"
          >
            Try Again
          </button>
        </div>
      </div>
    </Layout>
  );
}
