import React from "react";

interface ResponsivePaginationProps {
  currentPage: number;
  lastPage: number;
  total: number;
  from: number;
  to: number;
  perPage: number;
  onPageChange: (page: number) => void;
  onPerPageChange: (perPage: number) => void;
}

export default function ResponsivePagination({
  currentPage,
  lastPage,
  total,
  from,
  to,
  perPage,
  onPageChange,
  onPerPageChange,
}: ResponsivePaginationProps) {
  const pageNumbers = [];
  const maxVisiblePages = 3;
  const startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
  const endPage = Math.min(lastPage, startPage + maxVisiblePages - 1);

  for (let i = startPage; i <= endPage; i++) {
    pageNumbers.push(i);
  }

  return (
    <div className="mt-6 bg-white p-4 rounded-lg shadow space-y-4 md:space-y-0">
      {/* Info and Per Page - Stack on mobile */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div className="text-sm text-gray-700">
          Showing <strong>{from}</strong> to <strong>{to}</strong> of{" "}
          <strong>{total}</strong>
        </div>

        <div className="flex items-center gap-2">
          <label className="text-sm text-gray-700 whitespace-nowrap">
            Per page:
          </label>
          <select
            value={perPage}
            onChange={(e) => onPerPageChange(Number(e.target.value))}
            className="border border-gray-300 rounded px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value={5}>5</option>
            <option value={10}>10</option>
            <option value={20}>20</option>
            <option value={50}>50</option>
          </select>
        </div>
      </div>

      {/* Pagination Buttons - Compact on mobile */}
      <div className="flex items-center justify-center md:justify-end gap-1 flex-wrap">
        {/* First Button (hidden on mobile) */}
        <button
          onClick={() => onPageChange(1)}
          disabled={currentPage === 1}
          className="hidden sm:block px-3 py-2 rounded border border-gray-300 text-sm hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed min-h-10"
          title="First"
        >
          «
        </button>

        {/* Previous Button */}
        <button
          onClick={() => onPageChange(currentPage - 1)}
          disabled={currentPage === 1}
          className="px-3 py-2 rounded border border-gray-300 text-sm hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed min-h-10"
          title="Previous"
        >
          ‹
        </button>

        {/* Page Numbers */}
        {pageNumbers.map((page) => (
          <button
            key={page}
            onClick={() => onPageChange(page)}
            className={`px-3 py-2 rounded text-sm min-h-10 font-medium ${
              currentPage === page
                ? "bg-blue-500 text-white border border-blue-500"
                : "border border-gray-300 hover:bg-gray-100"
            }`}
          >
            {page}
          </button>
        ))}

        {/* Next Button */}
        <button
          onClick={() => onPageChange(currentPage + 1)}
          disabled={currentPage === lastPage}
          className="px-3 py-2 rounded border border-gray-300 text-sm hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed min-h-10"
          title="Next"
        >
          ›
        </button>

        {/* Last Button (hidden on mobile) */}
        <button
          onClick={() => onPageChange(lastPage)}
          disabled={currentPage === lastPage}
          className="hidden sm:block px-3 py-2 rounded border border-gray-300 text-sm hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed min-h-10"
          title="Last"
        >
          »
        </button>
      </div>
    </div>
  );
}
