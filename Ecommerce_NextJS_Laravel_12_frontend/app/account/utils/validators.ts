/**
 * Validation utility functions for account management
 */

// Email validation
export const validateEmail = (email: string): string | null => {
  if (!email) return 'Email is required';
  
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return 'Invalid email format';
  }
  
  return null;
};

// Phone validation (supports multiple formats)
export const validatePhone = (phone: string, required = true): string | null => {
  if (!phone && !required) return null;
  if (!phone && required) return 'Phone number is required';
  
  // Remove all non-digit characters
  const cleaned = phone.replace(/\D/g, '');
  
  // Check length (10-15 digits is standard)
  if (cleaned.length < 10 || cleaned.length > 15) {
    return 'Phone number must be 10-15 digits';
  }
  
  return null;
};

// Password validation with strength indicator
export const validatePassword = (password: string): { valid: boolean; errors: string[]; strength: 'weak' | 'fair' | 'good' | 'strong' } => {
  const errors: string[] = [];
  let strength: 'weak' | 'fair' | 'good' | 'strong' = 'weak';
  
  if (!password) {
    errors.push('Password is required');
    return { valid: false, errors, strength };
  }
  
  // Minimum 8 characters
  if (password.length < 8) {
    errors.push('Minimum 8 characters required');
  }
  
  // At least one uppercase letter
  if (!/[A-Z]/.test(password)) {
    errors.push('Must contain at least one uppercase letter');
  }
  
  // At least one lowercase letter
  if (!/[a-z]/.test(password)) {
    errors.push('Must contain at least one lowercase letter');
  }
  
  // At least one number
  if (!/\d/.test(password)) {
    errors.push('Must contain at least one number');
  }
  
  // At least one special character
  if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) {
    errors.push('Must contain at least one special character (!@#$%^&*)');
  }
  
  // Calculate strength
  if (errors.length === 0) {
    if (password.length >= 12) {
      strength = 'strong';
    } else if (password.length >= 10) {
      strength = 'good';
    } else {
      strength = 'fair';
    }
  } else if (errors.length <= 2) {
    strength = 'fair';
  }
  
  return {
    valid: errors.length === 0,
    errors,
    strength
  };
};

// Credit card validation using Luhn algorithm
export const validateCreditCard = (cardNumber: string): string | null => {
  if (!cardNumber) return 'Card number is required';
  
  // Remove spaces and dashes
  const cleaned = cardNumber.replace(/[\s-]/g, '');
  
  // Check if all digits
  if (!/^\d+$/.test(cleaned)) {
    return 'Card number must contain only digits';
  }
  
  // Check length (12-19 digits is standard)
  if (cleaned.length < 12 || cleaned.length > 19) {
    return 'Card number must be 12-19 digits';
  }
  
  // Luhn algorithm validation
  let sum = 0;
  let isEven = false;
  
  for (let i = cleaned.length - 1; i >= 0; i--) {
    let digit = parseInt(cleaned[i], 10);
    
    if (isEven) {
      digit *= 2;
      if (digit > 9) {
        digit -= 9;
      }
    }
    
    sum += digit;
    isEven = !isEven;
  }
  
  if (sum % 10 !== 0) {
    return 'Invalid card number';
  }
  
  return null;
};

// Card expiry validation
export const validateCardExpiry = (month: string, year: string): string | null => {
  if (!month || !year) return 'Expiry date is required';
  
  const m = parseInt(month, 10);
  const y = parseInt(year, 10);
  
  if (m < 1 || m > 12) {
    return 'Invalid month';
  }
  
  const currentDate = new Date();
  const currentYear = currentDate.getFullYear();
  const currentMonth = currentDate.getMonth() + 1;
  
  if (y < currentYear || (y === currentYear && m < currentMonth)) {
    return 'Card has expired';
  }
  
  return null;
};

