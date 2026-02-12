"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import { BarChart3, TrendingUp, Package, CreditCard } from "lucide-react";

interface SalesTrend {
  date: string;
  orders_count: number;
  total_sales: number;
}

interface TopProduct {
  id: number;
  name: string;
  total_sold: number;
  total_revenue: number;
}

interface RevenueByMethod {
  payment_method: string;
  count: number;
  total: number;
}

interface OrdersByStatus {
  status: string;
  count: number;
}

interface ReportsData {
  sales_trend: SalesTrend[];
  top_products: TopProduct[];
  revenue_by_method: RevenueByMethod[];
  orders_by_status: OrdersByStatus[];
  date_range: {
    start: string;
    end: string;
  };
}

export default function ReportsPage() {
  const [reportsData, setReportsData] = useState<ReportsData | null>(null);
  const [loader, setLoader] = useState(false);
  const [startDate, setStartDate] = useState(
    new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split("T")[0]
  );
  const [endDate, setEndDate] = useState(new Date().toISOString().split("T")[0]);

  const fetchReports = async () => {
    try {
      setLoader(true);
      const res = await fetch(
        `${apiUrl}/dashboard/reports?start_date=${startDate}&end_date=${endDate}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${adminToken()}`,
          },
        }
      );

      const result = await res.json();
      setLoader(false);

      if (result.status === 200) {
        setReportsData(result.data);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching reports:", error);
    }
  };

  useEffect(() => {
    fetchReports();
  }, []);

  const getStatusColor = (status: string) => {
    const colors: Record<string, string> = {
      pending: "bg-yellow-100 text-yellow-700",
      paid: "bg-blue-100 text-blue-700",
      shipped: "bg-purple-100 text-purple-700",
      delivered: "bg-green-100 text-green-700",
      cancelled: "bg-red-100 text-red-700",
      refunded: "bg-orange-100 text-orange-700",
    };
    return colors[status] || "bg-gray-100 text-gray-700";
  };

  return (
    <AdminLayout>
      <div className="mb-6">
        <h1 className="text-3xl font-bold">Sales Reports & Analytics</h1>
        <p className="text-gray-600 mt-1">Comprehensive business insights and trends</p>
      </div>

      {/* Date Range Filter */}
      <div className="mb-6 flex gap-4 items-end bg-white p-4 rounded-lg shadow-sm">
        <div className="flex-1">
          <label className="block text-sm font-medium mb-1">Start Date</label>
          <input
            type="date"
            value={startDate}
            onChange={(e) => setStartDate(e.target.value)}
            className="w-full p-2 border border-gray-300 rounded-lg"
          />
        </div>
        <div className="flex-1">
          <label className="block text-sm font-medium mb-1">End Date</label>
          <input
            type="date"
            value={endDate}
            onChange={(e) => setEndDate(e.target.value)}
            className="w-full p-2 border border-gray-300 rounded-lg"
          />
        </div>
        <button
          onClick={fetchReports}
          className="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600"
        >
          Apply Filter
        </button>
      </div>

      {loader ? (
        <div className="text-center py-12">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading reports...</p>
        </div>
      ) : reportsData ? (
        <div className="space-y-6">
          {/* Sales Trend */}
          <div className="bg-white p-6 rounded-lg shadow-sm">
            <div className="flex items-center gap-2 mb-4">
              <TrendingUp className="w-5 h-5 text-blue-600" />
              <h2 className="text-xl font-bold">Sales Trend</h2>
            </div>
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-6 py-3 text-left">Date</th>
                    <th className="px-6 py-3 text-left">Orders</th>
                    <th className="px-6 py-3 text-left">Total Sales</th>
                    <th className="px-6 py-3 text-left">Avg Order Value</th>
                  </tr>
                </thead>
                <tbody className="divide-y">
                  {reportsData.sales_trend.map((item) => {
                    const avgValue = item.orders_count > 0 ? item.total_sales / item.orders_count : 0;
                    return (
                      <tr key={item.date} className="hover:bg-gray-50">
                        <td className="px-6 py-3">{new Date(item.date).toLocaleDateString()}</td>
                        <td className="px-6 py-3 font-medium">{item.orders_count}</td>
                        <td className="px-6 py-3 font-semibold">৳{parseFloat(item.total_sales.toString()).toLocaleString()}</td>
                        <td className="px-6 py-3 text-blue-600 font-semibold">৳{parseFloat(avgValue.toString()).toLocaleString('en-US', {maximumFractionDigits: 2})}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>

          {/* Top Products */}
          <div className="bg-white p-6 rounded-lg shadow-sm">
            <div className="flex items-center gap-2 mb-4">
              <Package className="w-5 h-5 text-green-600" />
              <h2 className="text-xl font-bold">Top Selling Products</h2>
            </div>
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-6 py-3 text-left">Rank</th>
                    <th className="px-6 py-3 text-left">Product</th>
                    <th className="px-6 py-3 text-left">Units Sold</th>
                    <th className="px-6 py-3 text-left">Revenue</th>
                    <th className="px-6 py-3 text-left">Avg Price</th>
                  </tr>
                </thead>
                <tbody className="divide-y">
                  {reportsData.top_products.map((product, index) => {
                    const avgPrice = product.total_sold > 0 ? product.total_revenue / product.total_sold : 0;
                    return (
                      <tr key={product.id} className="hover:bg-gray-50">
                        <td className="px-6 py-3">
                          <span className="inline-flex items-center justify-center w-6 h-6 bg-blue-100 text-blue-700 rounded-full text-xs font-bold">
                            {index + 1}
                          </span>
                        </td>
                        <td className="px-6 py-3 font-medium">{product.name}</td>
                        <td className="px-6 py-3 font-medium">{product.total_sold}</td>
                        <td className="px-6 py-3 font-semibold">৳{parseFloat(product.total_revenue.toString()).toLocaleString()}</td>
                        <td className="px-6 py-3 text-green-600 font-semibold">৳{parseFloat(avgPrice.toString()).toLocaleString('en-US', {maximumFractionDigits: 2})}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            {/* Revenue by Payment Method */}
            <div className="bg-white p-6 rounded-lg shadow-sm">
              <div className="flex items-center gap-2 mb-4">
                <CreditCard className="w-5 h-5 text-purple-600" />
                <h2 className="text-xl font-bold">Revenue by Payment Method</h2>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left">Payment Method</th>
                      <th className="px-6 py-3 text-left">Transactions</th>
                      <th className="px-6 py-3 text-left">Total Revenue</th>
                      <th className="px-6 py-3 text-left">Avg Transaction</th>
                      <th className="px-6 py-3 text-left">% of Total</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y">
                    {reportsData.revenue_by_method.map((method) => {
                      const totalRevenue = reportsData.revenue_by_method.reduce((sum, m) => sum + m.total, 0);
                      const percentage = totalRevenue > 0 ? ((method.total / totalRevenue) * 100).toFixed(1) : '0';
                      const avgTransaction = method.count > 0 ? method.total / method.count : 0;
                      return (
                        <tr key={method.payment_method} className="hover:bg-gray-50">
                          <td className="px-6 py-3 font-medium capitalize">{method.payment_method}</td>
                          <td className="px-6 py-3">{method.count}</td>
                          <td className="px-6 py-3 font-semibold">৳{parseFloat(method.total.toString()).toLocaleString()}</td>
                          <td className="px-6 py-3 text-purple-600">৳{parseFloat(avgTransaction.toString()).toLocaleString('en-US', {maximumFractionDigits: 2})}</td>
                          <td className="px-6 py-3"><span className="bg-purple-100 text-purple-700 px-2 py-1 rounded text-xs font-semibold">{percentage}%</span></td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            </div>

            {/* Orders by Status */}
            <div className="bg-white p-6 rounded-lg shadow-sm">
              <div className="flex items-center gap-2 mb-4">
                <BarChart3 className="w-5 h-5 text-orange-600" />
                <h2 className="text-xl font-bold">Orders by Status</h2>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left">Status</th>
                      <th className="px-6 py-3 text-left">Count</th>
                      <th className="px-6 py-3 text-left">% of Total</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y">
                    {reportsData.orders_by_status.map((status) => {
                      const totalOrders = reportsData.orders_by_status.reduce((sum, s) => sum + s.count, 0);
                      const percentage = totalOrders > 0 ? ((status.count / totalOrders) * 100).toFixed(1) : '0';
                      return (
                        <tr key={status.status} className="hover:bg-gray-50">
                          <td className="px-6 py-3">
                            <span className={`px-3 py-1 ${getStatusColor(status.status)} rounded-full text-xs font-semibold capitalize`}>
                              {status.status}
                            </span>
                          </td>
                          <td className="px-6 py-3 font-bold text-lg">{status.count}</td>
                          <td className="px-6 py-3"><span className="bg-orange-100 text-orange-700 px-2 py-1 rounded text-xs font-semibold">{percentage}%</span></td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      ) : (
        <div className="text-center py-12 bg-white rounded-lg">
          <p className="text-gray-500">No data available</p>
        </div>
      )}
    </AdminLayout>
  );
}