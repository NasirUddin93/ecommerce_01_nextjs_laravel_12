// "use client";

// import { useEffect, useState } from "react";
// import Image from "next/image";
// import { useRouter } from "next/navigation";




// export default function DashboardPage() {
//   const [sidebarOpen, setSidebarOpen] = useState(false);
//     const router = useRouter();
//   const [user, setUser] = useState<any>(null);

//     useEffect(() => {
//     const token = localStorage.getItem("adminToken");
//     const userData = localStorage.getItem("adminUser");

//     if (!token) {
//       router.push("/admin/login");
//     } else {
//       setUser(userData ? JSON.parse(userData) : null);
//     }
//   }, [router]);

//   return (
//     <div className="min-h-screen flex bg-gray-100">
//       {/* Sidebar */}
//       <aside
//         className={`fixed inset-y-0 left-0 transform ${
//           sidebarOpen ? "translate-x-0" : "-translate-x-full"
//         } w-64 bg-white shadow-md transition-transform duration-200 ease-in-out lg:relative lg:translate-x-0`}
//       >
//         <div className="p-4 text-2xl font-bold border-b">Admin</div>
//         <nav className="p-4 space-y-2">
//           <a href="/dashboard" className="block p-2 rounded hover:bg-gray-200">
//             Dashboard
//           </a>
//           <a href="/admin/brands" className="block p-2 rounded hover:bg-gray-200">
//             Brands
//           </a>
//           <a href="/admin/products" className="block p-2 rounded hover:bg-gray-200">
//             Products
//           </a>
//           <a href="/admin/orders" className="block p-2 rounded hover:bg-gray-200">
//             Orders
//           </a>
//           <a href="/admin/users" className="block p-2 rounded hover:bg-gray-200">
//             Users
//           </a>
//           <a href="/admin/reports" className="block p-2 rounded hover:bg-gray-200">
//             Reports
//           </a>
//           <button
//             onClick={() => {
//               localStorage.removeItem("adminToken");
//               localStorage.removeItem("adminUser");
//               router.push("/admin/login");
//             }}
//             className="mt-6 w-full bg-red-600 text-white py-2 rounded-md hover:bg-red-700"
//           >
//           Logout
//         </button>
//         </nav>
//       </aside>

//       {/* Main content */}
//       <div className="flex-1 flex flex-col">
//         {/* Topbar */}
//         <header className="flex justify-between items-center bg-white p-4 shadow">
//           <div className="flex items-center space-x-2">
//             {/* Mobile menu button */}
//             <button
//               className="lg:hidden p-2 rounded-md hover:bg-gray-200"
//               onClick={() => setSidebarOpen(!sidebarOpen)}
//             >
//               <svg
//                 className="h-6 w-6 text-gray-700"
//                 fill="none"
//                 stroke="currentColor"
//                 viewBox="0 0 24 24"
//               >
//                 <path
//                   strokeLinecap="round"
//                   strokeLinejoin="round"
//                   strokeWidth="2"
//                   d="M4 6h16M4 12h16M4 18h16"
//                 />
//               </svg>
//             </button>
//             <h1 className="text-xl font-semibold">Dashboard</h1>
//           </div>
//           <div className="flex items-center space-x-4">
//             <span className="hidden sm:block text-gray-600">Admin User</span>
//             <Image
//               src={"/profile.jpg"}
//               alt="profile"
//               width={40}
//               height={40}
//               className="w-10 h-10 rounded-full"
//             />
//           </div>
//         </header>

//         {/* Content */}
//         <main className="p-4 sm:p-6">
//           {/* Cards */}
//           <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
//             <div className="bg-white p-6 rounded-xl shadow">
//               <h2 className="text-lg font-semibold">Total Products</h2>
//               <p className="text-2xl font-bold mt-2">120</p>
//             </div>
//             <div className="bg-white p-6 rounded-xl shadow">
//               <h2 className="text-lg font-semibold">Total Orders</h2>
//               <p className="text-2xl font-bold mt-2">350</p>
//             </div>
//             <div className="bg-white p-6 rounded-xl shadow">
//               <h2 className="text-lg font-semibold">Revenue</h2>
//               <p className="text-2xl font-bold mt-2">$12,400</p>
//             </div>
//           </div>

