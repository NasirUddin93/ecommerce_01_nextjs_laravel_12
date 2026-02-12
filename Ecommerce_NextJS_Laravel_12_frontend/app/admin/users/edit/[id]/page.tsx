"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { apiUrl, adminToken } from "../../../../common/http";
import AdminLayout from "../../../AdminLayout";

interface Props {
  params: {
    id: string;
  };
}

export default function EditUserPage({ params }: Props) {
  const router = useRouter();
  const [loader, setLoader] = useState(false);
  const [fetchingLoader, setFetchingLoader] = useState(true);
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    role: "customer",
    is_active: true,
  });

  useEffect(() => {
    fetchUser();
  }, []);

  const fetchUser = async () => {
    try {
      setFetchingLoader(true);
      const res = await fetch(`${apiUrl}/users/${params.id}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      setFetchingLoader(false);

      if (result.status === 200) {
        const user = result.data;
        setFormData({
          name: user.name || "",
          email: user.email || "",
          password: "",
          role: user.role || "customer",
          is_active: user.is_active !== undefined ? user.is_active : true,
        });
      } else {
        alert("Failed to fetch user details");
        router.push("/admin/users");
      }
    } catch (error) {
      setFetchingLoader(false);
      console.error("Error fetching user:", error);
      alert("An error occurred while fetching user details");
      router.push("/admin/users");
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    setFormData({
      ...formData,
      [name]: type === "checkbox" ? (e.target as HTMLInputElement).checked : value,
    });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoader(true);

    try {
      // Don't send password if it's empty
      const updateData = { ...formData };
      if (!updateData.password) {
        delete updateData.password;
      }

      const res = await fetch(`${apiUrl}/users/${params.id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify(updateData),
      });

      const result = await res.json();
      setLoader(false);

      if (result.status === 200) {
        alert("User updated successfully!");
        router.push("/admin/users");
      } else {
        alert(result.message || "Failed to update user");
      }
    } catch (error) {
      setLoader(false);
      console.error("Error updating user:", error);
      alert("An error occurred while updating the user");
    }
  };

  if (fetchingLoader) {
    return (
      <AdminLayout>
        <div className="text-center py-12">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading user details...</p>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="mb-6">
        <h1 className="text-3xl font-bold">Edit User</h1>
        <p className="text-gray-600 mt-1">Update user information</p>
      </div>

      <div className="bg-white p-6 rounded-lg shadow-sm max-w-2xl">
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium mb-1">
              Name <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={handleChange}
              required
              className="w-full p-2 border border-gray-300 rounded-lg"
              placeholder="Enter user's full name"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-1">
              Email <span className="text-red-500">*</span>
            </label>
            <input
              type="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              required
              className="w-full p-2 border border-gray-300 rounded-lg"
              placeholder="user@example.com"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-1">
              Password <span className="text-gray-500">(Leave empty to keep current password)</span>
            </label>
            <input
              type="password"
              name="password"
              value={formData.password}
              onChange={handleChange}
              minLength={8}
              className="w-full p-2 border border-gray-300 rounded-lg"
              placeholder="Enter new password or leave empty"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-1">
              Role <span className="text-red-500">*</span>
            </label>
            <select
              name="role"
              value={formData.role}
              onChange={handleChange}
              className="w-full p-2 border border-gray-300 rounded-lg"
            >
              <option value="customer">Customer</option>
              <option value="admin">Admin</option>
            </select>
          </div>

          <div className="flex items-center gap-2">
            <input
              type="checkbox"
              name="is_active"
              checked={formData.is_active}
              onChange={handleChange}
              className="w-4 h-4"
            />
            <label className="text-sm font-medium">Active (User can login)</label>
          </div>

          <div className="flex gap-4 pt-4">
            <button
              type="submit"
              disabled={loader}
              className="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600 disabled:opacity-50"
            >
              {loader ? "Updating..." : "Update User"}
            </button>
            <button
              type="button"
              onClick={() => router.push("/admin/users")}
              className="bg-gray-300 text-gray-700 px-6 py-2 rounded-lg hover:bg-gray-400"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}
