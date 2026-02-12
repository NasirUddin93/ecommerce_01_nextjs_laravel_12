"use client";

import { useState, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import Link from "next/link";
import Layout from "../components/Layouts";
import ProtectedRoute from "../components/ProtectedRoute";
import { useToast } from "../components/Toast";
import { ConfirmDialog, useConfirmDialog } from "../components/ConfirmDialog";
import { FormError, FormErrorSummary, FormInput } from "../components/FormComponents";
import { PasswordStrength, PasswordRequirements } from "../components/PasswordStrength";
import { 
  validateEmail, 
  validatePhone, 
  validatePassword, 
  validateCreditCard,
  validateCardExpiry,
  validateCVV,
  validateCardholderName,
  validateName,
  validateAddress,
  validateCity,
  validatePostalCode,
  detectCardBrand
} from "./utils/validators";
import { useFormValidation, useUnsavedChanges } from "./hooks/useFormValidation";
import {
  User,
  Package,
  Heart,
  MapPin,
  Lock,
  Bell,
  CreditCard,
  LogOut,
  Plus,
  Trash2,
  Edit,
  Shield,
  Smartphone,
  Check,
  X,
} from "lucide-react";

const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000/api";

interface UserData {
  id: number;
  name: string;
  email: string;
  phone: string | null;
  address: string | null;
  city: string | null;
  country: string;
  role: string;
  created_at: string;
}

interface AddressFormData {
  recipient_name: string;
  phone: string;
  address_line_1: string;
  address_line_2?: string;
  city: string;
  district: string;
  area: string;
  postal_code?: string;
  country: string;
  address_label: "Home" | "Office" | "Other";
  is_default: boolean;
  is_active: boolean;
}

interface Address extends AddressFormData {
  id: number;
  user_id: number;
}

interface PaymentMethod {
  id: number;
  user_id: number;
  type: string;
  card_brand?: string;
  last_four?: string;
  cardholder_name?: string;
  expiry_month?: string;
  expiry_year?: string;
  is_default: boolean;
  created_at: string;
}

interface NotificationPreferences {
  email_notifications: boolean;
  sms_notifications: boolean;
  push_notifications: boolean;
  order_updates: boolean;
  promotions: boolean;
}

interface SessionItem {
  id: number;
  device: string;
  browser: string;
  ip_address: string;
  location: string;
  last_active: string;
  is_current: boolean;
}

const getAuthToken = () => {
  return typeof window !== "undefined" ? localStorage.getItem("authToken") : null;
};

export default function AccountPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { addToast } = useToast();
  const { isOpen: isConfirmOpen, options: confirmOptions, openConfirm, closeConfirm } = useConfirmDialog();
  const [activeTab, setActiveTab] = useState("profile");
  const [userData, setUserData] = useState<UserData | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isEditMode, setIsEditMode] = useState(false);
  const [isSaving, setIsSaving] = useState(false);
  const [editFormData, setEditFormData] = useState<UserData | null>(null);
  const [editFormErrors, setEditFormErrors] = useState<Record<string, string>>({});
  const { hasChanges } = useUnsavedChanges(editFormData || {}, userData || {});

  const [addresses, setAddresses] = useState<Address[]>([]);
  const [addressesLoading, setAddressesLoading] = useState(false);
  const [addressError, setAddressError] = useState("");
  const [showAddressForm, setShowAddressForm] = useState(false);
  const [addressForm, setAddressForm] = useState<AddressFormData>({
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
  });

  const [passwordForm, setPasswordForm] = useState({
    current_password: "",
    new_password: "",
    new_password_confirmation: "",
  });
  const [securityMessage, setSecurityMessage] = useState("");
  const [passwordValidation, setPasswordValidation] = useState(validatePassword(""))
  const [twoFASecret, setTwoFASecret] = useState("");
  const [twoFAQrUrl, setTwoFAQrUrl] = useState("");
  const [twoFACode, setTwoFACode] = useState("");
  const [twoFAPassword, setTwoFAPassword] = useState("");
  const [sessions, setSessions] = useState<SessionItem[]>([]);
  const [sessionsLoading, setSessionsLoading] = useState(false);
  const [sessionPassword, setSessionPassword] = useState("");

  const [notificationPrefs, setNotificationPrefs] = useState<NotificationPreferences | null>(null);
  const [notificationsLoading, setNotificationsLoading] = useState(false);

  const [paymentMethods, setPaymentMethods] = useState<PaymentMethod[]>([]);
  const [paymentsLoading, setPaymentsLoading] = useState(false);
  const [paymentForm, setPaymentForm] = useState({
    card_number: "",
    cardholder_name: "",
    expiry_month: "",
    expiry_year: "",
    cvv: "",
    is_default: false,
  });

  useEffect(() => {
    const fetchUserProfile = async () => {
      const authToken = getAuthToken();
      if (!authToken) {
        setIsLoading(false);
        return;
      }

      try {
        const response = await fetch(`${apiUrl}/user/profile`, {
          headers: {
            Authorization: `Bearer ${authToken}`,
            Accept: "application/json",
          },
        });

        const data = await response.json();
        if (data.success && data.user) {
          setUserData(data.user);
          localStorage.setItem("userName", data.user.name);
          localStorage.setItem("userEmail", data.user.email);
          localStorage.setItem("userRole", data.user.role);
        } else {
          throw new Error(data.message || "Failed to fetch profile");
        }
      } catch (error) {
        console.error("Error fetching user profile:", error);
        localStorage.clear();
        router.push("/login");
      } finally {
        setIsLoading(false);
      }
    };

    fetchUserProfile();
  }, [router]);

  // Read active tab from URL parameters
  useEffect(() => {
    const tab = searchParams.get("tab");
    if (tab) {
      setActiveTab(tab);
    }
  }, [searchParams]);

  const authFetch = async (url: string, options: RequestInit = {}) => {
    const authToken = getAuthToken();
    if (!authToken) {
      throw new Error("Not authenticated");
    }

    const headers = {
      Accept: "application/json",
      Authorization: `Bearer ${authToken}`,
      ...(options.headers || {}),
    } as Record<string, string>;

    return fetch(url, { ...options, headers });
  };

  const fetchAddresses = async () => {
    if (!userData?.id) {
      return;
    }
    try {
      setAddressesLoading(true);
      const response = await authFetch(`${apiUrl}/customer-addresses?user_id=${userData.id}`);
      const data = await response.json();
      setAddresses(Array.isArray(data.data) ? data.data : []);
      setAddressError("");
    } catch (error) {
      console.error("Error fetching addresses:", error);
      setAddressError("Failed to load addresses.");
    } finally {
      setAddressesLoading(false);
    }
  };

  const handleCreateAddress = async () => {
    if (!userData?.id) {
      return;
    }

    // Validate address form
    const errors: Record<string, string> = {};

    if (!addressForm.recipient_name) errors.recipient_name = 'Recipient name is required';
    if (!addressForm.phone) errors.phone = 'Phone number is required';
    else if (validatePhone(addressForm.phone)) errors.phone = validatePhone(addressForm.phone) || '';

    if (!addressForm.address_line_1) errors.address_line_1 = 'Address line 1 is required';
    if (!addressForm.city) errors.city = 'City is required';

    if (Object.keys(errors).length > 0) {
      addToast('Please fix the address form errors', 'error', 5000);
      return;
    }

    try {
      const response = await authFetch(`${apiUrl}/customer-addresses`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          user_id: userData.id,
          ...addressForm,
        }),
      });

      const data = await response.json();
      if (!response.ok) {
        throw new Error(data?.message || "Failed to create address");
      }

      setAddresses((prev) => [data.data, ...prev]);
      setShowAddressForm(false);
      setAddressForm({
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
      });
      addToast("Address added successfully!", "success", 5000);
    } catch (error) {
      const message = error instanceof Error ? error.message : "Failed to create address";
      addToast(message, "error", 5000);
    }
  };

  const handleDeleteAddress = async (id: number) => {
    openConfirm(
      {
        title: "Delete Address",
        message: "This address will be permanently removed from your account.",
        type: "danger",
        confirmLabel: "Delete",
        cancelLabel: "Cancel",
      },
      async () => {
        try {
          const response = await authFetch(`${apiUrl}/customer-addresses/${id}`, {
            method: "DELETE",
          });

          if (!response.ok) {
            throw new Error("Failed to delete address");
          }

          setAddresses((prev) => prev.filter((address) => address.id !== id));
          addToast("Address deleted successfully!", "success", 5000);
        } catch (error) {
          const message = error instanceof Error ? error.message : "Failed to delete address";
          addToast(message, "error", 5000);
        }
      }
    );
  };

  const handleChangePassword = async () => {
    try {
      setSecurityMessage("");

      // Validate passwords
      if (!passwordForm.current_password) {
        setSecurityMessage('Current password is required');
        return;
      }

      const passwordValidation = validatePassword(passwordForm.new_password);
      if (!passwordValidation.valid) {
        setSecurityMessage(passwordValidation.errors.join(', '));
        return;
      }

      if (passwordForm.new_password !== passwordForm.new_password_confirmation) {
        setSecurityMessage('Password confirmation does not match');
        return;
      }

      const response = await authFetch(`${apiUrl}/user/change-password`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(passwordForm),
      });

      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to change password");
      }

      addToast("Password changed successfully!", "success", 5000);
      setPasswordForm({ current_password: "", new_password: "", new_password_confirmation: "" });
    } catch (error) {
      const message = error instanceof Error ? error.message : "Failed to change password";
      setSecurityMessage(message);
      addToast(message, "error", 5000);
    }
  };

  const handleEnable2FA = async () => {
    try {
      setSecurityMessage("");
      const response = await authFetch(`${apiUrl}/user/2fa/enable`, { method: "POST" });
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to enable 2FA");
      }
      setTwoFASecret(data.data?.secret || "");
      setTwoFAQrUrl(data.data?.qr_code_url || "");
    } catch (error) {
      setSecurityMessage(error instanceof Error ? error.message : "Failed to enable 2FA");
    }
  };

  const handleVerify2FA = async () => {
    try {
      setSecurityMessage("");
      const response = await authFetch(`${apiUrl}/user/2fa/verify`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ code: twoFACode }),
      });
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to verify 2FA");
      }
      setSecurityMessage("2FA verified successfully.");
      setTwoFACode("");
    } catch (error) {
      setSecurityMessage(error instanceof Error ? error.message : "Failed to verify 2FA");
    }
  };

  const handleDisable2FA = async () => {
    openConfirm(
      {
        title: "Disable Two-Factor Authentication",
        message: "This will reduce your account security. Please confirm this action by entering your password.",
        type: "danger",
        confirmLabel: "Disable 2FA",
        cancelLabel: "Cancel",
        requirePassword: true,
      },
      async (password: string) => {
        try {
          setSecurityMessage("");
          const response = await authFetch(`${apiUrl}/user/2fa/disable`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ password }),
          });
          const data = await response.json();
          if (!response.ok || !data.success) {
            throw new Error(data?.message || "Failed to disable 2FA");
          }
          addToast("2FA disabled successfully", "success");
          setTwoFASecret("");
          setTwoFAQrUrl("");
          setTwoFAPassword("");
          setTwoFAEnabled(false);
        } catch (error) {
          const message = error instanceof Error ? error.message : "Failed to disable 2FA";
          setSecurityMessage(message);
          addToast(message, "error");
        }
      }
    );
  };

  const fetchSessions = async () => {
    try {
      setSessionsLoading(true);
      const response = await authFetch(`${apiUrl}/user/sessions`);
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to fetch sessions");
      }
      setSessions(Array.isArray(data.sessions) ? data.sessions : []);
    } catch (error) {
      console.error("Error fetching sessions:", error);
    } finally {
      setSessionsLoading(false);
    }
  };

  const handleRevokeSession = async (sessionId: number) => {
    openConfirm(
      {
        title: "Revoke Session",
        message: "This will sign you out from that device. This action cannot be undone.",
        type: "warning",
        confirmLabel: "Revoke",
        cancelLabel: "Cancel",
      },
      async () => {
        try {
          const response = await authFetch(`${apiUrl}/user/sessions/${sessionId}`, {
            method: "DELETE",
          });
          if (!response.ok) {
            throw new Error("Failed to revoke session");
          }
          setSessions((prev) => prev.filter((session) => session.id !== sessionId));
          addToast("Session revoked successfully", "success");
        } catch (error) {
          const message = error instanceof Error ? error.message : "Failed to revoke session";
          addToast(message, "error");
        }
      }
    );
  };

  const handleRevokeAllOtherSessions = async () => {
    openConfirm(
      {
        title: "Revoke All Other Sessions",
        message: "This will sign you out from all other devices. You'll need to log in again on those devices. This action cannot be undone.",
        type: "danger",
        confirmLabel: "Revoke All",
        cancelLabel: "Cancel",
        requirePassword: true,
      },
      async (password: string) => {
        try {
          const response = await authFetch(`${apiUrl}/user/sessions/revoke-all`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ password }),
          });
          const data = await response.json();
          if (!response.ok || !data.success) {
            throw new Error(data?.message || "Failed to revoke sessions");
          }
          setSessionPassword("");
          fetchSessions();
          addToast("All other sessions revoked successfully", "success");
        } catch (error) {
          const message = error instanceof Error ? error.message : "Failed to revoke sessions";
          addToast(message, "error");
        }
      }
    );
  };

  const fetchNotificationPrefs = async () => {
    try {
      setNotificationsLoading(true);
      const response = await authFetch(`${apiUrl}/user/notification-preferences`);
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to load preferences");
      }
      setNotificationPrefs(data.preferences);
    } catch (error) {
      console.error("Error fetching notification preferences:", error);
    } finally {
      setNotificationsLoading(false);
    }
  };

  const updateNotificationPrefs = async (prefs: NotificationPreferences) => {
    try {
      const response = await authFetch(`${apiUrl}/user/notification-preferences`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(prefs),
      });
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to update preferences");
      }
    } catch (error) {
      alert(error instanceof Error ? error.message : "Failed to update preferences");
    }
  };

  const handleTogglePreference = (key: keyof NotificationPreferences) => {
    if (!notificationPrefs) {
      return;
    }
    const updated = { ...notificationPrefs, [key]: !notificationPrefs[key] };
    setNotificationPrefs(updated);
    updateNotificationPrefs(updated);
  };

  const fetchPaymentMethods = async () => {
    try {
      setPaymentsLoading(true);
      const response = await authFetch(`${apiUrl}/user/payment-methods`);
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to load payment methods");
      }
      setPaymentMethods(Array.isArray(data.payment_methods) ? data.payment_methods : []);
    } catch (error) {
      console.error("Error fetching payment methods:", error);
    } finally {
      setPaymentsLoading(false);
    }
  };

  const handleAddPaymentMethod = async () => {
    try {
      // Validate card information
      const cardError = validateCreditCard(paymentForm.card_number);
      if (cardError) {
        addToast(cardError, "error", 5000);
        return;
      }

      const expiryError = validateCardExpiry(paymentForm.expiry_month, paymentForm.expiry_year);
      if (expiryError) {
        addToast(expiryError, "error", 5000);
        return;
      }

      const cvvError = validateCVV(paymentForm.cvv);
      if (cvvError) {
        addToast(cvvError, "error", 5000);
        return;
      }

      const nameError = validateCardholderName(paymentForm.cardholder_name);
      if (nameError) {
        addToast(nameError, "error", 5000);
        return;
      }

      const response = await authFetch(`${apiUrl}/user/payment-methods`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          type: "card",
          ...paymentForm,
        }),
      });
      const data = await response.json();
      if (!response.ok || !data.success) {
        throw new Error(data?.message || "Failed to add payment method");
      }
      setPaymentMethods((prev) => [data.payment_method, ...prev]);
      setPaymentForm({
        card_number: "",
        cardholder_name: "",
        expiry_month: "",
        expiry_year: "",
        cvv: "",
        is_default: false,
      });
      addToast("Payment method added successfully!", "success", 5000);
    } catch (error) {
      const message = error instanceof Error ? error.message : "Failed to add payment method";
      addToast(message, "error", 5000);
    }
  };

  const handleDeletePaymentMethod = async (id: number) => {
    openConfirm(
      {
        title: "Delete Payment Method",
        message: "This payment method will be permanently removed from your account.",
        type: "danger",
        confirmLabel: "Delete",
        cancelLabel: "Cancel",
      },
      async () => {
        try {
          const response = await authFetch(`${apiUrl}/user/payment-methods/${id}`, {
            method: "DELETE",
          });
          if (!response.ok) {
            throw new Error("Failed to remove payment method");
          }
          setPaymentMethods((prev) => prev.filter((method) => method.id !== id));
          addToast("Payment method removed successfully!", "success", 5000);
        } catch (error) {
          const message = error instanceof Error ? error.message : "Failed to remove payment method";
          addToast(message, "error", 5000);
        }
      }
    );
  };

  const handleSetDefaultPaymentMethod = async (id: number) => {
    try {
      const response = await authFetch(`${apiUrl}/user/payment-methods/${id}/set-default`, {
        method: "POST",
      });
      if (!response.ok) {
        throw new Error("Failed to set default payment method");
      }
      setPaymentMethods((prev) =>
        prev.map((method) => ({ ...method, is_default: method.id === id }))
      );
    } catch (error) {
      alert(error instanceof Error ? error.message : "Failed to set default payment method");
    }
  };

  useEffect(() => {
    if (!userData?.id) {
      return;
    }

    if (activeTab === "addresses") {
      fetchAddresses();
    }
    if (activeTab === "security") {
      fetchSessions();
    }
    if (activeTab === "notifications") {
      fetchNotificationPrefs();
    }
    if (activeTab === "payment") {
      fetchPaymentMethods();
    }
  }, [activeTab, userData?.id]);

  const handleEditClick = () => {
    const fallbackData: UserData = {
      id: userData?.id ?? 0,
      name: userData?.name ?? "",
      email: userData?.email ?? "",
      phone: userData?.phone ?? "",
      address: userData?.address ?? "",
      city: userData?.city ?? "",
      country: userData?.country ?? "Bangladesh",
      role: userData?.role ?? "customer",
      created_at: userData?.created_at ?? "",
    };
    setEditFormData(fallbackData);
    setEditFormErrors({}); // Clear any previous errors
    setIsEditMode(true);
  };

  const handleCancelEdit = () => {
    setEditFormData(null);
    setIsEditMode(false);
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setEditFormData((prev) => {
      const base: UserData = prev || {
        id: userData?.id ?? 0,
        name: userData?.name ?? "",
        email: userData?.email ?? "",
        phone: userData?.phone ?? "",
        address: userData?.address ?? "",
        city: userData?.city ?? "",
        country: userData?.country ?? "Bangladesh",
        role: userData?.role ?? "customer",
        created_at: userData?.created_at ?? "",
      };
      return { ...base, [name]: value };
    });
  };

  const handleSaveProfile = async () => {
    if (!editFormData) return;

    // Clear previous errors
    setEditFormErrors({});

    // Validate form
    const errors: Record<string, string> = {};

    const nameError = validateName(editFormData.name);
    if (nameError) errors.name = nameError;

    const emailError = validateEmail(editFormData.email);
    if (emailError) errors.email = emailError;

    if (editFormData.phone) {
      const phoneError = validatePhone(editFormData.phone);
      if (phoneError) errors.phone = phoneError;
    }

    if (editFormData.city) {
      const cityError = validateCity(editFormData.city);
      if (cityError) errors.city = cityError;
    }

    if (editFormData.address) {
      const addressError = validateAddress(editFormData.address);
      if (addressError) errors.address = addressError;
    }

    // If there are validation errors, show them
    if (Object.keys(errors).length > 0) {
      setEditFormErrors(errors);
      addToast('Please fix the errors above before saving', 'error', 5000);
      return;
    }

    setIsSaving(true);
    try {
      const response = await authFetch(`${apiUrl}/user/profile`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          name: editFormData.name,
          email: editFormData.email,
          phone: editFormData.phone || null,
          address: editFormData.address || null,
          city: editFormData.city || null,
          country: editFormData.country,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.message || `Server error: ${response.status}`);
      }

      if (data.success && data.user) {
        setUserData(data.user);
        localStorage.setItem("userName", data.user.name);
        localStorage.setItem("userEmail", data.user.email);
        setIsEditMode(false);
        setEditFormData(null);
        setEditFormErrors({});
        addToast("Profile updated successfully!", "success", 5000);
      } else {
        throw new Error(data.message || "Failed to update profile");
      }
    } catch (error) {
      const message = error instanceof Error ? error.message : "Failed to update profile. Please try again.";
      addToast(message, "error", 5000);
      console.error("Error updating profile:", error);
    } finally {
      setIsSaving(false);
    }
  };

  const handleLogout = async () => {
    const authToken = getAuthToken();
    if (authToken) {
      try {
        await fetch(`${apiUrl}/auth/logout`, {
          method: "POST",
          headers: {
            Authorization: `Bearer ${authToken}`,
            Accept: "application/json",
          },
        });
      } catch (error) {
        console.error("Logout failed:", error);
      }
    }

    localStorage.removeItem("authToken");
    localStorage.removeItem("userEmail");
    localStorage.removeItem("userRole");
    localStorage.removeItem("userName");
    router.push("/");
  };

  const orderHref = userData?.email
    ? `/orders?email=${encodeURIComponent(userData.email)}`
    : "/orders";

  const handleTabChange = (tabId: string) => {
    setActiveTab(tabId);
    router.push(`/account?tab=${tabId}`, { scroll: false });
  };

  const menuItems = [
    { id: "profile", label: "My Profile", icon: User, href: "/account", external: false },
    { id: "orders", label: "My Orders", icon: Package, href: orderHref, external: true },
    { id: "wishlist", label: "Wishlist", icon: Heart, href: "/wishlist", external: true },
    { id: "addresses", label: "Addresses", icon: MapPin, href: "/account", external: false },
    { id: "security", label: "Security", icon: Lock, href: "/account", external: false },
    { id: "notifications", label: "Notifications", icon: Bell, href: "/account", external: false },
    { id: "payment", label: "Payment Methods", icon: CreditCard, href: "/account", external: false },
  ];

  return (
    <ProtectedRoute fallbackUrl="/login">
      <Layout>
        <div className="bg-gray-50 min-h-screen py-4 sm:py-8">
          <div className="w-full mx-auto px-4 sm:px-6 lg:px-10">
            <div className="mb-4 sm:mb-8">
              <h1 className="text-2xl sm:text-3xl font-bold text-gray-900">My Account</h1>
              <p className="text-sm sm:text-base text-gray-600 mt-1">
                Manage your profile, orders, and preferences
              </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
              <div className="lg:col-span-1">
                <div className="bg-white rounded-lg shadow-sm overflow-hidden">
                  <div className="p-4 sm:p-6 bg-gradient-to-r from-blue-600 to-blue-700 text-white">
                    <div className="flex items-center space-x-3">
                      <div className="h-12 w-12 sm:h-16 sm:w-16 bg-white rounded-full flex items-center justify-center text-blue-600 font-bold text-lg sm:text-xl flex-shrink-0">
                        {userData?.name?.charAt(0).toUpperCase() || "U"}
                      </div>
                      <div className="overflow-hidden">
                        <h3 className="font-semibold text-base sm:text-lg truncate">{userData?.name}</h3>
                        <p className="text-blue-100 text-xs sm:text-sm truncate">{userData?.email}</p>
                      </div>
                    </div>
                  </div>

                  <nav className="p-2 sm:p-4">
                    {menuItems.map((item) => {
                      const Icon = item.icon;
                      const isActive = activeTab === item.id;

                      if (item.external) {
                        return (
                          <Link
                            key={item.id}
                            href={item.href}
                            className="flex items-center space-x-3 px-3 sm:px-4 py-2.5 sm:py-3 rounded-lg mb-1.5 sm:mb-2 transition-colors text-gray-700 hover:bg-gray-50"
                          >
                            <Icon className="h-4 w-4 sm:h-5 sm:w-5 flex-shrink-0" />
                            <span className="font-medium text-sm sm:text-base">{item.label}</span>
                          </Link>
                        );
                      }

                      return (
                        <button
                          key={item.id}
                          onClick={() => handleTabChange(item.id)}
                          className={`w-full flex items-center space-x-3 px-3 sm:px-4 py-2.5 sm:py-3 rounded-lg mb-1.5 sm:mb-2 transition-colors ${
                            isActive ? "bg-blue-50 text-blue-600" : "text-gray-700 hover:bg-gray-50"
                          }`}
                        >
                          <Icon className="h-4 w-4 sm:h-5 sm:w-5 flex-shrink-0" />
                          <span className="font-medium text-sm sm:text-base">{item.label}</span>
                        </button>
                      );
                    })}

                    <button
                      onClick={handleLogout}
                      className="w-full flex items-center space-x-3 px-3 sm:px-4 py-2.5 sm:py-3 rounded-lg mt-3 sm:mt-4 text-red-600 hover:bg-red-50 transition-colors"
                    >
                      <LogOut className="h-4 w-4 sm:h-5 sm:w-5 flex-shrink-0" />
                      <span className="font-medium text-sm sm:text-base">Logout</span>
                    </button>
                  </nav>
                </div>
              </div>

              <div className="lg:col-span-3">
                {isLoading ? (
                  <div className="bg-white rounded-lg shadow-sm p-8 text-center">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
                    <p className="mt-4 text-gray-600">Loading...</p>
                  </div>
                ) : (
                  <div className="bg-white rounded-lg shadow-sm">
                    {activeTab === "profile" && (
                      <div className="p-4 sm:p-6">
                        <div className="flex items-center justify-between mb-4 sm:mb-6">
                          <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Profile Information</h2>
                          {!isEditMode && (
                            <button
                              onClick={handleEditClick}
                              className="flex items-center space-x-2 px-4 py-2 text-blue-600 border border-blue-600 rounded-lg hover:bg-blue-50 transition-colors text-sm"
                            >
                              <Edit className="h-4 w-4" />
                              <span>Edit</span>
                            </button>
                          )}
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 sm:gap-6">
                          <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">
                              Full Name <span className="text-red-600">*</span>
                            </label>
                            <input
                              type="text"
                              name="name"
                              value={isEditMode ? editFormData?.name || "" : userData?.name || ""}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              className={`w-full px-4 py-2 border rounded-lg ${
                                editFormErrors.name ? 'border-red-500' : 'border-gray-300'
                              } ${isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"}`}
                            />
                            {isEditMode && <FormError error={editFormErrors.name} />}
                          </div>

                          <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">
                              Email Address <span className="text-red-600">*</span>
                            </label>
                            <input
                              type="email"
                              name="email"
                              value={isEditMode ? editFormData?.email || "" : userData?.email || ""}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              className={`w-full px-4 py-2 border rounded-lg ${
                                editFormErrors.email ? 'border-red-500' : 'border-gray-300'
                              } ${isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"}`}
                            />
                            {isEditMode && <FormError error={editFormErrors.email} />}
                          </div>

                          <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">Phone Number</label>
                            <input
                              type="tel"
                              name="phone"
                              value={isEditMode ? editFormData?.phone || "" : userData?.phone || ""}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              placeholder={isEditMode ? "Enter phone number" : "Not provided"}
                              className={`w-full px-4 py-2 border rounded-lg ${
                                editFormErrors.phone ? 'border-red-500' : 'border-gray-300'
                              } ${isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"}`}
                            />
                            {isEditMode && <FormError error={editFormErrors.phone} />}
                          </div>

                          <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">City</label>
                            <input
                              type="text"
                              name="city"
                              value={isEditMode ? editFormData?.city || "" : userData?.city || ""}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              placeholder={isEditMode ? "Enter city" : "Not provided"}
                              className={`w-full px-4 py-2 border rounded-lg ${
                                editFormErrors.city ? 'border-red-500' : 'border-gray-300'
                              } ${isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"}`}
                            />
                            {isEditMode && <FormError error={editFormErrors.city} />}
                          </div>

                          <div className="sm:col-span-2">
                            <label className="block text-sm font-medium text-gray-700 mb-2">Country</label>
                            <input
                              type="text"
                              name="country"
                              value={isEditMode ? editFormData?.country || "" : userData?.country || "Bangladesh"}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              className={`w-full px-4 py-2 border border-gray-300 rounded-lg ${
                                isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"
                              }`}
                            />
                          </div>

                          <div className="sm:col-span-2">
                            <label className="block text-sm font-medium text-gray-700 mb-2">Address</label>
                            <textarea
                              name="address"
                              value={isEditMode ? editFormData?.address || "" : userData?.address || ""}
                              onChange={handleInputChange}
                              readOnly={!isEditMode}
                              rows={3}
                              placeholder={isEditMode ? "Enter your full address" : "Not provided"}
                              className={`w-full px-4 py-2 border rounded-lg ${
                                editFormErrors.address ? 'border-red-500' : 'border-gray-300'
                              } ${isEditMode ? "bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent" : "bg-gray-50"}`}
                            />
                            {isEditMode && <FormError error={editFormErrors.address} />}
                          </div>
                        </div>

                        {isEditMode ? (
                          <div className="mt-6 flex flex-col sm:flex-row gap-3 border-t pt-6">
                            <button
                              onClick={handleSaveProfile}
                              disabled={isSaving}
                              className="flex-1 sm:flex-initial px-6 py-2.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors text-sm sm:text-base disabled:bg-gray-400 disabled:cursor-not-allowed flex items-center justify-center space-x-2"
                            >
                              {isSaving ? (
                                <>
                                  <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent"></div>
                                  <span>Saving...</span>
                                </>
                              ) : (
                                <>
                                  <Check className="h-4 w-4" />
                                  <span>Save Changes</span>
                                </>
                              )}
                            </button>
                            <button
                              onClick={handleCancelEdit}
                              disabled={isSaving}
                              className="flex-1 sm:flex-initial px-6 py-2.5 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition-colors text-sm sm:text-base disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center space-x-2"
                            >
                              <X className="h-4 w-4" />
                              <span>Cancel</span>
                            </button>
                          </div>
                        ) : (
                          <div className="mt-6 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-t pt-6">
                            <div className="space-y-1">
                              <p className="text-sm text-gray-600">
                                Member since: <span className="font-medium text-gray-900">
                                  {userData?.created_at
                                    ? new Date(userData.created_at).toLocaleDateString()
                                    : "N/A"}
                                </span>
                              </p>
                              <p className="text-sm text-gray-600">
                                Account type: <span className="font-medium text-gray-900 capitalize">
                                  {userData?.role}
                                </span>
                              </p>
                            </div>
                          </div>
                        )}
                      </div>
                    )}

                    {activeTab === "addresses" && (
                      <div className="p-4 sm:p-6">
                        <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between mb-4 sm:mb-6">
                          <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Saved Addresses</h2>
                          <button
                            onClick={() => setShowAddressForm((prev) => !prev)}
                            className="flex items-center space-x-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors text-sm"
                          >
                            <Plus className="h-4 w-4" />
                            <span className="hidden sm:inline">{showAddressForm ? "Close" : "Add Address"}</span>
                            <span className="sm:hidden">{showAddressForm ? "Close" : "Add"}</span>
                          </button>
                        </div>

                        {showAddressForm && (
                          <div className="border border-gray-200 rounded-lg p-4 mb-6">
                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Recipient name"
                                value={addressForm.recipient_name}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, recipient_name: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Phone number"
                                value={addressForm.phone}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, phone: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm sm:col-span-2"
                                placeholder="Address line 1"
                                value={addressForm.address_line_1}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, address_line_1: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm sm:col-span-2"
                                placeholder="Address line 2"
                                value={addressForm.address_line_2}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, address_line_2: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="City"
                                value={addressForm.city}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, city: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="District"
                                value={addressForm.district}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, district: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Area"
                                value={addressForm.area}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, area: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Postal code"
                                value={addressForm.postal_code}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, postal_code: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Country"
                                value={addressForm.country}
                                onChange={(e) => setAddressForm((prev) => ({ ...prev, country: e.target.value }))}
                              />
                              <select
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                value={addressForm.address_label}
                                onChange={(e) => setAddressForm((prev) => ({
                                  ...prev,
                                  address_label: e.target.value as AddressFormData["address_label"],
                                }))}
                              >
                                <option value="Home">Home</option>
                                <option value="Office">Office</option>
                                <option value="Other">Other</option>
                              </select>
                              <label className="flex items-center gap-2 text-sm text-gray-700">
                                <input
                                  type="checkbox"
                                  checked={addressForm.is_default}
                                  onChange={(e) => setAddressForm((prev) => ({ ...prev, is_default: e.target.checked }))}
                                />
                                Set as default
                              </label>
                            </div>
                            <div className="mt-4 flex justify-end">
                              <button
                                onClick={handleCreateAddress}
                                className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm hover:bg-blue-700"
                              >
                                Save Address
                              </button>
                            </div>
                          </div>
                        )}

                        {addressesLoading ? (
                          <div className="text-center py-6 text-gray-500">Loading addresses...</div>
                        ) : (
                          <>
                            {addressError && <p className="text-sm text-red-600 mb-3">{addressError}</p>}
                            {addresses.length === 0 ? (
                              <div className="border-2 border-dashed border-gray-300 rounded-lg p-8 flex flex-col items-center justify-center text-center">
                                <MapPin className="h-12 w-12 text-gray-400 mb-3" />
                                <p className="text-gray-500 text-sm mb-2">No addresses saved yet</p>
                                <button
                                  onClick={() => setShowAddressForm(true)}
                                  className="text-blue-600 text-sm hover:text-blue-700"
                                >
                                  Add New Address
                                </button>
                              </div>
                            ) : (
                              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                {addresses.map((address) => (
                                  <div
                                    key={address.id}
                                    className="border border-gray-200 rounded-lg p-4 hover:border-blue-500 transition-colors"
                                  >
                                    <div className="flex flex-col gap-2 sm:flex-row sm:items-start sm:justify-between mb-3">
                                      <div className="flex items-center space-x-2">
                                        <MapPin className="h-5 w-5 text-gray-500" />
                                        <span className="font-semibold text-gray-900">
                                          {address.address_label}
                                        </span>
                                      </div>
                                      {address.is_default && (
                                        <span className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">Default</span>
                                      )}
                                    </div>
                                    <p className="text-sm text-gray-600 mb-1">{address.recipient_name}</p>
                                    <p className="text-sm text-gray-600 mb-1">{address.address_line_1}</p>
                                    {address.address_line_2 && (
                                      <p className="text-sm text-gray-600 mb-1">{address.address_line_2}</p>
                                    )}
                                    <p className="text-sm text-gray-600 mb-3">
                                      {address.city}, {address.district}, {address.country}
                                    </p>
                                    <div className="flex items-center space-x-2">
                                      <button
                                        onClick={() => handleDeleteAddress(address.id)}
                                        className="flex items-center space-x-1 text-sm text-red-600 hover:text-red-700"
                                      >
                                        <Trash2 className="h-4 w-4" />
                                        <span>Delete</span>
                                      </button>
                                    </div>
                                  </div>
                                ))}
                              </div>
                            )}
                          </>
                        )}
                      </div>
                    )}

                    {activeTab === "security" && (
                      <div className="p-4 sm:p-6">
                        <h2 className="text-xl sm:text-2xl font-bold text-gray-900 mb-4 sm:mb-6">Security Settings</h2>

                        <div className="space-y-6">
                          <div className="border border-gray-200 rounded-lg p-4 sm:p-6">
                            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between mb-4">
                              <div className="flex items-center space-x-3">
                                <Lock className="h-5 w-5 text-gray-500" />
                                <div>
                                  <h3 className="font-semibold text-gray-900">Password</h3>
                                  <p className="text-sm text-gray-600">Update your account password</p>
                                </div>
                              </div>
                            </div>
                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                              <input
                                type="password"
                                placeholder="Current password"
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                value={passwordForm.current_password}
                                onChange={(e) => setPasswordForm((prev) => ({ ...prev, current_password: e.target.value }))}
                              />
                              <input
                                type="password"
                                placeholder="New password"
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                value={passwordForm.new_password}
                                onChange={(e) => {
                                  const newPass = e.target.value;
                                  setPasswordForm((prev) => ({ ...prev, new_password: newPass }));
                                  setPasswordValidation(validatePassword(newPass));
                                }}
                              />
                              <input
                                type="password"
                                placeholder="Confirm new password"
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                value={passwordForm.new_password_confirmation}
                                onChange={(e) => setPasswordForm((prev) => ({ ...prev, new_password_confirmation: e.target.value }))}
                              />
                            </div>
                            
                            {/* Password strength indicator */}
                            {passwordForm.new_password && (
                              <div className="mt-3">
                                <PasswordStrength 
                                  strength={passwordValidation.strength}
                                  errors={passwordValidation.errors}
                                />
                              </div>
                            )}
                            
                            <div className="mt-3 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                              <p className="text-sm text-gray-500">Use a strong password to protect your account</p>
                              <button
                                onClick={handleChangePassword}
                                className="px-4 py-2 text-sm text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors"
                              >
                                Update Password
                              </button>
                            </div>
                            {securityMessage && <p className="text-sm mt-3 text-gray-600">{securityMessage}</p>}
                          </div>

                          <div className="border border-gray-200 rounded-lg p-4 sm:p-6">
                            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between mb-4">
                              <div className="flex items-center space-x-3">
                                <Shield className="h-5 w-5 text-gray-500" />
                                <div>
                                  <h3 className="font-semibold text-gray-900">Two-Factor Authentication</h3>
                                  <p className="text-sm text-gray-600">Enhance account security</p>
                                </div>
                              </div>
                              <button
                                onClick={handleEnable2FA}
                                className="px-4 py-2 text-sm bg-blue-600 text-white hover:bg-blue-700 rounded-lg transition-colors"
                              >
                                Enable
                              </button>
                            </div>

                            {twoFAQrUrl && (
                              <div className="space-y-3">
                                <div className="flex flex-col sm:flex-row gap-4">
                                  <img
                                    src={twoFAQrUrl}
                                    alt="2FA QR Code"
                                    className="w-28 h-28 border border-gray-200 rounded"
                                  />
                                  <div className="text-sm text-gray-600">
                                    <p className="font-medium text-gray-900">Secret:</p>
                                    <p className="break-all">{twoFASecret}</p>
                                  </div>
                                </div>
                                <div className="flex flex-col sm:flex-row gap-3">
                                  <input
                                    type="text"
                                    placeholder="Enter 6-digit code"
                                    className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                    value={twoFACode}
                                    onChange={(e) => setTwoFACode(e.target.value)}
                                  />
                                  <button
                                    onClick={handleVerify2FA}
                                    className="px-4 py-2 text-sm bg-green-600 text-white hover:bg-green-700 rounded-lg"
                                  >
                                    Verify
                                  </button>
                                </div>
                                <div>
                                  <button
                                    onClick={handleDisable2FA}
                                    className="px-4 py-2 text-sm text-red-600 border border-red-200 hover:bg-red-50 rounded-lg"
                                  >
                                    Disable 2FA
                                  </button>
                                </div>
                              </div>
                            )}
                          </div>

                          <div className="border border-gray-200 rounded-lg p-4 sm:p-6">
                            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between mb-4">
                              <div className="flex items-center space-x-3">
                                <Smartphone className="h-5 w-5 text-gray-500" />
                                <div>
                                  <h3 className="font-semibold text-gray-900">Active Sessions</h3>
                                  <p className="text-sm text-gray-600">Manage signed-in devices</p>
                                </div>
                              </div>
                              <div className="flex flex-col sm:flex-row sm:items-center gap-2">
                                <button
                                  onClick={handleRevokeAllOtherSessions}
                                  className="px-4 py-2 text-sm text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                                >
                                  Sign Out All Other Devices
                                </button>
                              </div>
                            </div>

                            {sessionsLoading ? (
                              <div className="text-sm text-gray-500">Loading sessions...</div>
                            ) : (
                              <div className="space-y-2">
                                {sessions.length === 0 && (
                                  <div className="text-sm text-gray-500">No sessions found.</div>
                                )}
                                {sessions.map((session) => (
                                  <div
                                    key={session.id}
                                    className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between text-sm bg-gray-50 p-3 rounded"
                                  >
                                    <div>
                                      <p className="font-medium text-gray-900">
                                        {session.device} • {session.browser}
                                      </p>
                                      <p className="text-gray-500 text-xs">
                                        {session.location} • {session.ip_address}
                                      </p>
                                    </div>
                                    <div className="flex items-center gap-2">
                                      {session.is_current && (
                                        <span className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded">Active</span>
                                      )}
                                      {!session.is_current && (
                                        <button
                                          onClick={() => handleRevokeSession(session.id)}
                                          className="text-xs text-red-600 hover:text-red-700"
                                        >
                                          Revoke
                                        </button>
                                      )}
                                    </div>
                                  </div>
                                ))}
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                    )}

                    {activeTab === "notifications" && (
                      <div className="p-4 sm:p-6">
                        <h2 className="text-xl sm:text-2xl font-bold text-gray-900 mb-4 sm:mb-6">
                          Notification Preferences
                        </h2>

                        <div className="space-y-4">
                          <div className="border border-gray-200 rounded-lg p-4 sm:p-6">
                            <div className="flex items-center space-x-3 mb-4">
                              <Bell className="h-5 w-5 text-gray-500" />
                              <h3 className="font-semibold text-gray-900">Preferences</h3>
                            </div>

                            {notificationsLoading ? (
                              <div className="text-sm text-gray-500">Loading preferences...</div>
                            ) : notificationPrefs ? (
                              <div className="space-y-3">
                                {[
                                  {
                                    key: "email_notifications",
                                    label: "Email notifications",
                                    desc: "Receive updates via email",
                                  },
                                  {
                                    key: "sms_notifications",
                                    label: "SMS notifications",
                                    desc: "Receive updates via SMS",
                                  },
                                  {
                                    key: "push_notifications",
                                    label: "Push notifications",
                                    desc: "Receive push notifications",
                                  },
                                  {
                                    key: "order_updates",
                                    label: "Order updates",
                                    desc: "Order status changes and delivery updates",
                                  },
                                  {
                                    key: "promotions",
                                    label: "Promotions",
                                    desc: "Deals, discounts, and promotional offers",
                                  },
                                ].map((item) => (
                                  <div key={item.key} className="flex items-center justify-between py-2">
                                    <div className="flex-1">
                                      <p className="text-sm font-medium text-gray-900">{item.label}</p>
                                      <p className="text-xs text-gray-500">{item.desc}</p>
                                    </div>
                                    <button
                                      onClick={() => handleTogglePreference(item.key as keyof NotificationPreferences)}
                                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                                        notificationPrefs[item.key as keyof NotificationPreferences]
                                          ? "bg-blue-600"
                                          : "bg-gray-200"
                                      }`}
                                    >
                                      <span
                                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                                          notificationPrefs[item.key as keyof NotificationPreferences]
                                            ? "translate-x-6"
                                            : "translate-x-1"
                                        }`}
                                      />
                                    </button>
                                  </div>
                                ))}
                              </div>
                            ) : (
                              <div className="text-sm text-gray-500">No preferences found.</div>
                            )}
                          </div>
                        </div>
                      </div>
                    )}

                    {activeTab === "payment" && (
                      <div className="p-4 sm:p-6">
                        <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between mb-4 sm:mb-6">
                          <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Payment Methods</h2>
                          <button
                            onClick={handleAddPaymentMethod}
                            className="flex items-center space-x-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors text-sm"
                          >
                            <Plus className="h-4 w-4" />
                            <span className="hidden sm:inline">Add Card</span>
                            <span className="sm:hidden">Add</span>
                          </button>
                        </div>

                        <div className="space-y-4">
                          <div className="border border-gray-200 rounded-lg p-4 sm:p-6">
                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Card number"
                                value={paymentForm.card_number}
                                onChange={(e) => setPaymentForm((prev) => ({ ...prev, card_number: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Cardholder name"
                                value={paymentForm.cardholder_name}
                                onChange={(e) => setPaymentForm((prev) => ({ ...prev, cardholder_name: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Expiry month"
                                value={paymentForm.expiry_month}
                                onChange={(e) => setPaymentForm((prev) => ({ ...prev, expiry_month: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="Expiry year"
                                value={paymentForm.expiry_year}
                                onChange={(e) => setPaymentForm((prev) => ({ ...prev, expiry_year: e.target.value }))}
                              />
                              <input
                                className="border border-gray-300 rounded-lg px-3 py-2 text-sm"
                                placeholder="CVV"
                                value={paymentForm.cvv}
                                onChange={(e) => setPaymentForm((prev) => ({ ...prev, cvv: e.target.value }))}
                              />
                              <label className="flex items-center gap-2 text-sm text-gray-700">
                                <input
                                  type="checkbox"
                                  checked={paymentForm.is_default}
                                  onChange={(e) => setPaymentForm((prev) => ({ ...prev, is_default: e.target.checked }))}
                                />
                                Set as default
                              </label>
                            </div>
                          </div>

                          {paymentsLoading ? (
                            <div className="text-sm text-gray-500">Loading payment methods...</div>
                          ) : paymentMethods.length === 0 ? (
                            <div className="border-2 border-dashed border-gray-300 rounded-lg p-8 flex flex-col items-center justify-center text-center">
                              <CreditCard className="h-12 w-12 text-gray-400 mb-3" />
                              <p className="text-gray-500 text-sm mb-2">No payment methods found</p>
                              <p className="text-gray-400 text-xs mb-4">Add a card for faster checkout</p>
                            </div>
                          ) : (
                            paymentMethods.map((method) => (
                              <div key={method.id} className="border border-gray-200 rounded-lg p-4 sm:p-6 hover:border-blue-500 transition-colors">
                                <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between mb-4">
                                  <div className="flex items-center space-x-3">
                                    <CreditCard className="h-6 w-6 text-blue-600" />
                                    <div>
                                      <p className="font-semibold text-gray-900">
                                        {method.card_brand?.toUpperCase()} •••• {method.last_four}
                                      </p>
                                      <p className="text-sm text-gray-500">
                                        Expires {method.expiry_month}/{method.expiry_year}
                                      </p>
                                    </div>
                                  </div>
                                  {method.is_default && (
                                    <span className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">Default</span>
                                  )}
                                </div>
                                <div className="flex items-center space-x-2">
                                  <button
                                    onClick={() => handleSetDefaultPaymentMethod(method.id)}
                                    className="flex items-center space-x-1 text-sm text-blue-600 hover:text-blue-700"
                                  >
                                    <span>Set Default</span>
                                  </button>
                                  <button
                                    onClick={() => handleDeletePaymentMethod(method.id)}
                                    className="flex items-center space-x-1 text-sm text-red-600 hover:text-red-700"
                                  >
                                    <Trash2 className="h-4 w-4" />
                                    <span>Remove</span>
                                  </button>
                                </div>
                              </div>
                            ))
                          )}

                          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mt-6">
                            <div className="flex items-start space-x-3">
                              <Shield className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                              <div>
                                <p className="text-sm font-medium text-blue-900 mb-1">Secure Payments</p>
                                <p className="text-xs text-blue-700">
                                  Your payment information is encrypted and secure. We never store your full card details.
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    )}
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
        
        <ConfirmDialog 
          isOpen={isConfirmOpen}
          options={confirmOptions}
          onClose={closeConfirm}
        />
      </Layout>
    </ProtectedRoute>
  );
}
