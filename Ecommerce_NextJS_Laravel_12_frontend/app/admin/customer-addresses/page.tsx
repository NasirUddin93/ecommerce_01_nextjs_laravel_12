"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

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
}

export default function CustomerAddressesPage() {
  const [addresses, setAddresses] = useState<CustomerAddress[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchAddresses = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/customer-addresses`, {
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
        setAddresses(result.data);
      } else if (result.data && Array.isArray(result.data)) {
        setAddresses(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching customer addresses:", error);
    }
  };

  useEffect(() => {
    fetchAddresses();
  }, []);

  const filteredAddresses = useMemo(() => {
    const term = search.toLowerCase();
    if (!term) {
      return addresses;
    }

    return addresses.filter((addr) => {
      return (
        addr.recipient_name.toLowerCase().includes(term) ||
        addr.phone.includes(term) ||
        addr.address_line_1.toLowerCase().includes(term) ||
        addr.city.toLowerCase().includes(term) ||
        addr.district.toLowerCase().includes(term) ||
        (addr.address_label || "").toLowerCase().includes(term)
      );
    });
  }, [addresses, search]);

  const handleDelete = async (id: number) => {
    if (confirm("Are you sure you want to delete this address?")) {
      try {
        const res = await fetch(`${apiUrl}/customer-addresses/${id}`, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${adminToken()}`,
          },
        });

        if (res.ok) {
          setAddresses(addresses.filter((addr) => addr.id !== id));
          alert("Address deleted successfully");
        } else {
          alert("Failed to delete address");
        }
      } catch (error) {
        console.error("Error deleting address:", error);
        alert("Error deleting address");
      }
    }
  };

  return (
    <AdminLayout>
      <div className="mb-6">
        <Breadcrumb
          items={[
            { label: "Admin", href: "/admin" },
            { label: "Customer Addresses" },
          ]}
        />
      </div>

      <div className="mb-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Customer Addresses</h1>
            <p className="text-sm text-gray-600 mt-1">Manage customer delivery addresses</p>
          </div>
          <Link
            href="/admin/customer-addresses/create"
            className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 text-sm font-medium"
          >
            + Add Address
          </Link>
        </div>
      </div>

      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by recipient name, phone, city, district, or label..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {loader && (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      )}
      {!loader && filteredAddresses.length > 0 && (
        <ResponsiveTable<CustomerAddress>
          data={filteredAddresses}
          keyField="id"
          columns={[
            { key: "id", label: "#", mobileHide: true },
            { key: "recipient_name", label: "Recipient" },
            { key: "phone", label: "Phone", mobileHide: true },
            { key: "address_label", label: "Label", mobileHide: true, render: (label) => label || "—" },
            { key: "address_line_1", label: "Address", mobileHide: true, render: (addr) => (
              <span className="truncate text-xs">{addr}</span>
            )},
            { key: "city", label: "City / District", render: (city, row) => `${city} / ${row.district}` },
            { key: "is_default", label: "Default", mobileHide: true, render: (isDefault) => (
              <span
                className={`px-3 py-1 rounded-full text-xs font-semibold ${
                  isDefault
                    ? "bg-blue-100 text-blue-700"
                    : "bg-gray-100 text-gray-700"
                }`}
              >
                {isDefault ? "Yes" : "No"}
              </span>
            )},
            { key: "is_active", label: "Status", render: (isActive) => (
              <span
                className={`px-3 py-1 rounded-full text-xs font-semibold ${
                  isActive
                    ? "bg-green-100 text-green-700"
                    : "bg-red-100 text-red-700"
                }`}
              >
                {isActive ? "Active" : "Inactive"}
              </span>
            )},
            { key: "actions", label: "Actions", render: (_, row) => (
              <div className="flex gap-2 justify-center">
                <Link
                  href={`/admin/customer-addresses/view/${row.id}`}
                  className="p-2 rounded hover:bg-blue-100 text-blue-600 transition"
                  title="View"
                >
                  👁️
                </Link>
                <Link
                  href={`/admin/customer-addresses/edit/${row.id}`}
                  className="p-2 rounded hover:bg-yellow-100 text-yellow-600 transition"
                  title="Edit"
                >
                  ✏️
                </Link>
                <button
                  onClick={() => handleDelete(row.id)}
                  className="p-2 rounded hover:bg-red-100 text-red-600 transition"
                  title="Delete"
                >
                  🗑
                </button>
              </div>
            )},
          ]}
        />
      )}
      {!loader && filteredAddresses.length === 0 && (
        <div className="text-center py-8 text-gray-500">
          No customer addresses found
        </div>
      )}
    </AdminLayout>
  );
}
