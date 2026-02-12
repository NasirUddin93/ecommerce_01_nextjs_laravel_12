import { apiCall, parseResponse } from './api';

export interface Category {
  id: number;
  name: string;
  description?: string;
  slug?: string;
  status?: string;
}

export const categoryService = {
  // Get all categories
  async getAllCategories() {
    const response = await apiCall('/categories');
    return parseResponse(response);
  },

  // Get single category
  async getCategoryById(id: number) {
    const response = await apiCall(`/categories/${id}`);
    return parseResponse(response);
  },

  // Create category (Admin only)
  async createCategory(data: Category) {
    const response = await apiCall('/categories', {
      method: 'POST',
      body: JSON.stringify(data),
    });
    return parseResponse(response);
  },

  // Update category (Admin only)
  async updateCategory(id: number, data: Partial<Category>) {
    const response = await apiCall(`/categories/${id}`, {
      method: 'PUT',
      body: JSON.stringify(data),
    });
    return parseResponse(response);
  },
};
