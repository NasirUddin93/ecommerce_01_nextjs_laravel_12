export interface ProductForm {
  category_id: string;
  brand_id: string;
  name: string;
  sku: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  weight: number;
  is_seasonal: boolean;
  seasonal_start_date: string;
  seasonal_end_date: string;
  status: "active" | "inactive";
  is_new: boolean;
  is_bestseller: boolean;
  is_featured: boolean;
  sales_count: number;
  rating: number;
  review_count: number;
  featured_image: string;
  display_order: number;
}

export interface Category {
  id: number;
  name: string;
}

export interface Brand {
  id: number;
  name: string;
}


export interface ImagePreview {
  file: File;
  preview: string;
  id: string; // unique identifier for each image
}