//           {/* Table */}
//           <div className="bg-white mt-6 p-4 sm:p-6 rounded-xl shadow overflow-x-auto">
//             <h2 className="text-lg font-semibold mb-4">Recent Orders</h2>
//             <table className="w-full text-left border-collapse text-sm sm:text-base">
//               <thead>
//                 <tr>
//                   <th className="border-b p-2">Order ID</th>
//                   <th className="border-b p-2">Customer</th>
//                   <th className="border-b p-2">Amount</th>
//                   <th className="border-b p-2">Status</th>
//                 </tr>
//               </thead>
//               <tbody>
//                 <tr>
//                   <td className="border-b p-2">#1001</td>
//                   <td className="border-b p-2">John Doe</td>
//                   <td className="border-b p-2">$250</td>
//                   <td className="border-b p-2 text-green-600">Completed</td>
//                 </tr>
//                 <tr>
//                   <td className="border-b p-2">#1002</td>
//                   <td className="border-b p-2">Jane Smith</td>
//                   <td className="border-b p-2">$180</td>
//                   <td className="border-b p-2 text-yellow-600">Pending</td>
//                 </tr>
//               </tbody>
//             </table>
//           </div>
//         </main>
//       </div>
//     </div>
//   );
// }


"use client";

import AdminLayout from "../AdminLayout";
import { useEffect, useState, useMemo } from "react";
import Link from "next/link";
import { apiUrl, adminToken } from "../../common/http";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";
import {
  Package,
  ShoppingCart,
  DollarSign,
  Users,
  TrendingUp,
  ShoppingBag,
  PlusCircle,
  AlertTriangle,
  Star,
  Activity,
  Bell,
  Search,
  FileDown,
  ClipboardList,
  Box,
} from "lucide-react";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer,
  CartesianGrid,
} from "recharts";

interface RecentOrder {
  id: number;
  order_number: string;
  customer_name: string;
  customer_email: string;
  total_amount: number;
  status: string;
  created_at: string;
}

