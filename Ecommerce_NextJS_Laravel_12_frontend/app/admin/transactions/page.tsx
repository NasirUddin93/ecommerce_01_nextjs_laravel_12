"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for category
interface Transaction {
  id: number;
  user_id: number;
  order_id: number;
  transaction_type: number;
  method: 'debit'|'credit'|'refund'|'chargeback';
  transaction_reference: string;
  amount: number;
  currency: number;
  status: 'pending'|'success'|'failed'|'refunded';
  remarks: string;
  processed_at: Date;
  created_at?: Date;
  updated_at?: Date;
  deleted_at?: Date | null;
}

export default function TransactionsPage() {

  const [transactions, setTransactions] = useState<Transaction[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<{total: number; per_page: number; current_page: number; last_page: number; from: number; to: number} | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchTransactions = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/transactions?page=${page}&per_page=${perPage}`, {
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
        setTransactions(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching transactions:", error);
    }
  };

  useEffect(() => {
    fetchTransactions(currentPage);
  }, [perPage]);

  const handlePageChange = (page: number) => {
    fetchTransactions(page);
  };

  // Filter transactions based on search text
  const filteredTransactions = transactions.filter((transaction) =>
    transaction.id.toString().includes(search.toLowerCase()) ||
    transaction.status.toLowerCase().includes(search.toLowerCase()) ||
    transaction.transaction_reference.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Transactions" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Transactions</h1>
            <p className="text-gray-600 mt-1">Review payment transactions</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search transactions..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredTransactions.length > 0 ? (
          <>
            <ResponsiveTable<Transaction>
              columns={[
                { key: "id", label: "ID", mobileHide: true },
                { key: "user_id", label: "User ID" },
                { key: "order_id", label: "Order ID", mobileHide: true },
                { key: "transaction_type", label: "Type", mobileHide: true },
                { key: "method", label: "Method" },
                {
                  key: "transaction_reference",
                  label: "Reference",
                  mobileHide: true,
                },
                {
                  key: "amount",
                  label: "Amount",
                  render: (value: number) => `$${Number(value || 0).toFixed(2)}`,
                },
                { key: "currency", label: "Currency", mobileHide: true },
                {
                  key: "status",
                  label: "Status",
                  render: (value: Transaction["status"]) => (
                    <span
                      className={`px-2 py-1 text-xs rounded-full ${
                        value === "success"
                          ? "bg-green-100 text-green-700"
                          : value === "pending"
                          ? "bg-yellow-100 text-yellow-700"
                          : "bg-red-100 text-red-700"
                      }`}
                    >
                      {value}
                    </span>
                  ),
                },
                { key: "remarks", label: "Remarks", mobileHide: true },
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
              data={filteredTransactions}
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
          <div className="text-center py-6 text-gray-500">No transactions found</div>
        )}
      </div>
    </AdminLayout>
  );
}