// Validation error types
export interface ValidationError {
  field: string;
  message: string;
  type: 'required' | 'format' | 'length' | 'match' | 'custom';
}

export interface FormErrors {
  [key: string]: ValidationError[];
}

export interface TouchedFields {
  [key: string]: boolean;
}

// User related types
export interface UserData {
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

export interface AddressFormData {
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

export interface Address extends AddressFormData {
  id: number;
  user_id: number;
}

export interface PaymentMethod {
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

export interface NotificationPreferences {
  email_notifications: boolean;
  sms_notifications: boolean;
  push_notifications: boolean;
  order_updates: boolean;
  promotions: boolean;
}

export interface SessionItem {
  id: number;
  device: string;
  browser: string;
  ip_address: string;
  location: string;
  last_active: string;
  is_current: boolean;
}

// Toast notification types
export interface ToastMessage {
  id: string;
  type: 'success' | 'error' | 'warning' | 'info';
  message: string;
  duration?: number;
  action?: {
    label: string;
    onClick: () => void;
  };
}

// Cache types
export interface CacheEntry<T> {
  data: T;
  timestamp: number;
  ttl: number;
}

// Form validation schema
export interface ValidationSchema {
  [key: string]: {
    required?: boolean | string;
    email?: boolean | string;
    phone?: boolean | string;
    card?: boolean | string;
    password?: boolean | string;
    minLength?: { value: number; message: string };
    maxLength?: { value: number; message: string };
    pattern?: { value: RegExp; message: string };
    custom?: (value: any) => string | null;
  };
}
