"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable, { Column } from "../components/ResponsiveTable";

interface DeliveryZone {
  id: number;
  zone_name: string;
  description?: string | null;
  area_code?: string | null;
  districts?: string[] | null;
  standard_delivery_charge: number;
  express_delivery_charge?: number | null;
  standard_delivery_days: number;
  express_delivery_days?: number | null;
  free_delivery_min_amount?: number | null;
  is_active: boolean;
  priority: number;
  created_at?: string;
  updated_at?: string;
}

export default function DeliveryZonesPage() {
  const [zones, setZones] = useState<DeliveryZone[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchZones = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/delivery-zones`, {
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
        setZones(result.data);
      } else if (result.data && Array.isArray(result.data)) {
        setZones(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching delivery zones:", error);
    }
  };

  useEffect(() => {
    fetchZones();
  }, []);

  const filteredZones = useMemo(() => {
    const term = search.toLowerCase();
    if (!term) {
      return zones;
    }

    return zones.filter((zone) => {
      return (
        zone.zone_name.toLowerCase().includes(term) ||
        (zone.description || "").toLowerCase().includes(term) ||
        (zone.area_code || "").toLowerCase().includes(term)
      );
    });
  }, [zones, search]);

  const handleDelete = async (id: number) => {
    if (confirm("Are you sure you want to delete this delivery zone?")) {
      try {
        const res = await fetch(`${apiUrl}/delivery-zones/${id}`, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${adminToken()}`,
          },
        });

        if (res.ok) {
          setZones(zones.filter((zone) => zone.id !== id));
          alert("Delivery zone deleted successfully");
        } else {
          alert("Failed to delete delivery zone");
        }
      } catch (error) {
        console.error("Error deleting delivery zone:", error);
        alert("Error deleting delivery zone");
      }
    }
  };

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Delivery Zones" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <h1 className="text-2xl font-bold">Delivery Zones</h1>

          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search zones by name, description, or code..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 p-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <Link
              href="/admin/delivery-zones/create"
              className="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 font-semibold text-sm text-center min-h-10 flex items-center justify-center"
            >
              + Add Zone
            </Link>
          </div>
        </div>

      {loader ? (
        <div className="text-center py-6 text-gray-500">Loading...</div>
      ) : filteredZones.length > 0 ? (
        <ResponsiveTable<DeliveryZone>
          columns={[
            {
              key: "zone_name",
              label: "Zone Name",
            },
            {
              key: "description",
              label: "Description",
              render: (description: string | null | undefined) => description || "—",
              mobileHide: true,
            },
            {
              key: "standard_delivery_charge",
              label: "Std. Charge",
              render: (charge: number) => `৳${charge}`,
            },
            {
              key: "express_delivery_charge",
              label: "Express Charge",
              render: (charge: number | null | undefined) => charge ? `৳${charge}` : "—",
              mobileHide: true,
            },
            {
              key: "free_delivery_min_amount",
              label: "Free Min",
              render: (amount: number | null | undefined) => amount ? `৳${amount}` : "—",
              mobileHide: true,
            },
            {
              key: "priority",
              label: "Priority",
              mobileHide: false,
            },
            {
              key: "is_active",
              label: "Status",
              render: (isActive: boolean) => (
                <span
                  className={`px-3 py-1 rounded-full text-xs font-semibold ${
                    isActive
                      ? "bg-green-100 text-green-700"
                      : "bg-red-100 text-red-700"
                  }`}
                >
                  {isActive ? "Active" : "Inactive"}
                </span>
              ),
            },
            {
              key: "id",
              label: "Actions",
              render: (id: number) => (
                <div className="flex gap-2 justify-end flex-wrap">
                  <Link
                    href={`/admin/delivery-zones/edit/${id}`}
                    className="text-yellow-600 hover:text-yellow-800 p-2 rounded hover:bg-yellow-50 inline-block"
                    title="Edit"
                  >
                    ✏️
                  </Link>
                  <button
                    onClick={() => handleDelete(id)}
                    className="text-red-600 hover:text-red-800 p-2 rounded hover:bg-red-50"
                    title="Delete"
                  >
                    🗑
                  </button>
                </div>
              ),
            },
          ]}
          data={filteredZones}
          keyField="id"
          loading={loader}
        />
      ) : (
        <div className="text-center py-6 text-gray-500">
          No delivery zones found
        </div>
      )}
      </div>
    </AdminLayout>
  );
}
