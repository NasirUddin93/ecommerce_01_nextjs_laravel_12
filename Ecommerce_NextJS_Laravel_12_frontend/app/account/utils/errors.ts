/**
 * Error handling utilities
 */

export class AppError extends Error {
  constructor(
    public message: string,
    public code: string = 'UNKNOWN_ERROR',
    public details?: any
  ) {
    super(message);
    this.name = 'AppError';
  }
}

export interface ApiErrorResponse {
  success: boolean;
  message: string;
  errors?: Record<string, string>;
  code?: string;
}

export class ApiError extends AppError {
  public statusCode: number;
  public errors: Record<string, string>;

  constructor(
    statusCode: number,
    message: string,
    code: string = 'API_ERROR',
    errors: Record<string, string> = {}
  ) {
    super(message, code, errors);
    this.name = 'ApiError';
    this.statusCode = statusCode;
    this.errors = errors;
  }
}

/**
 * Parse API error response
 */
export function parseApiError(response: Response, data: any): ApiError {
  const message = data?.message || 'An error occurred. Please try again.';
  const code = data?.code || 'API_ERROR';
  const errors = data?.errors || {};

  return new ApiError(response.status, message, code, errors);
}

/**
 * Handle API response errors
 */
export async function handleApiError(response: Response): Promise<ApiError> {
  try {
    const data = await response.json();
    return parseApiError(response, data);
  } catch {
    return new ApiError(
      response.status,
      `HTTP ${response.status}: ${response.statusText}`,
      'API_ERROR'
    );
  }
}

/**
 * Validation error helper
 */
export interface ValidationErrorMap {
  [field: string]: string;
}

export function createValidationError(errors: ValidationErrorMap): AppError {
  const message = Object.values(errors).join(', ');
  return new AppError(message, 'VALIDATION_ERROR', errors);
}

/**
 * Get user-friendly error message
 */
export function getErrorMessage(error: unknown): string {
  if (error instanceof AppError) {
    return error.message;
  }

  if (error instanceof Error) {
    return error.message;
  }

  if (typeof error === 'string') {
    return error;
  }

  return 'An unexpected error occurred. Please try again.';
}

/**
 * Check if error is a specific type
 */
export function isApiError(error: any): error is ApiError {
  return error instanceof ApiError;
}

export function isValidationError(error: any): error is AppError {
  return error instanceof AppError && error.code === 'VALIDATION_ERROR';
}

/**
 * Safe async operation wrapper
 */
export async function safeAsync<T>(
  operation: () => Promise<T>,
  errorHandler?: (error: AppError) => void
): Promise<{ data: T | null; error: AppError | null }> {
  try {
    const data = await operation();
    return { data, error: null };
  } catch (error) {
    const appError = error instanceof AppError
      ? error
      : new AppError(getErrorMessage(error), 'UNKNOWN_ERROR');

    errorHandler?.(appError);
    return { data: null, error: appError };
  }
}

/**
 * Get field-specific error from API response
 */
export function getFieldError(
  errors: Record<string, string> | undefined,
  fieldName: string
): string | null {
  if (!errors) return null;

  // Try exact match first
  if (errors[fieldName]) {
    return errors[fieldName];
  }

  // Try with underscore variant
  const underscoreField = fieldName.replace(/([A-Z])/g, '_$1').toLowerCase();
  if (errors[underscoreField]) {
    return errors[underscoreField];
  }

  return null;
}
