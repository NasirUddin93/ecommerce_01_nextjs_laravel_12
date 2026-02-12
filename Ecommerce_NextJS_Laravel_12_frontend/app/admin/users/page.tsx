"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import ResponsivePagination from "../components/ResponsivePagination";

// TypeScript interface for category
interface User {
  id: number;
  name: string;
  email: string;
  role: "admin" | "customer";
  created_at?: Date;
  updated_at?: Date;
  deleted_at?: Date | null;
}

interface PaginationData {
  total: number;
  per_page: number;
  current_page: number;
  last_page: number;
  from: number;
  to: number;
}

export default function UsersPage() {

  const [users, setUsers] = useState<User[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [perPage, setPerPage] = useState(10);

  const fetchUsers = async (page: number = 1) => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/users?page=${page}&per_page=${perPage}`, {
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
        setUsers(result.data);
        if (result.pagination) {
          setPagination(result.pagination);
          setCurrentPage(result.pagination.current_page);
        }
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching users:", error);
    }
  };

  useEffect(() => {
    fetchUsers(currentPage);
  }, [perPage]);

  // Filter categories based on search text
  const filteredUsers = users.filter((user) =>
    user.name.toLowerCase().includes(search.toLowerCase()) ||
    user.email.toLowerCase().includes(search.toLowerCase())
  );

  const handlePageChange = (page: number) => {
    fetchUsers(page);
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Users" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Users</h1>
            <p className="text-gray-600 mt-1">Manage user accounts</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search users by name or email..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredUsers.length > 0 ? (
          <>
            <ResponsiveTable<User>
              columns={[
                { key: "id", label: "User ID", mobileHide: true },
                { key: "name", label: "Name" },
                { key: "email", label: "Email", mobileHide: true },
                {
                  key: "role",
                  label: "Role",
                  render: (value: "admin" | "customer") => (
                    <span
                      className={`px-2 py-1 text-xs rounded-full ${
                        value === "admin"
                          ? "bg-blue-100 text-blue-700"
                          : "bg-gray-100 text-gray-700"
                      }`}
                    >
                      {value}
                    </span>
                  ),
                },
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
              data={filteredUsers}
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
          <div className="text-center py-6 text-gray-500">No user found</div>
        )}
      </div>
    </AdminLayout>
  );
}