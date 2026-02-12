"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { apiUrl, adminToken } from "../../../../common/http";
import AdminLayout from "../../../AdminLayout";
import { ArrowLeft, MapPin, Phone, User } from "lucide-react";

interface CustomerAddress {
  id: number;
  user_id: number;
  address_label?: string | null;
  address_line_1: string;
  address_line_2?: string | null;
  city: string;
  district: string;
  area: string;
  postal_code: string;
  country: string;
  phone: string;
  recipient_name: string;
  is_default: boolean;
  is_active: boolean;
  created_at?: string;
  updated_at?: string;
}

interface Props {
  params: {
    id: string;
  };
}

export default function ViewCustomerAddressPage({ params }: Props) {
  const router = useRouter();
  const [address, setAddress] = useState<CustomerAddress | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchAddress();
  }, []);

  const fetchAddress = async () => {
    try {
      setLoading(true);
      const res = await fetch(`${apiUrl}/customer-addresses/${params.id}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      setLoading(false);

      if (result.status === 200) {
        setAddress(result.data);
      } else {
        alert("Failed to load address details");
        router.push("/admin/customer-addresses");
      }
    } catch (error) {
      setLoading(false);
      console.error("Error fetching address:", error);
      alert("An error occurred while loading address details");
      router.push("/admin/customer-addresses");
    }
  };

  if (loading) {
    return (
      <AdminLayout>
        <div className="text-center py-12">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading address details...</p>
        </div>
      </AdminLayout>
    );
  }

  if (!address) {
    return (
      <AdminLayout>
        <div className="text-center py-12">
          <p className="text-gray-500">Address not found</p>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="mb-6">
        <button
          onClick={() => router.back()}
          className="flex items-center gap-2 text-blue-600 hover:text-blue-800 mb-4"
        >
          <ArrowLeft className="w-4 h-4" />
          Back
        </button>
        <h1 className="text-3xl font-bold">Address Details</h1>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Address Information Card */}
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <div className="flex items-center gap-2 mb-4">
            <MapPin className="w-5 h-5 text-blue-600" />
            <h2 className="text-xl font-bold">Address Information</h2>
          </div>

          <div className="space-y-4">
            <div>
              <label className="text-sm text-gray-600">Label</label>
              <p className="text-lg font-semibold">{address.address_label || "—"}</p>
            </div>

            <div>
              <label className="text-sm text-gray-600">Address Line 1</label>
              <p className="text-lg font-semibold">{address.address_line_1}</p>
            </div>

            {address.address_line_2 && (
              <div>
                <label className="text-sm text-gray-600">Address Line 2</label>
                <p className="text-lg font-semibold">{address.address_line_2}</p>
              </div>
            )}

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="text-sm text-gray-600">Area</label>
                <p className="text-lg font-semibold">{address.area}</p>
              </div>
              <div>
                <label className="text-sm text-gray-600">Postal Code</label>
                <p className="text-lg font-semibold">{address.postal_code}</p>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="text-sm text-gray-600">City</label>
                <p className="text-lg font-semibold">{address.city}</p>
              </div>
              <div>
                <label className="text-sm text-gray-600">District</label>
                <p className="text-lg font-semibold">{address.district}</p>
              </div>
            </div>

            <div>
              <label className="text-sm text-gray-600">Country</label>
              <p className="text-lg font-semibold">{address.country}</p>
            </div>
          </div>
        </div>

        {/* Recipient & Contact Card */}
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <div className="flex items-center gap-2 mb-4">
            <User className="w-5 h-5 text-green-600" />
            <h2 className="text-xl font-bold">Recipient Information</h2>
          </div>

          <div className="space-y-4">
            <div>
              <label className="text-sm text-gray-600">Recipient Name</label>
              <p className="text-lg font-semibold">{address.recipient_name}</p>
            </div>

            <div>
              <label className="text-sm text-gray-600 flex items-center gap-1">
                <Phone className="w-4 h-4" /> Phone
              </label>
              <p className="text-lg font-semibold">{address.phone}</p>
            </div>

            <div>
              <label className="text-sm text-gray-600">User ID</label>
              <p className="text-lg font-semibold">#{address.user_id}</p>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="text-sm text-gray-600">Default Address</label>
                <span
                  className={`inline-block px-3 py-1 rounded-full text-xs font-semibold ${
                    address.is_default
                      ? "bg-blue-100 text-blue-700"
                      : "bg-gray-100 text-gray-700"
                  }`}
                >
                  {address.is_default ? "Yes" : "No"}
                </span>
              </div>

              <div>
                <label className="text-sm text-gray-600">Status</label>
                <span
                  className={`inline-block px-3 py-1 rounded-full text-xs font-semibold ${
                    address.is_active
                      ? "bg-green-100 text-green-700"
                      : "bg-red-100 text-red-700"
                  }`}
                >
                  {address.is_active ? "Active" : "Inactive"}
                </span>
              </div>
            </div>

            {address.created_at && (
              <div>
                <label className="text-sm text-gray-600">Created At</label>
                <p className="text-sm">
                  {new Date(address.created_at).toLocaleString()}
                </p>
              </div>
            )}

            {address.updated_at && (
              <div>
                <label className="text-sm text-gray-600">Updated At</label>
                <p className="text-sm">
                  {new Date(address.updated_at).toLocaleString()}
                </p>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Action Buttons */}
      <div className="mt-6 flex gap-4">
        <button
          onClick={() => router.push(`/admin/customer-addresses/edit/${address.id}`)}
          className="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600"
        >
          Edit Address
        </button>
        <button
          onClick={() => router.push("/admin/customer-addresses")}
          className="bg-gray-300 text-gray-700 px-6 py-2 rounded-lg hover:bg-gray-400"
        >
          Back to List
        </button>
      </div>
    </AdminLayout>
  );
}