interface SalesTrendPoint {
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

interface LowStockItem {
  id: number;
  name: string;
  sku: string;
  stock_quantity: number;
}

interface BusinessSummaryBlock {
  current: number;
  previous: number;
  change: number;
}

interface CustomerSatisfaction {
  average_rating: number;
  total_reviews: number;
}

interface InventoryStatus {
  total: number;
  in_stock: number;
  out_of_stock: number;
  low_stock: number;
}

interface ActivityItem {
  type: string;
  message: string;
  created_at: string;
}

interface NotificationItem {
  id: number;
  message: string;
  status: string;
  created_at: string;
}

interface DashboardStats {
  total_products: number;
  total_orders: number;
  total_revenue: number;
  total_users: number;
  growth_rate: number;
  active_sales: number;
  pending_orders: number;
  recent_orders: RecentOrder[];
  sales_trend: SalesTrendPoint[];
  top_products: TopProduct[];
  low_stock: {
    threshold: number;
    count: number;
    items: LowStockItem[];
  };
  business_summary: {
    orders: BusinessSummaryBlock;
    revenue: BusinessSummaryBlock;
    users: BusinessSummaryBlock;
  };
  customer_satisfaction: CustomerSatisfaction;
  inventory_status: InventoryStatus;
  recent_activities: ActivityItem[];
  notifications: NotificationItem[];
}

interface SearchResultItem {
  id: number;
  name?: string;
  sku?: string;
  customer_name?: string;
  customer_email?: string;
  total_amount?: number;
  status?: string;
  email?: string;
  role?: string;
  stock_quantity?: number;
}

interface SearchResults {
  products: SearchResultItem[];
  orders: SearchResultItem[];
  users: SearchResultItem[];
}

export default function DashboardPage() {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [searchResults, setSearchResults] = useState<SearchResults>({
    products: [],
    orders: [],
    users: [],
  });
  const [searchLoading, setSearchLoading] = useState(false);

  useEffect(() => {
    fetchDashboardStats();
  }, []);

  useEffect(() => {
    const handler = setTimeout(() => {
      if (searchQuery.trim().length >= 2) {
        fetchSearchResults(searchQuery.trim());
      } else {
        setSearchResults({ products: [], orders: [], users: [] });
      }
    }, 400);

    return () => clearTimeout(handler);
  }, [searchQuery]);

  const fetchDashboardStats = async () => {
    try {
      setLoading(true);
      const res = await fetch(`${apiUrl}/dashboard/statistics`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
          Accept: "application/json",
        },
      });
      const result = await res.json();
      if (result.status === 200) {
        setStats(result.data);
      }
    } catch (error) {
      console.error("Error fetching dashboard stats:", error);
    } finally {
      setLoading(false);
    }
  };

  const fetchSearchResults = async (query: string) => {
    try {
      setSearchLoading(true);
      const res = await fetch(`${apiUrl}/dashboard/search?q=${encodeURIComponent(query)}`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
          Accept: "application/json",
        },
      });
      const result = await res.json();
      if (result.status === 200) {
        setSearchResults(result.data);
      }
    } catch (error) {
      console.error("Error fetching search results:", error);
    } finally {
      setSearchLoading(false);
    }
  };

  const handleExport = async (format: "csv" | "pdf") => {
    try {
      const res = await fetch(`${apiUrl}/dashboard/reports/export?format=${format}`, {
        headers: {
          Authorization: `Bearer ${adminToken()}`,
          Accept: format === "pdf" ? "application/pdf" : "text/csv",
        },
      });

      if (!res.ok) {
        console.error("Export failed", await res.text());
        return;
      }

      const blob = await res.blob();
      const url = window.URL.createObjectURL(blob);
      const link = document.createElement("a");
      link.href = url;
      link.download = `reports.${format}`;
      document.body.appendChild(link);
      link.click();
      link.remove();
      window.URL.revokeObjectURL(url);
    } catch (error) {
      console.error("Error exporting reports:", error);
    }
  };

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

  const getTrendClass = (value: number) => {
    return value >= 0 ? "text-green-600" : "text-red-600";
  };

  if (loading) {
    return (
      <AdminLayout>
        <div className="flex items-center justify-center min-h-screen">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
            <p className="mt-4 text-gray-600">Loading dashboard...</p>
          </div>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-800">Dashboard Overview</h1>
        <p className="text-gray-600 mt-1">Welcome to your admin dashboard</p>
      </div>

      {/* Quick Actions & Search */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <PlusCircle className="w-5 h-5 text-blue-600" />
            <h2 className="text-lg font-bold">Quick Actions</h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <Link
              href="/admin/products/create"
              className="flex items-center justify-center gap-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
            >
              <Package className="w-4 h-4" />
              New Product
            </Link>
            <Link
              href="/admin/orders/create"
              className="flex items-center justify-center gap-2 px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600"
            >
              <ShoppingCart className="w-4 h-4" />
              New Order
            </Link>
            <Link
              href="/admin/users/create"
              className="flex items-center justify-center gap-2 px-4 py-2 bg-purple-500 text-white rounded-lg hover:bg-purple-600"
            >
              <Users className="w-4 h-4" />
              New User
            </Link>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 lg:col-span-2">
          <div className="flex items-center gap-2 mb-4">
            <Search className="w-5 h-5 text-gray-600" />
            <h2 className="text-lg font-bold">Quick Search</h2>
          </div>
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Search products, orders, or users..."
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />

          {(searchQuery.trim().length >= 2 || searchLoading) && (
            <div className="mt-4 grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <h3 className="text-sm font-semibold text-gray-700 mb-2">Products</h3>
                {searchLoading ? (
                  <p className="text-xs text-gray-500">Searching...</p>
                ) : searchResults.products.length > 0 ? (
                  <ul className="space-y-2">
                    {searchResults.products.map((item) => (
                      <li key={`p-${item.id}`} className="text-sm text-gray-700">
                        <span className="font-medium">{item.name}</span>
                        <span className="text-xs text-gray-500 ml-2">SKU: {item.sku}</span>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-xs text-gray-500">No results</p>
                )}
              </div>

              <div>
                <h3 className="text-sm font-semibold text-gray-700 mb-2">Orders</h3>
                {searchLoading ? (
                  <p className="text-xs text-gray-500">Searching...</p>
                ) : searchResults.orders.length > 0 ? (
                  <ul className="space-y-2">
                    {searchResults.orders.map((item) => (
                      <li key={`o-${item.id}`} className="text-sm text-gray-700">
                        <span className="font-medium">#{item.id}</span>
                        <span className="text-xs text-gray-500 ml-2">{item.customer_name}</span>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-xs text-gray-500">No results</p>
                )}
              </div>

              <div>
                <h3 className="text-sm font-semibold text-gray-700 mb-2">Users</h3>
                {searchLoading ? (
                  <p className="text-xs text-gray-500">Searching...</p>
                ) : searchResults.users.length > 0 ? (
                  <ul className="space-y-2">
                    {searchResults.users.map((item) => (
                      <li key={`u-${item.id}`} className="text-sm text-gray-700">
                        <span className="font-medium">{item.name}</span>
                        <span className="text-xs text-gray-500 ml-2">{item.email}</span>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-xs text-gray-500">No results</p>
                )}
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Total Products</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats?.total_products || 0}</p>
            </div>
            <div className="bg-blue-500 p-3 rounded-lg">
              <Package className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Total Orders</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats?.total_orders || 0}</p>
            </div>
            <div className="bg-green-500 p-3 rounded-lg">
              <ShoppingCart className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Revenue</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                ৳{stats?.total_revenue?.toLocaleString() || 0}
              </p>
            </div>
            <div className="bg-purple-500 p-3 rounded-lg">
              <DollarSign className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Total Users</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats?.total_users || 0}</p>
            </div>
            <div className="bg-orange-500 p-3 rounded-lg">
              <Users className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Growth Rate</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">
                {stats?.growth_rate ? `${stats.growth_rate > 0 ? '+' : ''}${stats.growth_rate}%` : '0%'}
              </p>
            </div>
            <div className="bg-teal-500 p-3 rounded-lg">
              <TrendingUp className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-shadow">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600 font-medium">Active Sales</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats?.active_sales || 0}</p>
            </div>
            <div className="bg-pink-500 p-3 rounded-lg">
              <ShoppingBag className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>
      </div>

      {/* Business Summary */}
      <div className="mt-8 grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <TrendingUp className="w-5 h-5 text-teal-600" />
            <h2 className="text-lg font-bold">Business Summary</h2>
          </div>
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-gray-600">Orders (30d)</p>
                <p className="text-lg font-semibold">{stats?.business_summary.orders.current || 0}</p>
              </div>
              <span className={`text-sm font-semibold ${getTrendClass(stats?.business_summary.orders.change || 0)}`}>
                {(stats?.business_summary.orders.change ?? 0) >= 0 ? "↑" : "↓"}{Math.abs(stats?.business_summary.orders.change || 0)}%
              </span>
            </div>
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-gray-600">Revenue (30d)</p>
                <p className="text-lg font-semibold">৳{stats?.business_summary.revenue.current?.toLocaleString() || 0}</p>
              </div>
              <span className={`text-sm font-semibold ${getTrendClass(stats?.business_summary.revenue.change || 0)}`}>
                {(stats?.business_summary.revenue.change ?? 0) >= 0 ? "↑" : "↓"}{Math.abs(stats?.business_summary.revenue.change || 0)}%
              </span>
            </div>
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-gray-600">New Users (30d)</p>
                <p className="text-lg font-semibold">{stats?.business_summary.users.current || 0}</p>
              </div>
              <span className={`text-sm font-semibold ${getTrendClass(stats?.business_summary.users.change || 0)}`}>
                {(stats?.business_summary.users.change ?? 0) >= 0 ? "↑" : "↓"}{Math.abs(stats?.business_summary.users.change || 0)}%
              </span>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200 lg:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-2">
              <ClipboardList className="w-5 h-5 text-blue-600" />
              <h2 className="text-lg font-bold">Sales Trend (Last 14 Days)</h2>
            </div>
            <div className="flex gap-2">
              <button
                onClick={() => handleExport("csv")}
                className="flex items-center gap-1 px-3 py-1 text-sm bg-gray-100 rounded hover:bg-gray-200"
              >
                <FileDown className="w-4 h-4" /> CSV
              </button>
              <button
                onClick={() => handleExport("pdf")}
                className="flex items-center gap-1 px-3 py-1 text-sm bg-gray-100 rounded hover:bg-gray-200"
              >
                <FileDown className="w-4 h-4" /> PDF
              </button>
            </div>
          </div>
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={stats?.sales_trend || []}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="date" />
                <YAxis />
                <Tooltip />
                <Line type="monotone" dataKey="total_sales" stroke="#2563eb" strokeWidth={2} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>

      {/* Insights & Alerts */}
      <div className="mt-8 grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <Package className="w-5 h-5 text-green-600" />
            <h2 className="text-lg font-bold">Top Selling Products</h2>
          </div>
          <div className="space-y-3">
            {stats?.top_products?.length ? (
              stats.top_products.map((product) => (
                <div key={product.id} className="flex items-center justify-between">
                  <div>
                    <p className="text-sm font-semibold text-gray-800">{product.name}</p>
                    <p className="text-xs text-gray-500">Sold: {product.total_sold}</p>
                  </div>
                  <p className="text-sm font-semibold">৳{product.total_revenue.toLocaleString()}</p>
                </div>
              ))
            ) : (
              <p className="text-sm text-gray-500">No sales data yet.</p>
            )}
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <AlertTriangle className="w-5 h-5 text-orange-600" />
            <h2 className="text-lg font-bold">Low Stock Alerts</h2>
          </div>
          <div className="space-y-3">
            {stats?.low_stock?.items?.length ? (
              stats.low_stock.items.map((item) => (
                <div key={item.id} className="flex items-center justify-between">
                  <div>
                    <p className="text-sm font-semibold text-gray-800">{item.name}</p>
                    <p className="text-xs text-gray-500">SKU: {item.sku}</p>
                  </div>
                  <span className="text-sm font-semibold text-red-600">{item.stock_quantity}</span>
                </div>
              ))
            ) : (
              <p className="text-sm text-gray-500">All good. No low stock items.</p>
            )}
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <ShoppingCart className="w-5 h-5 text-yellow-600" />
            <h2 className="text-lg font-bold">Pending Orders</h2>
          </div>
          <div className="flex items-center justify-between">
            <p className="text-3xl font-bold text-gray-900">{stats?.pending_orders || 0}</p>
            <span className="text-sm text-gray-500">Awaiting action</span>
          </div>
        </div>
      </div>

      {/* Customer Satisfaction & Inventory */}
      <div className="mt-8 grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <Star className="w-5 h-5 text-yellow-500" />
            <h2 className="text-lg font-bold">Customer Satisfaction</h2>
          </div>
          <div className="flex items-center gap-4">
            <div className="text-4xl font-bold text-gray-900">
              {stats?.customer_satisfaction?.average_rating?.toFixed(2) || "0.00"}
            </div>
            <div>
              <p className="text-sm text-gray-600">Average Rating</p>
              <p className="text-sm text-gray-500">{stats?.customer_satisfaction?.total_reviews || 0} reviews</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <Box className="w-5 h-5 text-indigo-600" />
            <h2 className="text-lg font-bold">Inventory Status</h2>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <p className="text-sm text-gray-600">Total Products</p>
              <p className="text-lg font-semibold">{stats?.inventory_status?.total || 0}</p>
            </div>
            <div>
              <p className="text-sm text-gray-600">In Stock</p>
              <p className="text-lg font-semibold text-green-600">{stats?.inventory_status?.in_stock || 0}</p>
            </div>
            <div>
              <p className="text-sm text-gray-600">Low Stock</p>
              <p className="text-lg font-semibold text-orange-600">{stats?.inventory_status?.low_stock || 0}</p>
            </div>
            <div>
              <p className="text-sm text-gray-600">Out of Stock</p>
              <p className="text-lg font-semibold text-red-600">{stats?.inventory_status?.out_of_stock || 0}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Activities & Notifications */}
      <div className="mt-8 grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <Activity className="w-5 h-5 text-green-600" />
            <h2 className="text-lg font-bold">Recent Activities</h2>
          </div>
          <div className="space-y-3">
            {stats?.recent_activities?.length ? (
              stats.recent_activities.map((activity, index) => (
                <div key={`${activity.type}-${index}`} className="text-sm text-gray-700">
                  <p className="font-medium">{activity.message}</p>
                  <p className="text-xs text-gray-500">{activity.created_at}</p>
                </div>
              ))
            ) : (
              <p className="text-sm text-gray-500">No recent activities.</p>
            )}
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center gap-2 mb-4">
            <Bell className="w-5 h-5 text-blue-600" />
            <h2 className="text-lg font-bold">Notifications</h2>
          </div>
          <div className="space-y-3">
            {stats?.notifications?.length ? (
              stats.notifications.map((notification) => (
                <div key={notification.id} className="text-sm text-gray-700">
                  <p className="font-medium">{notification.message}</p>
                  <p className="text-xs text-gray-500">{notification.created_at}</p>
                </div>
              ))
            ) : (
              <p className="text-sm text-gray-500">No notifications.</p>
            )}
          </div>
        </div>
      </div>

      {/* Recent Orders */}
      <div className="mt-8 bg-white rounded-lg shadow-sm border border-gray-200 p-6">
        <h2 className="text-lg font-bold text-gray-800 mb-4">Recent Orders</h2>
        {stats?.recent_orders && stats.recent_orders.length > 0 ? (
          <ResponsiveTable<RecentOrder>
            data={stats.recent_orders}
            keyField="id"
            columns={[
              { key: "order_number", label: "Order ID", render: (num) => (
                <span className="font-medium">{num}</span>
              )},
              { key: "customer_name", label: "Customer" },
              { key: "total_amount", label: "Amount", render: (amount) => (
                <span className="font-semibold">৳{amount.toLocaleString()}</span>
              )},
              { key: "status", label: "Status", render: (status) => (
                <span className={`px-3 py-1 ${getStatusColor(status)} rounded-full text-xs font-semibold capitalize`}>
                  {status}
                </span>
              )},
              { key: "created_at", label: "Date", mobileHide: true, render: (date) => (
                new Date(date).toLocaleDateString()
              )},
            ]}
          />
        ) : (
          <div className="p-6 text-center text-gray-500">
            No recent orders
          </div>
        )}
      </div>
    </AdminLayout>
  );
}
