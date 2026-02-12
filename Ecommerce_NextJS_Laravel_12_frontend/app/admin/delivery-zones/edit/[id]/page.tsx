"use client";

import { useState, useEffect, useMemo } from "react";
import { apiUrl, adminToken } from "../../../../common/http";
import AdminLayout from "../../../AdminLayout";
import Link from "next/link";
import { useRouter, useParams } from "next/navigation";
import Breadcrumb from "../../../components/Breadcrumb";

interface DeliveryZone {
  id: number;
  zone_name: string;
  description: string | null;
  area_code: string | null;
  standard_delivery_charge: number;
  express_delivery_charge: number | null;
  standard_delivery_days: number;
  express_delivery_days: number | null;
  free_delivery_min_amount: number | null;
  is_active: boolean;
  priority: number;
  districts: string | string[] | null;
}

interface DeliveryZoneForm {
  zone_name: string;
  description: string;
  area_code: string;
  standard_delivery_charge: string | number;
  express_delivery_charge: string | number;
  standard_delivery_days: string | number;
  express_delivery_days: string | number;
  free_delivery_min_amount: string | number;
  is_active: boolean;
  priority: string | number;
  districts: string;
}

export default function EditDeliveryZonePage() {
  const router = useRouter();
  const params = useParams();
  const id = params.id as string;

  const [isLoading, setIsLoading] = useState(true);
  const [form, setForm] = useState<DeliveryZoneForm | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});

  useEffect(() => {
    const fetchZone = async () => {
      try {
        const res = await fetch(`${apiUrl}/delivery-zones/${id}`, {
          headers: {
            Authorization: `Bearer ${adminToken()}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) {
          alert("❌ Failed to load zone");
          router.push("/admin/delivery-zones");
          return;
        }
        const data: { data?: DeliveryZone; message?: string } = await res.json();
        const zone = data.data || (data as any);
        setForm({
          zone_name: zone.zone_name || "",
          description: zone.description || "",
          area_code: zone.area_code || "",
          standard_delivery_charge: zone.standard_delivery_charge || "",
          express_delivery_charge: zone.express_delivery_charge || "",
          standard_delivery_days: zone.standard_delivery_days || "2",
          express_delivery_days: zone.express_delivery_days || "1",
          free_delivery_min_amount: zone.free_delivery_min_amount || "",
          is_active: zone.is_active !== false,
          priority: zone.priority || "50",
          districts: Array.isArray(zone.districts)
            ? zone.districts.join(", ")
            : zone.districts || "",
        });
      } catch (err) {
        console.error(err);
        alert("❌ Failed to load zone");
        router.push("/admin/delivery-zones");
      } finally {
        setIsLoading(false);
      }
    };
    fetchZone();
  }, [id, router]);

  const clientErrors = useMemo(() => {
    if (!form) return {};
    const e: Record<string, string> = {};
    if (!form.zone_name.trim()) e.zone_name = "Zone name is required.";
    const stdCharge = Number(form.standard_delivery_charge);
    if (Number.isNaN(stdCharge) || stdCharge < 0) {
      e.standard_delivery_charge = "Standard charge must be a valid number.";
    }
    if (form.express_delivery_charge !== "" && form.express_delivery_charge !== null) {
      const expCharge = Number(form.express_delivery_charge);
      if (Number.isNaN(expCharge) || expCharge < 0) {
        e.express_delivery_charge = "Express charge must be a valid number.";
      }
    }
    return e;
  }, [form]);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>
  ) => {
    const { name, value, type } = e.target;
    const checked = (e.target as HTMLInputElement).checked;

    setForm((prev) => {
      if (!prev) return null;
      if (type === "checkbox") {
        return { ...prev, [name]: checked };
      }
      return { ...prev, [name]: value };
    });
    setErrors((prev) => ({ ...prev, [name]: "" }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting || !form) return;
    if (Object.keys(clientErrors).length > 0) {
      setErrors(clientErrors);
      return;
    }

    setIsSubmitting(true);
    try {
      const districtsArray = form.districts
        .split(",")
        .map((d) => d.trim())
        .filter((d) => d);

      const payload = {
        zone_name: form.zone_name.trim(),
        description: form.description.trim() || null,
        area_code: form.area_code.trim() || null,
        districts: districtsArray.length > 0 ? districtsArray : null,
        standard_delivery_charge: Number(form.standard_delivery_charge),
        express_delivery_charge:
          form.express_delivery_charge === "" || form.express_delivery_charge === null
            ? null
            : Number(form.express_delivery_charge),
        standard_delivery_days: Number(form.standard_delivery_days),
        express_delivery_days:
          form.express_delivery_days === "" || form.express_delivery_days === null
            ? null
            : Number(form.express_delivery_days),
        free_delivery_min_amount:
          form.free_delivery_min_amount === "" || form.free_delivery_min_amount === null
            ? null
            : Number(form.free_delivery_min_amount),
        is_active: form.is_active,
        priority: Number(form.priority),
      };

      const res = await fetch(`${apiUrl}/delivery-zones/${id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${adminToken()}`,
          Accept: "application/json",
        },
        body: JSON.stringify(payload),
      });

      const data = await res.json().catch(() => ({}));

      if (!res.ok) {
        if (data?.errors && typeof data.errors === "object") {
          const flat: Record<string, string> = {};
          Object.entries<any>(data.errors).forEach(([k, v]) => {
            flat[k] = Array.isArray(v) ? v.join(" ") : String(v);
          });
          setErrors(flat);
          alert("❌ Please fix validation errors.");
        } else {
          alert("❌ " + (data?.message || `HTTP ${res.status}`));
        }
        return;
      }

      alert("✅ Delivery zone updated successfully!");
      router.push("/admin/delivery-zones");
    } catch (err) {
      console.error(err);
      alert("❌ Failed to update delivery zone");
    } finally {
      setIsSubmitting(false);
    }
  };

  const FieldError = ({ name }: { name: keyof DeliveryZoneForm | string }) =>
    errors[name as string] ? (
      <p className="text-sm text-red-600 mt-1">{errors[name as string]}</p>
    ) : null;

  if (isLoading) {
    return (
      <AdminLayout>
        <div className="p-3 sm:p-4 md:p-6 text-center">Loading...</div>
      </AdminLayout>
    );
  }

  if (!form) {
    return (
      <AdminLayout>
        <div className="p-3 sm:p-4 md:p-6 text-center">Zone not found</div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-3xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Delivery Zones", href: "/admin/delivery-zones" },
            { label: `Edit Zone` },
          ]}
        />
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
          <h1 className="text-2xl font-bold">Edit Delivery Zone</h1>
          <Link
            href="/admin/delivery-zones"
            className="px-3 py-2 rounded-lg border hover:bg-gray-50 min-h-10 flex items-center justify-center"
          >
            ← Back
          </Link>
        </div>

        <form onSubmit={handleSubmit} className="space-y-5 bg-white p-4 sm:p-6 rounded-lg shadow">
          {/* Zone Name */}
          <div>
            <label className="block text-sm font-medium mb-1">Zone Name *</label>
            <input
              name="zone_name"
              value={form.zone_name}
              onChange={handleChange}
              placeholder="e.g., Dhaka Metro"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="zone_name" />
          </div>

          {/* Description */}
          <div>
            <label className="block text-sm font-medium mb-1">Description</label>
            <textarea
              name="description"
              value={form.description}
              onChange={handleChange}
              placeholder="Zone description..."
              rows={3}
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Area Code */}
          <div>
            <label className="block text-sm font-medium mb-1">Area Code</label>
            <input
              name="area_code"
              value={form.area_code}
              onChange={handleChange}
              placeholder="e.g., DHA001"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Districts (comma-separated) */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Districts (comma-separated)
            </label>
            <textarea
              name="districts"
              value={form.districts}
              onChange={handleChange}
              placeholder="e.g., Dhaka, Gazipur, Narayanganj"
              rows={2}
              className="w-full border border-gray-300 rounded-lg p-2"
            />
            <p className="text-xs text-gray-500 mt-1">
              Enter district names separated by commas
            </p>
          </div>

          {/* Standard Delivery Charge */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Standard Delivery Charge (৳) *
            </label>
            <input
              name="standard_delivery_charge"
              type="number"
              step="0.01"
              value={form.standard_delivery_charge}
              onChange={handleChange}
              placeholder="60"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="standard_delivery_charge" />
          </div>

          {/* Express Delivery Charge */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Express Delivery Charge (৳)
            </label>
            <input
              name="express_delivery_charge"
              type="number"
              step="0.01"
              value={form.express_delivery_charge}
              onChange={handleChange}
              placeholder="120"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
            <FieldError name="express_delivery_charge" />
          </div>

          {/* Standard Delivery Days */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Standard Delivery Days
            </label>
            <input
              name="standard_delivery_days"
              type="number"
              value={form.standard_delivery_days}
              onChange={handleChange}
              placeholder="2"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Express Delivery Days */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Express Delivery Days
            </label>
            <input
              name="express_delivery_days"
              type="number"
              value={form.express_delivery_days}
              onChange={handleChange}
              placeholder="1"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Free Delivery Min Amount */}
          <div>
            <label className="block text-sm font-medium mb-1">
              Free Delivery Minimum Amount (৳)
            </label>
            <input
              name="free_delivery_min_amount"
              type="number"
              step="0.01"
              value={form.free_delivery_min_amount}
              onChange={handleChange}
              placeholder="1500"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Priority */}
          <div>
            <label className="block text-sm font-medium mb-1">Priority</label>
            <input
              name="priority"
              type="number"
              value={form.priority}
              onChange={handleChange}
              placeholder="50"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
            <p className="text-xs text-gray-500 mt-1">Higher priority zones are preferred</p>
          </div>

          {/* Status */}
          <div className="flex items-center">
            <input
              type="checkbox"
              name="is_active"
              checked={form.is_active}
              onChange={handleChange}
              className="w-4 h-4 rounded"
            />
            <label className="ml-2 text-sm font-medium">Active</label>
          </div>

          {/* Submit */}
          <div className="flex gap-2">
            <button
              type="submit"
              disabled={isSubmitting || Object.keys(clientErrors).length > 0}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 disabled:bg-gray-400"
            >
              {isSubmitting ? "Saving..." : "Update Delivery Zone"}
            </button>
            <Link
              href="/admin/delivery-zones"
              className="px-4 py-2 rounded-lg border hover:bg-gray-50"
            >
              Cancel
            </Link>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}