// CVV validation
export const validateCVV = (cvv: string): string | null => {
  if (!cvv) return 'CVV is required';
  
  if (!/^\d{3,4}$/.test(cvv)) {
    return 'CVV must be 3-4 digits';
  }
  
  return null;
};

// Cardholder name validation
export const validateCardholderName = (name: string): string | null => {
  if (!name) return 'Cardholder name is required';
  
  if (name.length < 3) {
    return 'Name must be at least 3 characters';
  }
  
  if (!/^[a-zA-Z\s'-]*$/.test(name)) {
    return 'Name can only contain letters, spaces, hyphens, and apostrophes';
  }
  
  return null;
};

// Detect card brand
export const detectCardBrand = (cardNumber: string): string => {
  const cleaned = cardNumber.replace(/\D/g, '');
  
  if (/^4[0-9]{12}(?:[0-9]{3})?$/.test(cleaned)) {
    return 'visa';
  } else if (/^5[1-5][0-9]{14}$/.test(cleaned)) {
    return 'mastercard';
  } else if (/^3[47][0-9]{13}$/.test(cleaned)) {
    return 'amex';
  } else if (/^6(?:011|5[0-9]{2})[0-9]{12}$/.test(cleaned)) {
    return 'discover';
  }
  
  return 'unknown';
};

// Name validation
export const validateName = (name: string): string | null => {
  if (!name) return 'Name is required';
  
  if (name.trim().length < 2) {
    return 'Name must be at least 2 characters';
  }
  
  if (name.trim().length > 100) {
    return 'Name must not exceed 100 characters';
  }
  
  return null;
};

// Address validation
export const validateAddress = (address: string, required = true): string | null => {
  if (!address && !required) return null;
  if (!address && required) return 'Address is required';
  
  if (address.trim().length < 5) {
    return 'Address must be at least 5 characters';
  }
  
  if (address.trim().length > 255) {
    return 'Address must not exceed 255 characters';
  }
  
  return null;
};

// City validation
export const validateCity = (city: string, required = true): string | null => {
  if (!city && !required) return null;
  if (!city && required) return 'City is required';
  
  if (city.trim().length < 2) {
    return 'City must be at least 2 characters';
  }
  
  if (city.trim().length > 100) {
    return 'City must not exceed 100 characters';
  }
  
  return null;
};

// Postal code validation
export const validatePostalCode = (code: string, required = true): string | null => {
  if (!code && !required) return null;
  if (!code && required) return 'Postal code is required';
  
  if (!/^[A-Za-z0-9\s-]{2,20}$/.test(code)) {
    return 'Invalid postal code format';
  }
  
  return null;
};

// Generic required field validation
export const validateRequired = (value: string | null | undefined, fieldName: string): string | null => {
  if (!value || !value.toString().trim()) {
    return `${fieldName} is required`;
  }
  return null;
};

// Compare two fields (e.g., password confirmation)
export const validateMatch = (value: string, compareValue: string, fieldName: string): string | null => {
  if (value !== compareValue) {
    return `${fieldName} does not match`;
  }
  return null;
};

// URL validation
export const validateURL = (url: string, required = true): string | null => {
  if (!url && !required) return null;
  if (!url && required) return 'URL is required';
  
  try {
    new URL(url);
    return null;
  } catch {
    return 'Invalid URL format';
  }
};

// Batch validation function
export const validateForm = (
  data: Record<string, any>,
  validators: Record<string, (value: any) => string | null>
): Record<string, string> => {
  const errors: Record<string, string> = {};
  
  Object.entries(validators).forEach(([field, validator]) => {
    const error = validator(data[field]);
    if (error) {
      errors[field] = error;
    }
  });
  
  return errors;
};

// Check if form has errors
export const hasErrors = (errors: Record<string, any>): boolean => {
  return Object.values(errors).some(error => !!error);
};

// Get error message for display
export const getErrorMessage = (error: any): string => {
  if (typeof error === 'string') {
    return error;
  }
  if (error?.message) {
    return error.message;
  }
  return 'An error occurred. Please try again.';
};
