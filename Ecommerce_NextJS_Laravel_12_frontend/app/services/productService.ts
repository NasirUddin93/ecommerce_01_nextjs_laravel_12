import { apiCall, parseResponse } from './api';

export interface Product {
  id: number;
  name: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  category_id: number;
  brand_id: number;
  sku: string;
  status: string;
  images?: Array<{
    id: number;
    image_url: string;
    is_primary: boolean;
  }>;
}

export const productService = {
  // Get all products
  async getAllProducts() {
    const response = await apiCall('/products');
    return parseResponse(response);
  },

  // Get single product by ID
  async getProductById(id: number) {
    const response = await apiCall(`/products/${id}`);
    return parseResponse(response);
  },

  // Create new product (Admin only)
  async createProduct(data: FormData) {
    const response = await apiCall('/products', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
      },
      body: data,
    });
    return parseResponse(response);
  },

  // Update product (Admin only)
  async updateProduct(id: number, data: Partial<Product>) {
    const response = await apiCall(`/products/${id}`, {
      method: 'PUT',
      body: JSON.stringify(data),
    });
    return parseResponse(response);
  },

  // Delete product (Admin only)
  async deleteProduct(id: number) {
    const response = await apiCall(`/products/${id}`, {
      method: 'DELETE',
    });
    return parseResponse(response);
  },
};
