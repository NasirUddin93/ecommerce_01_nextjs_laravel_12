"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Link from "next/link";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

interface BangladeshiDivision {
  id: number;
  name: string;
  code: string;
  is_active: boolean;
}

interface BangladeshiDistrict {
  id: number;
  division_id: number;
  name: string;
  code: string;
  is_active: boolean;
}

interface BangladeshiArea {
  id: number;
  district_id: number;
  name: string;
  thana_name?: string | null;
  code: string;
  delivery_charge_base?: number | null;
  is_active: boolean;
}

export default function BangladeshLocationsPage() {
  const [view, setView] = useState<"divisions" | "districts" | "areas">(
    "divisions"
  );
  const [divisions, setDivisions] = useState<BangladeshiDivision[]>([]);
  const [districts, setDistricts] = useState<BangladeshiDistrict[]>([]);
  const [areas, setAreas] = useState<BangladeshiArea[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");
  const [selectedDivision, setSelectedDivision] = useState<number | null>(null);
  const [selectedDistrict, setSelectedDistrict] = useState<number | null>(null);

  const fetchDivisions = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/bangladeshi-divisions`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
        },
      });
      const result = await res.json();
      if (result.data && Array.isArray(result.data)) {
        setDivisions(result.data);
      }
    } catch (error) {
      console.error("Error fetching divisions:", error);
    } finally {
      setLoader(false);
    }
  };

  const fetchDistricts = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/bangladeshi-districts`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
        },
      });
      const result = await res.json();
      if (result.data && Array.isArray(result.data)) {
        setDistricts(result.data);
      }
    } catch (error) {
      console.error("Error fetching districts:", error);
    } finally {
      setLoader(false);
    }
  };

  const fetchAreas = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/bangladeshi-areas`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
        },
      });
      const result = await res.json();
      if (result.data && Array.isArray(result.data)) {
        setAreas(result.data);
      }
    } catch (error) {
      console.error("Error fetching areas:", error);
    } finally {
      setLoader(false);
    }
  };

  useEffect(() => {
    if (view === "divisions") {
      fetchDivisions();
    } else if (view === "districts") {
      fetchDistricts();
    } else {
      fetchAreas();
    }
  }, [view]);

  const filteredDivisions = useMemo(() => {
    return divisions.filter((d) =>
      d.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [divisions, search]);

  const filteredDistricts = useMemo(() => {
    let filtered = districts;
    if (selectedDivision) {
      filtered = filtered.filter((d) => d.division_id === selectedDivision);
    }
    return filtered.filter((d) =>
      d.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [districts, search, selectedDivision]);

  const filteredAreas = useMemo(() => {
    let filtered = areas;
    if (selectedDistrict) {
      filtered = filtered.filter((a) => a.district_id === selectedDistrict);
    }
    return filtered.filter((a) =>
      a.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [areas, search, selectedDistrict]);

  const renderDivisions = () => (
    <>
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search divisions..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <ResponsiveTable<BangladeshiDivision>
        data={filteredDivisions}
        keyField="id"
        columns={[
          { key: "id", label: "#", mobileHide: true },
          { key: "name", label: "Name" },
          { key: "code", label: "Code", mobileHide: true },
          { key: "is_active", label: "Status", render: (isActive) => (
            <span
              className={`px-3 py-1 rounded text-xs font-semibold ${
                isActive
                  ? "bg-green-100 text-green-700"
                  : "bg-red-100 text-red-700"
              }`}
            >
              {isActive ? "Active" : "Inactive"}
            </span>
          )},
        ]}
      />
    </>
  );

  const renderDistricts = () => (
    <>
      <div className="mb-6 flex flex-col md:flex-row gap-4">
        <div className="flex-1">
          <label className="block text-sm font-medium mb-2">
            Filter by Division:
          </label>
          <select
            value={selectedDivision || ""}
            onChange={(e) =>
              setSelectedDivision(e.target.value ? Number(e.target.value) : null)
            }
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">All Divisions</option>
            {divisions.map((div) => (
              <option key={div.id} value={div.id}>
                {div.name}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1">
          <label className="block text-sm font-medium mb-2">Search:</label>
          <input
            type="text"
            placeholder="Search districts..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
      </div>
      <ResponsiveTable<BangladeshiDistrict>
        data={filteredDistricts}
        keyField="id"
        columns={[
          { key: "id", label: "#", mobileHide: true },
          { key: "name", label: "Name" },
          { key: "code", label: "Code", mobileHide: true },
          { key: "division_id", label: "Division", mobileHide: true, render: (divId) => (
            divisions.find((d) => d.id === divId)?.name || "—"
          )},
          { key: "is_active", label: "Status", render: (isActive) => (
            <span
              className={`px-3 py-1 rounded text-xs font-semibold ${
                isActive
                  ? "bg-green-100 text-green-700"
                  : "bg-red-100 text-red-700"
              }`}
            >
              {isActive ? "Active" : "Inactive"}
            </span>
          )},
        ]}
      />
    </>
  );

  const renderAreas = () => (
    <>
      <div className="mb-6 flex flex-col md:flex-row gap-4">
        <div className="flex-1">
          <label className="block text-sm font-medium mb-2">
            Filter by District:
          </label>
          <select
            value={selectedDistrict || ""}
            onChange={(e) =>
              setSelectedDistrict(e.target.value ? Number(e.target.value) : null)
            }
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">All Districts</option>
            {districts.map((dist) => (
              <option key={dist.id} value={dist.id}>
                {dist.name}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1">
          <label className="block text-sm font-medium mb-2">Search:</label>
          <input
            type="text"
            placeholder="Search areas..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
      </div>
      <ResponsiveTable<BangladeshiArea>
        data={filteredAreas}
        keyField="id"
        columns={[
          { key: "id", label: "#", mobileHide: true },
          { key: "name", label: "Name" },
          { key: "thana_name", label: "Thana", mobileHide: true, render: (name) => name || "—" },
          { key: "code", label: "Code", mobileHide: true },
          { key: "district_id", label: "District", mobileHide: true, render: (distId) => (
            districts.find((d) => d.id === distId)?.name || "—"
          )},
          { key: "delivery_charge_base", label: "Delivery Charge", render: (charge) => (
            charge ? `৳${charge}` : "—"
          )},
          { key: "is_active", label: "Status", render: (isActive) => (
            <span
              className={`px-3 py-1 rounded text-xs font-semibold ${
                isActive
                  ? "bg-green-100 text-green-700"
                  : "bg-red-100 text-red-700"
              }`}
            >
              {isActive ? "Active" : "Inactive"}
            </span>
          )},
        ]}
      />
    </>
  );

  return (
    <AdminLayout>
      <div className="mb-6">
        <Breadcrumb
          items={[
            { label: "Admin", href: "/admin" },
            { label: "Bangladesh Locations" },
          ]}
        />
      </div>

      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-800">Bangladesh Locations</h1>
        <p className="text-sm text-gray-600 mt-1">Manage divisions, districts, and delivery areas</p>
      </div>

      <div className="mb-6 flex gap-2 flex-wrap">
        <button
          onClick={() => {
            setView("divisions");
            setSearch("");
          }}
          className={`px-4 py-2 rounded-lg font-medium text-sm transition ${
            view === "divisions"
              ? "bg-blue-500 text-white"
              : "bg-gray-200 text-gray-700 hover:bg-gray-300"
          }`}
        >
          Divisions
        </button>
        <button
          onClick={() => {
            setView("districts");
            setSearch("");
            setSelectedDivision(null);
          }}
          className={`px-4 py-2 rounded-lg font-medium text-sm transition ${
            view === "districts"
              ? "bg-blue-500 text-white"
              : "bg-gray-200 text-gray-700 hover:bg-gray-300"
          }`}
        >
          Districts
        </button>
        <button
          onClick={() => {
            setView("areas");
            setSearch("");
            setSelectedDistrict(null);
          }}
          className={`px-4 py-2 rounded-lg font-medium text-sm transition ${
            view === "areas"
              ? "bg-blue-500 text-white"
              : "bg-gray-200 text-gray-700 hover:bg-gray-300"
          }`}
        >
          Areas
        </button>
      </div>

      {loader && (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      )}
      {!loader && view === "divisions" && renderDivisions()}
      {!loader && view === "districts" && renderDistricts()}
      {!loader && view === "areas" && renderAreas()}
    </AdminLayout>
  );
}
