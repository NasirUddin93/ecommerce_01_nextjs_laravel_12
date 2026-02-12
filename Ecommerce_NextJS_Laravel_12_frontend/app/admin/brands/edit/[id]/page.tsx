"use client";
import { useState, useEffect } from "react";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import { apiUrl, adminToken } from "../../../../common/http";
import AdminLayout from "../../../AdminLayout";

interface BrandForm {
  name: string;
  status: number;
}

export default function EditBrand() {
  const params = useParams();
  const router = useRouter();
  const brandId = params.id as string;

  const [form, setForm] = useState<BrandForm>({ name: "", status: 1 });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");

  // Fetch brand data on mount
  useEffect(() => {
    const fetchBrand = async () => {
      try {
        setIsLoading(true);
        const res = await fetch(`${apiUrl}/brands/${brandId}`, {
          headers: { Authorization: `Bearer ${adminToken()}` },
        });

        if (!res.ok) {
          throw new Error("Brand not found");
        }

        const data = await res.json();
        const brand = data.data || data;
        setForm({
          name: brand.name,
          status: brand.status,
        });
      } catch (err) {
        console.error("Error fetching brand:", err);
        setError("Failed to load brand data");
      } finally {
        setIsLoading(false);
      }
    };

    if (brandId) {
      fetchBrand();
    }
  }, [brandId]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    const key = name as keyof BrandForm;

    setForm({ ...form, [key]: type === "number" ? Number(value) : value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting) return;
    setIsSubmitting(true);

    try {
      const res = await fetch(`${apiUrl}/brands/${brandId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify(form),
      });

      const responseData = await res.json();

      if (!res.ok) {
        alert("❌ " + JSON.stringify(responseData.errors || responseData.message));
        return;
      }

      alert("✅ Brand updated successfully!");
      router.push("/admin/brands");
    } catch (err) {
      console.error("Error:", err);
      alert("❌ Failed to update brand");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (isLoading) {
    return (
      <AdminLayout>
        <div className="max-w-2xl mx-auto">
          <p className="text-center text-gray-500">Loading brand data...</p>
        </div>
      </AdminLayout>
    );
  }

  if (error) {
    return (
      <AdminLayout>
        <div className="max-w-2xl mx-auto">
          <div className="bg-red-50 border border-red-200 rounded-lg p-4">
            <p className="text-red-600">{error}</p>
            <Link
              href="/admin/brands"
              className="text-red-600 hover:text-red-700 font-medium mt-2 inline-block"
            >
              Back to Brands
            </Link>
          </div>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="max-w-2xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-800">Edit Brand</h1>
          <p className="text-gray-600 mt-1">Update brand information</p>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">Brand Name</label>
              <input
                name="name"
                placeholder="Enter brand name"
                value={form.name}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">Status</label>
              <select
                name="status"
                value={form.status}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              >
                <option value={1}>Active</option>
                <option value={0}>Inactive</option>
              </select>
            </div>

            <div className="flex gap-3 pt-4">
              <button
                type="submit"
                disabled={isSubmitting}
                className="flex-1 bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 font-medium disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                {isSubmitting ? "Updating Brand..." : "Update Brand"}
              </button>
              <Link
                href="/admin/brands"
                className="px-6 py-3 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 font-medium transition-colors"
              >
                Cancel
              </Link>
            </div>
          </form>
        </div>
      </div>
    </AdminLayout>
  );
}
