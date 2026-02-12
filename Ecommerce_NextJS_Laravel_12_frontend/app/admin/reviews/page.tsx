"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for category
export interface Review {
  id: number;
  user_id: number;
  product_id: number;
  rating: number;
  comment: string;
  created_at?: string;
  updated_at?: string;
  deleted_at?: string | null;
}

interface PaginationData {
  total: number;
  per_page: number;
  current_page: number;
  last_page: number;
  from: number;
  to: number;
}

export default function ReviewsPage() {
  const [reviews, setReviews] = useState<Review[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchReviews = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/reviews?page=${page}&per_page=${perPage}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      setLoader(false);

      if (result.status === 200 && Array.isArray(result.data)) {
        setReviews(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching reviews:", error);
    }
  };

  useEffect(() => {
    fetchReviews(currentPage);
  }, [perPage]);

  // Filter reviews based on search text
  const filteredReviews = reviews.filter((review) =>
    review.id.toString().includes(search.toLowerCase()) ||
    review.comment.toLowerCase().includes(search.toLowerCase())
  );

  const handlePageChange = (page: number) => {
    fetchReviews(page);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Reviews" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Reviews</h1>
            <p className="text-gray-600 mt-1">Manage customer reviews</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search reviews..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/reviews/create"
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Review
            </Link>
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredReviews.length > 0 ? (
          <>
            <ResponsiveTable<Review>
              columns={[
                { key: "id", label: "ID", mobileHide: true },
                { key: "user_id", label: "User ID" },
                { key: "product_id", label: "Product ID", mobileHide: true },
                {
                  key: "rating",
                  label: "Rating",
                  render: (value: number) => (
                    <span className="text-yellow-500">
                      {"⭐".repeat(value)} {value}/5
                    </span>
                  ),
                },
                { key: "comment", label: "Comment" },
                {
                  key: "actions",
                  label: "Actions",
                  render: () => (
                    <div className="flex gap-2 justify-end flex-wrap">
                      <button
                        className="px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md text-sm font-medium"
                        title="View"
                        aria-label="View"
                      >
                        👁️
                      </button>
                      <button
                        className="px-3 py-2 text-yellow-600 hover:bg-yellow-50 rounded-md text-sm font-medium"
                        title="Edit"
                        aria-label="Edit"
                      >
                        ✏️
                      </button>
                      <button
                        className="px-3 py-2 text-red-600 hover:bg-red-50 rounded-md text-sm font-medium"
                        title="Delete"
                        aria-label="Delete"
                      >
                        🗑️
                      </button>
                    </div>
                  ),
                },
              ]}
              data={filteredReviews}
              keyField="id"
              loading={loader}
            />

            {pagination && pagination.last_page > 1 && (
              <ResponsivePagination
                currentPage={currentPage}
                lastPage={pagination.last_page}
                total={pagination.total}
                from={pagination.from}
                to={pagination.to}
                perPage={perPage}
                onPageChange={handlePageChange}
                onPerPageChange={setPerPage}
              />
            )}
          </>
        ) : (
          <div className="text-center py-6 text-gray-500">No review found</div>
        )}
      </div>
    </AdminLayout>
  );
}