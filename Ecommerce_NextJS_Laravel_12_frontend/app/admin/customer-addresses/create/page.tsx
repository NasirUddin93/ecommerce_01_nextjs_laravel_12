"use client";

import { useState, useEffect, useMemo } from "react";
import { apiUrl, adminToken } from "../../../common/http";
import AdminLayout from "../../AdminLayout";
import Link from "next/link";
import { useRouter } from "next/navigation";

interface Division {
  id: number;
  name: string;
  code: string;
}

interface District {
  id: number;
  name: string;
  code: string;
  division_id: number;
}

interface Area {
  id: number;
  name: string;
  thana_name: string | null;
  code: string;
  district_id: number;
  delivery_charge_base: number | null;
}

interface AddressForm {
  user_id: string;
  recipient_name: string;
  phone: string;
  address_line_1: string;
  address_line_2: string;
  city: string;
  district: string;
  area: string;
  postal_code: string;
  country: string;
  address_label: string;
  is_default: boolean;
  is_active: boolean;
  bangladeshi_area_id: string;
}

export default function CreateCustomerAddressPage() {
  const router = useRouter();
  const [form, setForm] = useState<AddressForm>({
    user_id: "",
    recipient_name: "",
    phone: "",
    address_line_1: "",
    address_line_2: "",
    city: "",
    district: "",
    area: "",
    postal_code: "",
    country: "Bangladesh",
    address_label: "Home",
    is_default: false,
    is_active: true,
    bangladeshi_area_id: "",
  });

  const [divisions, setDivisions] = useState<Division[]>([]);
  const [districts, setDistricts] = useState<District[]>([]);
  const [areas, setAreas] = useState<Area[]>([]);
  const [isLoadingLocations, setIsLoadingLocations] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});

  // Load divisions on mount
  useEffect(() => {
    const fetchDivisions = async () => {
      try {
        setIsLoadingLocations(true);
        const res = await fetch(`${apiUrl}/bangladeshi-divisions`, {
          headers: {
            Authorization: `Bearer ${adminToken()}`,
            Accept: "application/json",
          },
        });
        if (res.ok) {
          const data = await res.json();
          setDivisions(data.data || []);
        }
      } catch (err) {
        console.error("Failed to fetch divisions:", err);
      } finally {
        setIsLoadingLocations(false);
      }
    };
    fetchDivisions();
  }, []);

  // Load districts when division changes
  useEffect(() => {
    if (!form.district) {
      setDistricts([]);
      setAreas([]);
      setForm((prev) => ({ ...prev, area: "", bangladeshi_area_id: "" }));
      return;
    }
    const fetchDistricts = async () => {
      try {
        const res = await fetch(
          `${apiUrl}/bangladeshi-districts?division_id=${form.district}`,
          {
            headers: {
              Authorization: `Bearer ${adminToken()}`,
              Accept: "application/json",
            },
          }
        );
        if (res.ok) {
          const data = await res.json();
          setDistricts(data.data || []);
          setAreas([]);
          setForm((prev) => ({ ...prev, area: "", bangladeshi_area_id: "" }));
        }
      } catch (err) {
        console.error("Failed to fetch districts:", err);
      }
    };
    fetchDistricts();
  }, [form.district]);

  // Load areas when district changes
  useEffect(() => {
    if (!form.area) {
      setAreas([]);
      setForm((prev) => ({ ...prev, bangladeshi_area_id: "" }));
      return;
    }
    const fetchAreas = async () => {
      try {
        const res = await fetch(
          `${apiUrl}/bangladeshi-areas?district_id=${form.area}`,
          {
            headers: {
              Authorization: `Bearer ${adminToken()}`,
              Accept: "application/json",
            },
          }
        );
        if (res.ok) {
          const data = await res.json();
          setAreas(data.data || []);
        }
      } catch (err) {
        console.error("Failed to fetch areas:", err);
      }
    };
    fetchAreas();
  }, [form.area]);

  const clientErrors = useMemo(() => {
    const e: Record<string, string> = {};
    if (!form.user_id.trim()) e.user_id = "User ID is required.";
    if (!form.recipient_name.trim()) e.recipient_name = "Recipient name is required.";
    if (!form.phone.trim()) e.phone = "Phone number is required.";
    if (!form.address_line_1.trim()) e.address_line_1 = "Address line 1 is required.";
    if (!form.city.trim()) e.city = "City is required.";
    if (!form.district) e.district = "District is required.";
    if (!form.area) e.area = "Area is required.";
    if (!form.bangladeshi_area_id) e.bangladeshi_area_id = "Please select a specific area.";
    return e;
  }, [form]);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>
  ) => {
    const { name, value, type } = e.target;
    const checked = (e.target as HTMLInputElement).checked;

    setForm((prev) => {
      if (type === "checkbox") {
        return { ...prev, [name]: checked };
      }
      return { ...prev, [name]: value };
    });
    setErrors((prev) => ({ ...prev, [name]: "" }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting) return;
    if (Object.keys(clientErrors).length > 0) {
      setErrors(clientErrors);
      return;
    }

    setIsSubmitting(true);
    try {
      const payload = {
        user_id: form.user_id.trim(),
        recipient_name: form.recipient_name.trim(),
        phone: form.phone.trim(),
        address_line_1: form.address_line_1.trim(),
        address_line_2: form.address_line_2.trim() || null,
        city: form.city.trim(),
        district: form.district.trim(),
        area: form.area.trim(),
        postal_code: form.postal_code.trim() || null,
        country: form.country.trim() || "Bangladesh",
        address_label: form.address_label.trim(),
        is_default: form.is_default,
        is_active: form.is_active,
        bangladeshi_area_id: form.bangladeshi_area_id,
      };

      const res = await fetch(`${apiUrl}/customer-addresses`, {
        method: "POST",
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

      alert("✅ Customer address created successfully!");
      router.push("/admin/customer-addresses");
    } catch (err) {
      console.error(err);
      alert("❌ Failed to create customer address");
    } finally {
      setIsSubmitting(false);
    }
  };

  const FieldError = ({ name }: { name: keyof AddressForm | string }) =>
    errors[name as string] ? (
      <p className="text-sm text-red-600 mt-1">{errors[name as string]}</p>
    ) : null;

  return (
    <AdminLayout>
      <div className="p-4 max-w-3xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <h1 className="text-2xl font-bold">Add Customer Address</h1>
          <Link
            href="/admin/customer-addresses"
            className="px-3 py-2 rounded-lg border hover:bg-gray-50"
          >
            ← Back
          </Link>
        </div>

        <form onSubmit={handleSubmit} className="space-y-5 bg-white p-6 rounded-lg shadow">
          {/* User ID */}
          <div>
            <label className="block text-sm font-medium mb-1">User ID *</label>
            <input
              name="user_id"
              value={form.user_id}
              onChange={handleChange}
              placeholder="Customer user ID"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="user_id" />
          </div>

          {/* Recipient Name */}
          <div>
            <label className="block text-sm font-medium mb-1">Recipient Name *</label>
            <input
              name="recipient_name"
              value={form.recipient_name}
              onChange={handleChange}
              placeholder="Full name"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="recipient_name" />
          </div>

          {/* Phone */}
          <div>
            <label className="block text-sm font-medium mb-1">Phone Number *</label>
            <input
              name="phone"
              value={form.phone}
              onChange={handleChange}
              placeholder="+880 1XXXXXXXXX"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="phone" />
          </div>

          {/* Address Line 1 */}
          <div>
            <label className="block text-sm font-medium mb-1">Address Line 1 *</label>
            <input
              name="address_line_1"
              value={form.address_line_1}
              onChange={handleChange}
              placeholder="Street address"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="address_line_1" />
          </div>

          {/* Address Line 2 */}
          <div>
            <label className="block text-sm font-medium mb-1">Address Line 2</label>
            <input
              name="address_line_2"
              value={form.address_line_2}
              onChange={handleChange}
              placeholder="Apt, suite, etc. (optional)"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* City */}
          <div>
            <label className="block text-sm font-medium mb-1">City *</label>
            <input
              name="city"
              value={form.city}
              onChange={handleChange}
              placeholder="City name"
              className="w-full border border-gray-300 rounded-lg p-2"
              required
            />
            <FieldError name="city" />
          </div>

          {/* Division/District/Area Dropdowns */}
          <div className="grid grid-cols-3 gap-3">
            {/* Division */}
            <div>
              <label className="block text-sm font-medium mb-1">Division</label>
              <select
                name="district"
                value={form.district}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
              >
                <option value="">Select Division</option>
                {divisions.map((div) => (
                  <option key={div.id} value={div.id}>
                    {div.name}
                  </option>
                ))}
              </select>
              <FieldError name="district" />
            </div>

            {/* District */}
            <div>
              <label className="block text-sm font-medium mb-1">District *</label>
              <select
                name="area"
                value={form.area}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
                disabled={!form.district}
              >
                <option value="">Select District</option>
                {districts.map((dis) => (
                  <option key={dis.id} value={dis.id}>
                    {dis.name}
                  </option>
                ))}
              </select>
              <FieldError name="area" />
            </div>

            {/* Area/Thana */}
            <div>
              <label className="block text-sm font-medium mb-1">Area/Thana *</label>
              <select
                name="bangladeshi_area_id"
                value={form.bangladeshi_area_id}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2"
                disabled={!form.area}
              >
                <option value="">Select Area</option>
                {areas.map((a) => (
                  <option key={a.id} value={a.id}>
                    {a.name} ({a.thana_name})
                  </option>
                ))}
              </select>
              <FieldError name="bangladeshi_area_id" />
            </div>
          </div>

          {/* Postal Code */}
          <div>
            <label className="block text-sm font-medium mb-1">Postal Code</label>
            <input
              name="postal_code"
              value={form.postal_code}
              onChange={handleChange}
              placeholder="Postal code (optional)"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Country */}
          <div>
            <label className="block text-sm font-medium mb-1">Country</label>
            <input
              name="country"
              value={form.country}
              onChange={handleChange}
              placeholder="Bangladesh"
              className="w-full border border-gray-300 rounded-lg p-2"
            />
          </div>

          {/* Address Label */}
          <div>
            <label className="block text-sm font-medium mb-1">Address Label</label>
            <select
              name="address_label"
              value={form.address_label}
              onChange={handleChange}
              className="w-full border border-gray-300 rounded-lg p-2"
            >
              <option value="Home">Home</option>
              <option value="Office">Office</option>
              <option value="Other">Other</option>
            </select>
          </div>

          {/* Checkboxes */}
          <div className="space-y-2">
            <div className="flex items-center">
              <input
                type="checkbox"
                name="is_default"
                checked={form.is_default}
                onChange={handleChange}
                className="w-4 h-4 rounded"
              />
              <label className="ml-2 text-sm font-medium">Set as default address</label>
            </div>
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
          </div>

          {/* Submit */}
          <div className="flex gap-2">
            <button
              type="submit"
              disabled={isSubmitting || Object.keys(clientErrors).length > 0}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 disabled:bg-gray-400"
            >
              {isSubmitting ? "Creating..." : "Create Address"}
            </button>
            <Link
              href="/admin/customer-addresses"
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
