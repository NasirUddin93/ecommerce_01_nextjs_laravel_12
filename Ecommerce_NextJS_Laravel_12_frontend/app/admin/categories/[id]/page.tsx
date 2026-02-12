"use client";
import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import { apiUrl, adminToken } from "../../../common/http";
import AdminLayout from "../../AdminLayout";

interface CategoryForm {
  name: string;
  description: string;
  status: number;
}

export default function EditCategory() {
  const params = useParams();
  const router = useRouter();
  const categoryId = params.id as string;

  const [form, setForm] = useState<CategoryForm>({ name: "", description: "", status: 1 });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");

  // Fetch category data on mount
  useEffect(() => {
    const fetchCategory = async () => {
      try {
        setIsLoading(true);
        const res = await fetch(`${apiUrl}/categories/${categoryId}`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${adminToken()}`,
          },
        });

        const result = await res.json();

        if (result.status === 200 && result.data) {
          setForm({
            name: result.data.name,
            description: result.data.description,
            status: result.data.status,
          });
        } else {
          setError("Failed to load category data");
        }
      } catch (err) {
        console.error("Error fetching category:", err);
        setError("Failed to fetch category");
      } finally {
        setIsLoading(false);
      }
    };

    if (categoryId) {
      fetchCategory();
    }
  }, [categoryId]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    const key = name as keyof CategoryForm;

    setForm({ ...form, [key]: type === "number" ? Number(value) : value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting) return;
    setIsSubmitting(true);
    setError("");

    try {
      const res = await fetch(`${apiUrl}/categories/${categoryId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify({
          name: form.name,
          description: form.description,
          status: form.status,
        }),
      });

      const responseData = await res.json();

      if (!res.ok) {
        setError(JSON.stringify(responseData.errors || responseData.message));
        alert("❌ " + JSON.stringify(responseData.errors || responseData.message));
        return;
      }

      alert("✅ Category updated successfully!");
      router.push("/admin/categories");
    } catch (err) {
      console.error("Error:", err);
      setError("Failed to update category");
      alert("❌ Failed to update category");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (isLoading) {
    return (
      <AdminLayout>
        <div className="p-4 max-w-4xl mx-auto">
          <p className="text-center text-gray-500">Loading category...</p>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="p-4 max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold mb-6">Edit Category</h1>

        {error && (
          <div className="mb-4 p-3 bg-red-100 text-red-700 rounded-lg">
            {error}
          </div>
        )}

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium mb-1">Category Name</label>
            <input
              name="name"
              placeholder="Enter Category name"
              value={form.name}
              onChange={handleChange}
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
          </div>
          <div>
            <label className="block text-sm font-medium mb-1">Category Description</label>
            <input
              name="description"
              placeholder="Enter description"
              value={form.description}
              onChange={handleChange}
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-1">Status</label>
            <select
              name="status"
              value={form.status}
              onChange={handleChange}
              className="w-full border border-gray-300 rounded-lg p-2"
            >
              <option value={1}>Active</option>
              <option value={0}>Inactive</option>
            </select>
          </div>

          <div className="flex gap-4">
            <button
              type="submit"
              disabled={isSubmitting}
              className="flex-1 bg-blue-500 text-white p-3 rounded-lg hover:bg-blue-600 disabled:opacity-50"
            >
              {isSubmitting ? "Updating..." : "Update Category"}
            </button>
            <button
              type="button"
              onClick={() => router.push("/admin/categories")}
              className="flex-1 bg-gray-400 text-white p-3 rounded-lg hover:bg-gray-500"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}
