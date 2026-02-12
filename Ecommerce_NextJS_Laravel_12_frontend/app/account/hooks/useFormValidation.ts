'use client';

import { useState, useCallback, useRef, useEffect } from 'react';
import { FormErrors, TouchedFields } from '../types';

interface UseFormValidationOptions {
  onError?: (errors: FormErrors) => void;
  onSuccess?: () => void;
}

/**
 * Custom hook for managing form state, validation, and errors
 */
export function useFormValidation<T extends Record<string, any>>(
  initialValues: T,
  validators: Record<keyof T, (value: any) => string | null>,
  options?: UseFormValidationOptions
) {
  const [values, setValues] = useState<T>(initialValues);
  const [errors, setErrors] = useState<Record<keyof T, string>>({} as any);
  const [touched, setTouched] = useState<TouchedFields>({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  const submitCountRef = useRef(0);

  // Validate single field
  const validateField = useCallback(
    (name: keyof T, value: any): string | null => {
      const validator = validators[name];
      if (!validator) return null;
      
      const error = validator(value);
      return error;
    },
    [validators]
  );

  // Handle field change
  const handleChange = useCallback(
    (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
      const { name, value, type, checked } = e.target as any;
      const fieldValue = type === 'checkbox' ? checked : value;
      
      setValues(prev => ({
        ...prev,
        [name]: fieldValue
      }));

      // Real-time validation if field was touched
      if (touched[name]) {
        const error = validateField(name as keyof T, fieldValue);
        setErrors(prev => ({
          ...prev,
          [name]: error || ''
        }));
      }
    },
    [touched, validateField]
  );

  // Handle field blur
  const handleBlur = useCallback(
    (e: React.FocusEvent<HTMLInputElement | HTMLTextAreaElement>) => {
      const { name } = e.target;
      
      setTouched(prev => ({
        ...prev,
        [name]: true
      }));

      const error = validateField(name as keyof T, values[name as keyof T]);
      setErrors(prev => ({
        ...prev,
        [name]: error || ''
      }));
    },
    [values, validateField]
  );

  // Validate all fields
  const validateAll = useCallback((): Record<keyof T, string> => {
    const newErrors: Record<keyof T, string> = {} as any;
    
    Object.keys(validators).forEach(name => {
      const error = validateField(name as keyof T, values[name as keyof T]);
      if (error) {
        newErrors[name as keyof T] = error;
      }
    });
    
    setErrors(newErrors);
    return newErrors;
  }, [validators, values, validateField]);

  // Handle form submission
  const handleSubmit = useCallback(
    async (onSubmit: (values: T) => Promise<void> | void) => {
      return async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        
        setIsSubmitting(true);
        submitCountRef.current += 1;
        
        // Mark all fields as touched to show all errors
        setTouched(
          Object.keys(validators).reduce(
            (acc, key) => ({ ...acc, [key]: true }),
            {}
          )
        );

        const formErrors = validateAll();
        
        if (Object.values(formErrors).some(error => error)) {
          setIsSubmitting(false);
          options?.onError?.(formErrors as any);
          return;
        }

        try {
          await onSubmit(values);
          options?.onSuccess?.();
        } catch (error) {
          console.error('Form submission error:', error);
        } finally {
          setIsSubmitting(false);
        }
      };
    },
    [validators, values, validateAll, options]
  );

  // Reset form to initial state
  const resetForm = useCallback(() => {
    setValues(initialValues);
    setErrors({} as any);
    setTouched({});
    submitCountRef.current = 0;
  }, [initialValues]);

  // Set field value programmatically
  const setFieldValue = useCallback((name: keyof T, value: any) => {
    setValues(prev => ({
      ...prev,
      [name]: value
    }));
  }, []);

  // Set field error programmatically
  const setFieldError = useCallback((name: keyof T, error: string) => {
    setErrors(prev => ({
      ...prev,
      [name]: error
    }));
  }, []);

  // Get field props for input binding
  const getFieldProps = useCallback(
    (name: keyof T) => ({
      name: String(name),
      value: values[name] ?? '',
      onChange: handleChange,
      onBlur: handleBlur,
      error: touched[String(name)] ? errors[name] : undefined,
      'aria-invalid': !!errors[name],
      'aria-describedby': errors[name] ? `${String(name)}-error` : undefined
    }),
    [values, errors, touched, handleChange, handleBlur]
  );

  // Check if form is valid
  const isValid = useCallback(() => {
    return Object.values(errors).every(error => !error);
  }, [errors]);

  // Check if form has been submitted
  const isSubmitted = submitCountRef.current > 0;

  return {
    values,
    errors,
    touched,
    isSubmitting,
    isValid: isValid(),
    isSubmitted,
    handleChange,
    handleBlur,
    handleSubmit,
    resetForm,
    setFieldValue,
    setFieldError,
    getFieldProps,
    validateField,
    validateAll,
  };
}

/**
 * Hook for managing unsaved changes state
 */
export function useUnsavedChanges<T extends Record<string, any>>(
  values: T,
  initialValues: T
) {
  const hasChanges = JSON.stringify(values) !== JSON.stringify(initialValues);

  const handleBeforeUnload = (e: BeforeUnloadEvent) => {
    if (hasChanges) {
      e.preventDefault();
      e.returnValue = '';
    }
  };

  // Use effect to add/remove listener when hasChanges changes
  useEffect(() => {
    if (typeof window !== 'undefined' && hasChanges) {
      window.addEventListener('beforeunload', handleBeforeUnload);
      return () => {
        window.removeEventListener('beforeunload', handleBeforeUnload);
      };
    }
  }, [hasChanges]);

  return { hasChanges };
}

/**
 * Hook for managing debounced validation
 */
export function useDebouncedValidation(
  value: any,
  validator: (value: any) => string | null,
  delay: number = 500
) {
  const [error, setError] = useState<string | null>(null);
  const [isValidating, setIsValidating] = useState(false);
  const timeoutRef = useRef<NodeJS.Timeout | undefined>(undefined);

  const validate = useCallback(() => {
    setIsValidating(true);
    clearTimeout(timeoutRef.current!);

    timeoutRef.current = setTimeout(() => {
      const result = validator(value);
      setError(result);
      setIsValidating(false);
    }, delay);
  }, [value, validator, delay]);

  return { error, isValidating, validate };
}
