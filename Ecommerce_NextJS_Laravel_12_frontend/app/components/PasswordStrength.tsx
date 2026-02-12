'use client';

import React from 'react';

interface PasswordStrengthProps {
  strength: 'weak' | 'fair' | 'good' | 'strong';
  errors: string[];
}

/**
 * Password strength indicator component
 */
export function PasswordStrength({ strength, errors }: PasswordStrengthProps) {
  const strengthConfig = {
    weak: {
      color: 'bg-red-500',
      label: 'Weak',
      labelColor: 'text-red-600'
    },
    fair: {
      color: 'bg-yellow-500',
      label: 'Fair',
      labelColor: 'text-yellow-600'
    },
    good: {
      color: 'bg-blue-500',
      label: 'Good',
      labelColor: 'text-blue-600'
    },
    strong: {
      color: 'bg-green-500',
      label: 'Strong',
      labelColor: 'text-green-600'
    }
  };

  const config = strengthConfig[strength];
  const percentFilled = {
    weak: 25,
    fair: 50,
    good: 75,
    strong: 100
  }[strength];

  return (
    <div className="space-y-2">
      {/* Progress bar */}
      <div className="flex items-center gap-2">
        <div className="flex-1 h-2 bg-gray-200 rounded-full overflow-hidden">
          <div
            className={`h-full ${config.color} transition-all duration-300`}
            style={{ width: `${percentFilled}%` }}
          />
        </div>
        <span className={`text-sm font-medium ${config.labelColor}`}>
          {config.label}
        </span>
      </div>

      {/* Error messages */}
      {errors.length > 0 && (
        <div className="space-y-1">
          {errors.map((error, index) => (
            <div key={index} className="flex items-start gap-2 text-sm text-red-600">
              <span className="flex-shrink-0 mt-0.5">✕</span>
              <span>{error}</span>
            </div>
          ))}
        </div>
      )}

      {/* Requirements checklist (when password is being edited) */}
      {errors.length === 0 && strength !== 'weak' && (
        <div className="flex items-center gap-2 text-sm text-green-600">
          <svg className="w-4 h-4 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
          </svg>
          <span>Password meets all requirements</span>
        </div>
      )}
    </div>
  );
}

/**
 * Password requirements display component
 */
export function PasswordRequirements() {
  const requirements = [
    { label: 'At least 8 characters', pattern: /.{8,}/ },
    { label: 'Uppercase letter (A-Z)', pattern: /[A-Z]/ },
    { label: 'Lowercase letter (a-z)', pattern: /[a-z]/ },
    { label: 'Number (0-9)', pattern: /\d/ },
    { label: 'Special character (!@#$%^&*)', pattern: /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/ }
  ];

  return (
    <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 space-y-2">
      <p className="text-sm font-medium text-blue-900">Password requirements:</p>
      <ul className="space-y-1">
        {requirements.map((req, index) => (
          <li key={index} className="text-sm text-blue-700 flex items-center gap-2">
            <span className="flex-shrink-0">•</span>
            <span>{req.label}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
