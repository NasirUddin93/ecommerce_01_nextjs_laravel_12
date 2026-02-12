import { apiCall, parseResponse } from './api';

export interface LoginCredentials {
  email: string;
  password: string;
}

export interface AuthResponse {
  status: number;
  token: string;
  id: number;
  name: string;
  email: string;
  role: string;
  message?: string;
  errors?: Record<string, string[]>;
}

export const authService = {
  // Admin login
  async login(credentials: LoginCredentials): Promise<AuthResponse> {
    const response = await apiCall('/admin/login', {
      method: 'POST',
      body: JSON.stringify(credentials),
    });
    
    const data = await parseResponse<AuthResponse>(response);
    
    // Store token in localStorage
    if (data.token) {
      localStorage.setItem('auth_token', data.token);
      localStorage.setItem('user', JSON.stringify({
        id: data.id,
        name: data.name,
        email: data.email,
        role: data.role,
      }));
    }
    
    return data;
  },

  // Logout
  logout() {
    localStorage.removeItem('auth_token');
    localStorage.removeItem('user');
    window.location.href = '/admin/login';
  },

  // Get current user from localStorage
  getCurrentUser() {
    const user = localStorage.getItem('user');
    return user ? JSON.parse(user) : null;
  },

  // Check if user is logged in
  isAuthenticated(): boolean {
    return !!localStorage.getItem('auth_token');
  },
};
