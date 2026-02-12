"use client";

import React from "react";

export interface Column<T = any> {
  key: string;
  label: string;
  render?: (value: any, row: T) => React.ReactNode;
  className?: string;
  mobileHide?: boolean;
}

interface ResponsiveTableProps<T = any> {
  columns: Column<T>[];
  data: T[];
  loading?: boolean;
  keyField?: string;
  emptyMessage?: string;
}

export default function ResponsiveTable<T = any>({
  columns,
  data,
  loading,
  keyField = "id",
  emptyMessage = "No data found.",
}: ResponsiveTableProps<T>) {
  if (loading) {
    return <div className="text-center py-6 text-gray-500">Loading...</div>;
  }

  if (data.length === 0) {
    return <div className="text-center py-6 text-gray-500">{emptyMessage}</div>;
  }

  return (
    <>
      {/* Desktop Table */}
      <div className="hidden md:block overflow-x-auto bg-white shadow rounded-lg">
        <table className="w-full text-sm text-left border-collapse">
          <thead className="bg-gray-100 text-gray-700">
            <tr>
              {columns.map((col) => (
                <th key={col.key} className="p-3 border-b font-semibold">
                  {col.label}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {data.map((row, idx) => (
              <tr key={idx} className="hover:bg-gray-50 transition-colors">
                {columns.map((col) => (
                  <td key={col.key} className={`p-3 border-b ${col.className || ""}`}>
                    {col.render ? col.render((row as any)[col.key], row) : (row as any)[col.key]}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Mobile Card View */}
      <div className="md:hidden space-y-4">
        {data.map((row, idx) => (
          <div key={idx} className="bg-white rounded-lg shadow p-4 border border-gray-200">
            <div className="space-y-3">
              {columns.map((col) => {
                if (col.mobileHide) return null;
                return (
                  <div key={col.key} className="flex justify-between items-start gap-2">
                    <span className="font-semibold text-gray-700 text-sm">
                      {col.label}:
                    </span>
                    <span className={`text-right text-sm ${col.className || ""}`}>
                      {col.render ? col.render((row as any)[col.key], row) : (row as any)[col.key]}
                    </span>
                  </div>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </>
  );
}
