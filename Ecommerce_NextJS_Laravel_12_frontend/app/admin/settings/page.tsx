"use client";

import { useEffect, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import { Settings, Mail, CreditCard, Truck, Globe } from "lucide-react";

interface SettingsData {
  site_name: string;
  site_email: string;
  currency: string;
  tax_rate: number;
  free_shipping_threshold: number;
  smtp_host: string;
  smtp_port: string;
  smtp_username: string;
  smtp_password: string;
  payment_gateway: string;
  payment_test_mode: boolean;
  logo_url?: string;
  favicon_url?: string;
}

export default function SettingsPage() {
  const [activeTab, setActiveTab] = useState<"general" | "email" | "payment" | "shipping">("general");
  const [loader, setLoader] = useState(false);
  const [logoPreview, setLogoPreview] = useState<string | null>(null);
  const [faviconPreview, setFaviconPreview] = useState<string | null>(null);
  const [versions, setVersions] = useState<Record<string, number>>({});
  const [formData, setFormData] = useState<SettingsData>({
    site_name: "My E-commerce Store",
    site_email: "admin@example.com",
    currency: "BDT",
    tax_rate: 0,
    free_shipping_threshold: 1000,
    smtp_host: "smtp.gmail.com",
    smtp_port: "587",
    smtp_username: "",
    smtp_password: "",
    payment_gateway: "stripe",
    payment_test_mode: true,
    logo_url: "",
    favicon_url: "",
  });

  useEffect(() => {
    fetchSettings();
  }, []);

  const fetchSettings = async () => {
    try {
      const res = await fetch(`${apiUrl}/settings`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();

      if (result.status === 200 && result.data) {
        setFormData(result.data);
        // Store version numbers for conflict detection
        if (result.versions) {
          setVersions(result.versions);
        }
      }
    } catch (error) {
      console.error("Error fetching settings:", error);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    setFormData({
      ...formData,
      [name]: type === "checkbox" ? (e.target as HTMLInputElement).checked : type === "number" ? parseFloat(value) : value,
    });
  };

  const handleLogoUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        const result = reader.result as string;
        setLogoPreview(result);
        setFormData({
          ...formData,
          logo_url: result,
        });
      };
      reader.readAsDataURL(file);
    }
  };

  const handleFaviconUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        const result = reader.result as string;
        setFaviconPreview(result);
        setFormData({
          ...formData,
          favicon_url: result,
        });
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoader(true);

    try {
      // Prepare data to send with version numbers for conflict detection
      const dataToSend: any = {
        site_name: formData.site_name,
        site_email: formData.site_email,
        currency: formData.currency,
        tax_rate: formData.tax_rate,
        free_shipping_threshold: formData.free_shipping_threshold,
        smtp_host: formData.smtp_host,
        smtp_port: formData.smtp_port,
        smtp_username: formData.smtp_username,
        smtp_password: formData.smtp_password,
        payment_gateway: formData.payment_gateway,
        payment_test_mode: formData.payment_test_mode,
      };
      
      // Add version numbers for conflict detection
      Object.keys(dataToSend).forEach(key => {
        if (versions[key]) {
          dataToSend[`version_${key}`] = versions[key];
        }
      });
      
      // Only add images if they are base64 and exist
      if (logoPreview && logoPreview.startsWith('data:')) {
        dataToSend.logo_url = logoPreview;
      }
      
      if (faviconPreview && faviconPreview.startsWith('data:')) {
        dataToSend.favicon_url = faviconPreview;
      }

      const res = await fetch(`${apiUrl}/settings`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
        body: JSON.stringify(dataToSend),
      });

      const result = await res.json();
      setLoader(false);

      if (result.status === 200) {
        alert("✅ Settings saved successfully!");
        setLogoPreview(null);
        setFaviconPreview(null);
        
        // Update versions from response
        if (result.versions) {
          setVersions(result.versions);
        }
        
        // Refresh settings to get latest data
        fetchSettings();
      } else if (result.status === 409) {
        // Conflict detected
        alert(`⚠️ Conflict Detected!\n\n${result.message}\n\nThe page will reload to show the latest data.`);
        fetchSettings(); // Reload fresh data
      } else {
        // Show detailed validation errors
        let errorMsg = result.message || "Failed to save settings";
        if (result.errors) {
          const errorDetails = Object.entries(result.errors)
            .map(([key, value]: any) => `${key}: ${Array.isArray(value) ? value.join(', ') : value}`)
            .join('\n');
          errorMsg += "\n\n" + errorDetails;
          console.error("Validation errors:", result.errors);
        }
        alert(errorMsg);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error saving settings:", error);
      alert("An error occurred while saving settings: " + String(error));
    }
  };

  const tabs = [
    { id: "general" as const, label: "General", icon: Globe },
    { id: "email" as const, label: "Email", icon: Mail },
    { id: "payment" as const, label: "Payment", icon: CreditCard },
    { id: "shipping" as const, label: "Shipping", icon: Truck },
  ];

  return (
    <AdminLayout>
      <div className="mb-6">
        <h1 className="text-2xl md:text-3xl font-bold">Settings & Configuration</h1>
        <p className="text-sm md:text-base text-gray-600 mt-1">Manage your store settings</p>
      </div>

      {/* Tabs */}
      <div className="bg-white rounded-lg shadow-sm mb-6">
        <div className="flex border-b overflow-x-auto md:overflow-x-visible">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex items-center gap-1 md:gap-2 px-3 md:px-6 py-3 border-b-2 transition-colors whitespace-nowrap text-xs md:text-sm ${
                activeTab === tab.id
                  ? "border-blue-500 text-blue-600"
                  : "border-transparent text-gray-600 hover:text-gray-800"
              }`}
            >
              <tab.icon className="w-3 h-3 md:w-4 md:h-4" />
              <span className="hidden sm:inline">{tab.label}</span>
              <span className="sm:hidden">{tab.label.split(' ')[0]}</span>
            </button>
          ))}
        </div>

        <form onSubmit={handleSubmit} className="p-4 md:p-6">
          {/* General Settings */}
          {activeTab === "general" && (
            <div className="space-y-4 max-w-2xl mx-auto">
              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Site Name</label>
                <input
                  type="text"
                  name="site_name"
                  value={formData.site_name}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="My E-commerce Store"
                />
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Site Email</label>
                <input
                  type="email"
                  name="site_email"
                  value={formData.site_email}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="admin@example.com"
                />
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Currency</label>
                <select
                  name="currency"
                  value={formData.currency}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  <option value="BDT">BDT (৳)</option>
                  <option value="USD">USD ($)</option>
                  <option value="EUR">EUR (€)</option>
                  <option value="GBP">GBP (£)</option>
                </select>
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Tax Rate (%)</label>
                <input
                  type="number"
                  name="tax_rate"
                  value={formData.tax_rate}
                  onChange={handleChange}
                  step="0.01"
                  min="0"
                  max="100"
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="0"
                />
              </div>

              <hr className="my-6" />

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Store Logo</label>
                <div className="flex flex-col md:flex-row gap-4 items-start">
                  <div className="flex-1 w-full">
                    <input
                      type="file"
                      accept="image/*"
                      onChange={handleLogoUpload}
                      className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                    <p className="text-xs text-gray-500 mt-1">Recommended: PNG 200x50px</p>
                  </div>
                  {(logoPreview || formData.logo_url) && (
                    <div className="w-32 h-16 border border-gray-300 rounded-lg p-2 flex items-center justify-center bg-gray-50">
                      <img
                        src={logoPreview || formData.logo_url}
                        alt="Logo Preview"
                        className="max-w-full max-h-full"
                      />
                    </div>
                  )}
                </div>
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Favicon</label>
                <div className="flex flex-col md:flex-row gap-4 items-start">
                  <div className="flex-1">
                    <input
                      type="file"
                      accept="image/*"
                      onChange={handleFaviconUpload}
                      className="w-full p-2 border border-gray-300 rounded-lg"
                    />
                    <p className="text-xs text-gray-500 mt-1">Recommended: PNG 32x32px or ICO format</p>
                  </div>
                  {(faviconPreview || formData.favicon_url) && (
                    <div className="w-12 h-12 border border-gray-300 rounded-lg p-1 flex items-center justify-center bg-gray-50">
                      <img
                        src={faviconPreview || formData.favicon_url}
                        alt="Favicon Preview"
                        className="max-w-full max-h-full"
                      />
                    </div>
                  )}
                </div>
              </div>
            </div>
          )}

          {/* Email Settings */}
          {activeTab === "email" && (
            <div className="space-y-4 max-w-2xl mx-auto">
              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">SMTP Host</label>
                <input
                  type="text"
                  name="smtp_host"
                  value={formData.smtp_host}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="smtp.gmail.com"
                />
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">SMTP Port</label>
                <input
                  type="text"
                  name="smtp_port"
                  value={formData.smtp_port}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="587"
                />
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">SMTP Username</label>
                <input
                  type="text"
                  name="smtp_username"
                  value={formData.smtp_username}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="your-email@gmail.com"
                />
              </div>

              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">SMTP Password</label>
                <input
                  type="password"
                  name="smtp_password"
                  value={formData.smtp_password}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="••••••••"
                />
                <p className="text-xs text-gray-500 mt-2">
                  For Gmail, use an App Password if 2FA is enabled
                </p>
              </div>
            </div>
          )}

          {/* Payment Settings */}
          {activeTab === "payment" && (
            <div className="space-y-4 max-w-2xl mx-auto">
              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">Payment Gateway</label>
                <select
                  name="payment_gateway"
                  value={formData.payment_gateway}
                  onChange={handleChange}
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  <option value="stripe">Stripe</option>
                  <option value="paypal">PayPal</option>
                  <option value="razorpay">Razorpay</option>
                  <option value="sslcommerz">SSLCommerz (Bangladesh)</option>
                </select>
              </div>

              <div className="flex items-center gap-2">
                <input
                  type="checkbox"
                  name="payment_test_mode"
                  checked={formData.payment_test_mode}
                  onChange={handleChange}
                  className="w-4 h-4 rounded focus:ring-2 focus:ring-blue-500"
                />
                <label className="text-xs md:text-sm font-medium">Enable Test Mode</label>
              </div>

              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-3 md:p-4">
                <p className="text-xs md:text-sm text-yellow-800">
                  <strong>Note:</strong> Payment gateway credentials should be configured in your .env file for security.
                  This includes API keys, secrets, and webhooks.
                </p>
              </div>
            </div>
          )}

          {/* Shipping Settings */}
          {activeTab === "shipping" && (
            <div className="space-y-4 max-w-2xl mx-auto">
              <div>
                <label className="block text-xs md:text-sm font-medium mb-2">
                  Free Shipping Threshold (in {formData.currency})
                </label>
                <input
                  type="number"
                  name="free_shipping_threshold"
                  value={formData.free_shipping_threshold}
                  onChange={handleChange}
                  step="0.01"
                  min="0"
                  className="w-full p-2 md:p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="1000"
                />
                <p className="text-xs text-gray-500 mt-2">
                  Orders above this amount will get free shipping
                </p>
              </div>

              <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 md:p-4">
                <p className="text-xs md:text-sm text-blue-800">
                  <strong>Tip:</strong> You can configure delivery zones and shipping methods from the
                  "Locations & Delivery" menu.
                </p>
              </div>
            </div>
          )}

          {/* Submit Button */}
          <div className="flex gap-2 md:gap-4 pt-6 flex-wrap">
            <button
              type="submit"
              disabled={loader}
              className="bg-blue-500 text-white px-4 md:px-6 py-2 rounded-lg hover:bg-blue-600 disabled:opacity-50 text-sm font-medium transition"
            >
              {loader ? "Saving..." : "Save Settings"}
            </button>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}
