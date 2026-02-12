'use client';

import React from 'react';

interface FormErrorProps {
  error?: string;
  className?: string;
}

/**
 * Form error message component
 */
export function FormError({ error, className = '' }: FormErrorProps) {
  if (!error) return null;

  return (
    <div className={`flex items-start gap-2 text-sm text-red-600 mt-1 ${className}`}>
      <svg className="w-4 h-4 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
        <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
      </svg>
      <span>{error}</span>
    </div>
  );
}

interface FormFieldProps {
  label: string;
  error?: string;
  required?: boolean;
  hint?: string;
  children: React.ReactNode;
}

/**
 * Reusable form field wrapper with label and error message
 */
export function FormField({ label, error, required, hint, children }: FormFieldProps) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-2">
        {label}
        {required && <span className="text-red-600 ml-1">*</span>}
      </label>
      {children}
      {error && <FormError error={error} />}
      {hint && !error && (
        <p className="text-xs text-gray-500 mt-1">{hint}</p>
      )}
    </div>
  );
}

interface FormInputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  label: string;
  error?: string;
  required?: boolean;
  hint?: string;
  icon?: React.ReactNode;
}

/**
 * Reusable form input component
 */
export const FormInput = React.forwardRef<HTMLInputElement, FormInputProps>(
  ({ label, error, required, hint, icon, className = '', ...props }, ref) => {
    return (
      <FormField label={label} error={error} required={required} hint={hint}>
        <div className="relative">
          {icon && (
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <div className="text-gray-400">{icon}</div>
            </div>
          )}
          <input
            ref={ref}
            className={`w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 ${
              error ? 'border-red-500' : ''
            } ${icon ? 'pl-10' : ''} ${className}`}
            {...props}
          />
        </div>
      </FormField>
    );
  }
);

FormInput.displayName = 'FormInput';

interface FormSelectProps
  extends React.SelectHTMLAttributes<HTMLSelectElement> {
  label: string;
  error?: string;
  required?: boolean;
  hint?: string;
  options: Array<{
    value: string;
    label: string;
  }>;
}

/**
 * Reusable form select component
 */
export const FormSelect = React.forwardRef<HTMLSelectElement, FormSelectProps>(
  ({ label, error, required, hint, options, className = '', ...props }, ref) => {
    return (
      <FormField label={label} error={error} required={required} hint={hint}>
        <select
          ref={ref}
          className={`w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 ${
            error ? 'border-red-500' : ''
          } ${className}`}
          {...props}
        >
          <option value="">-- Select --</option>
          {options.map((option) => (
            <option key={option.value} value={option.value}>
              {option.label}
            </option>
          ))}
        </select>
      </FormField>
    );
  }
);

FormSelect.displayName = 'FormSelect';

interface FormTextareaProps
  extends React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  label: string;
  error?: string;
  required?: boolean;
  hint?: string;
}

/**
 * Reusable form textarea component
 */
export const FormTextarea = React.forwardRef<HTMLTextAreaElement, FormTextareaProps>(
  ({ label, error, required, hint, className = '', ...props }, ref) => {
    return (
      <FormField label={label} error={error} required={required} hint={hint}>
        <textarea
          ref={ref}
          className={`w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none ${
            error ? 'border-red-500' : ''
          } ${className}`}
          {...props}
        />
      </FormField>
    );
  }
);

FormTextarea.displayName = 'FormTextarea';

/**
 * Form validation summary (displays all errors at once)
 */
interface FormSummaryProps {
  errors: Record<string, string>;
}

export function FormErrorSummary({ errors }: FormSummaryProps) {
  const errorList = Object.entries(errors)
    .filter(([_, error]) => error)
    .map(([field, error]) => ({ field, error }));

  if (errorList.length === 0) return null;

  return (
    <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
      <div className="flex gap-3">
        <svg className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
          <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clipRule="evenodd" />
        </svg>
        <div className="flex-1">
          <h3 className="text-sm font-medium text-red-800 mb-2">Please fix the following errors:</h3>
          <ul className="space-y-1">
            {errorList.map(({ field, error }) => (
              <li key={field} className="text-sm text-red-700">
                <strong>{field}:</strong> {error}
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
}
