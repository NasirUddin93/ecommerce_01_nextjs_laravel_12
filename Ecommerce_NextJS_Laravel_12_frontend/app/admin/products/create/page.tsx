
"use client";

import { useState, useEffect } from "react";
import { apiUrl, adminToken } from "../../../common/http";
import AdminLayout from "../../AdminLayout";
import { ProductForm } from "./ProductForm";
import { Category } from "./ProductForm";
import { Brand } from "./ProductForm";
import { ImagePreview } from "./ProductForm";
import Breadcrumb from "../../components/Breadcrumb";


export default function AddProduct() {
  const [form, setForm] = useState<ProductForm>({
    category_id: "",
    brand_id: "",
    name: "",
    sku: "",
    barcode: "",
    description: "",
    base_price: 0,
    stock_quantity: 0,
    weight: 0,
    is_seasonal: false,
    seasonal_start_date: "",
    seasonal_end_date: "",
    status: "active",
    is_new: false,
    is_bestseller: false,
    is_featured: false,
    sales_count: 0,
    rating: 0,
    review_count: 0,
    featured_image: "",
    display_order: 0,
  });

  const [imagePreviews, setImagePreviews] = useState<ImagePreview[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [brands, setBrands] = useState<Brand[]>([]);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // 📌 Fetch categories & brands on mount
  useEffect(() => {
    const fetchData = async () => {
      try {
        const catRes = await fetch(`${apiUrl}/categories`, {
          headers: { Authorization: `Bearer ${adminToken()}` },
        });
        const catData = await catRes.json();
        setCategories(catData.data || catData);

        const brandRes = await fetch(`${apiUrl}/brands`, {
          headers: { Authorization: `Bearer ${adminToken()}` },
        });
        const brandData = await brandRes.json();
        setBrands(brandData.data || brandData);
      } catch (error) {
        console.error("Error fetching categories/brands:", error);
      }
    };
    fetchData();
  }, []);

  // 📌 Clean up object URLs when component unmounts
  useEffect(() => {
    return () => {
      imagePreviews.forEach((image) => URL.revokeObjectURL(image.preview));
    };
  }, [imagePreviews]);

  // 📌 Handle input change
  const handleChange = (
    e: React.ChangeEvent<
      HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement
    >
  ) => {
    const { name, value, type } = e.target;
    const key = name as keyof ProductForm;

    if (type === "checkbox") {
      const target = e.target as HTMLInputElement;
      setForm({ ...form, [key]: target.checked });
    } else if (type === "number") {
      setForm({ ...form, [key]: value === "" ? 0 : Number(value) });
    } else {
      setForm({ ...form, [key]: value });
    }
  };

  // 📌 Handle image uploads with preview
  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      const newFiles = Array.from(e.target.files);
      const newPreviews: ImagePreview[] = newFiles.map(file => ({
        file,
        preview: URL.createObjectURL(file),
        id: Math.random().toString(36).substr(2, 9) // generate unique id
      }));
      
      setImagePreviews(prev => [...prev, ...newPreviews]);
    }
    // Reset the file input to allow selecting the same files again
    e.target.value = '';
  };

  // 📌 Remove image from preview
  const removeImage = (id: string) => {
    setImagePreviews(prev => {
      const imageToRemove = prev.find(img => img.id === id);
      if (imageToRemove) {
        URL.revokeObjectURL(imageToRemove.preview);
      }
      return prev.filter(img => img.id !== id);
    });
  };

  // 📌 Move image up in the list
  const moveImageUp = (index: number) => {
    if (index === 0) return;
    setImagePreviews(prev => {
      const newPreviews = [...prev];
      [newPreviews[index - 1], newPreviews[index]] = [newPreviews[index], newPreviews[index - 1]];
      return newPreviews;
    });
  };

  // 📌 Move image down in the list
  const moveImageDown = (index: number) => {
    if (index === imagePreviews.length - 1) return;
    setImagePreviews(prev => {
      const newPreviews = [...prev];
      [newPreviews[index], newPreviews[index + 1]] = [newPreviews[index + 1], newPreviews[index]];
      return newPreviews;
    });
  };

  // 📌 Set image as primary (first in list)
  const setAsPrimary = (index: number) => {
    if (index === 0) return;
    setImagePreviews(prev => {
      const newPreviews = [...prev];
      const [movedImage] = newPreviews.splice(index, 1);
      newPreviews.unshift(movedImage);
      return newPreviews;
    });
  };

  // 📌 Submit product with images in single request
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting) return;
    
    setIsSubmitting(true);
    
    try {
      // Create FormData object
      const formData = new FormData();
      
      // Append all product data with proper data types
      formData.append('category_id', form.category_id);
      formData.append('brand_id', form.brand_id);
      formData.append('name', form.name);
      formData.append('sku', form.sku);
      formData.append('barcode', form.barcode);
      formData.append('description', form.description);
      formData.append('base_price', form.base_price.toString());
      formData.append('stock_quantity', form.stock_quantity.toString());
      formData.append('weight', form.weight.toString());
      formData.append('is_seasonal', form.is_seasonal ? '1' : '0');
      formData.append('status', form.status);
      formData.append('is_new', form.is_new ? '1' : '0');
      formData.append('is_bestseller', form.is_bestseller ? '1' : '0');
      formData.append('is_featured', form.is_featured ? '1' : '0');
      formData.append('sales_count', form.sales_count.toString());
      formData.append('rating', form.rating.toString());
      formData.append('review_count', form.review_count.toString());
      formData.append('featured_image', form.featured_image);
      formData.append('display_order', form.display_order.toString());
      
      if (form.is_seasonal) {
        if (form.seasonal_start_date) {
          formData.append('seasonal_start_date', form.seasonal_start_date);
        }
        if (form.seasonal_end_date) {
          formData.append('seasonal_end_date', form.seasonal_end_date);
        }
      }
      
      // Append all images in the order they appear (first image = primary)
      imagePreviews.forEach((imagePreview, index) => {
        formData.append('images[]', imagePreview.file);
      });

      console.log("Submitting FormData:");
      for (let [key, value] of formData.entries()) {
        console.log(key, value instanceof File ? value.name : value);
      }

      // Single API call to create product with images
      const res = await fetch(`${apiUrl}/products`, {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${adminToken()}`,
        },
        body: formData,
      });

      const responseData = await res.json();
      
      if (!res.ok) {
        console.error("Backend error:", responseData);
        alert("Error: " + JSON.stringify(responseData.errors || responseData.message));
        return;
      }

      console.log("Success response:", responseData);
      alert("✅ Product created successfully with images!");
      
      // Reset form
      setForm({
        category_id: "",
        brand_id: "",
        name: "",
        sku: "",
        barcode: "",
        description: "",
        base_price: 0,
        stock_quantity: 0,
        weight: 0,
        is_seasonal: false,
        seasonal_start_date: "",
        seasonal_end_date: "",
        status: "active",
        is_new: false,
        is_bestseller: false,
        is_featured: false,
        sales_count: 0,
        rating: 0,
        review_count: 0,
        featured_image: "",
        display_order: 0,
      });
      
      // Clean up image previews
      imagePreviews.forEach((image) => URL.revokeObjectURL(image.preview));
      setImagePreviews([]);
      
    } catch (err) {
      console.error("Error creating product:", err);
      alert("❌ Error creating product");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <AdminLayout> 
      <div className="p-3 sm:p-4 md:p-6 max-w-4xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Products", href: "/admin/products" },
            { label: "Create Product" },
          ]}
        />
        <h1 className="text-2xl font-bold mb-6">Add Product</h1>
        
        <form onSubmit={handleSubmit} className="grid grid-cols-1 md:grid-cols-2 gap-6">
          
          {/* Left Column - Product Details */}
          <div className="space-y-4">
            {/* Category Dropdown */}
            <div>
              <label className="block text-sm font-medium mb-1">Category</label>
              <select
                name="category_id"
                value={form.category_id}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                required
              >
                <option value="">-- Select Category --</option>
                {categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>
                    {cat.name}
                  </option>
                ))}
              </select>
            </div>

            {/* Brand Dropdown */}
            <div>
              <label className="block text-sm font-medium mb-1">Brand</label>
              <select
                name="brand_id"
                value={form.brand_id}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                required
              >
                <option value="">-- Select Brand --</option>
                {brands.map((brand) => (
                  <option key={brand.id} value={brand.id}>
                    {brand.name}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium mb-1">Product Name</label>
              <input 
                name="name" 
                placeholder="Enter product name" 
                value={form.name} 
                onChange={handleChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                required 
              />
            </div>
            
            <div>
              <label className="block text-sm font-medium mb-1">SKU</label>
              <input 
                name="sku" 
                placeholder="Enter SKU" 
                value={form.sku} 
                onChange={handleChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                required 
              />
            </div>

            <div>
              <label className="block text-sm font-medium mb-1">Barcode (EAN/UPC)</label>
              <input 
                name="barcode" 
                placeholder="Enter barcode or EAN/UPC code" 
                value={form.barcode} 
                onChange={handleChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono" 
              />
              <p className="text-xs text-gray-500 mt-1">Optional: Product barcode (EAN-13, UPC-A, etc.)</p>
            </div>
            
            <div>
              <label className="block text-sm font-medium mb-1">Description</label>
              <textarea 
                name="description" 
                placeholder="Enter product description" 
                value={form.description} 
                onChange={handleChange} 
                rows={3}
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
              />
            </div>
            
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium mb-1">Base Price ($)</label>
                <input 
                  type="number" 
                  name="base_price" 
                  placeholder="0.00" 
                  value={form.base_price} 
                  onChange={handleChange} 
                  className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                  step="0.01"
                  min="0"
                  required 
                />
              </div>
              
              <div>
                <label className="block text-sm font-medium mb-1">Stock Quantity</label>
                <input 
                  type="number" 
                  name="stock_quantity" 
                  placeholder="0" 
                  value={form.stock_quantity} 
                  onChange={handleChange} 
                  className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                  min="0"
                  required 
                />
              </div>
            </div>
            
            <div>
              <label className="block text-sm font-medium mb-1">Weight (kg)</label>
              <input 
                type="number" 
                name="weight" 
                placeholder="0.00" 
                value={form.weight} 
                onChange={handleChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                step="0.01" 
                min="0"
              />
            </div>

            <div className="flex items-center gap-2 p-3 border border-gray-300 rounded-lg">
              <input
                type="checkbox"
                name="is_seasonal"
                checked={form.is_seasonal}
                onChange={handleChange}
                className="w-4 h-4 text-blue-600 rounded focus:ring-blue-500"
              />
              <label className="text-sm font-medium">Seasonal Product?</label>
            </div>

            {form.is_seasonal && (
              <div className="grid grid-cols-2 gap-4 p-3 border border-gray-300 rounded-lg bg-gray-50">
                <div>
                  <label className="block text-sm font-medium mb-1">Start Date</label>
                  <input
                    type="date"
                    name="seasonal_start_date"
                    value={form.seasonal_start_date}
                    onChange={handleChange}
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium mb-1">End Date</label>
                  <input
                    type="date"
                    name="seasonal_end_date"
                    value={form.seasonal_end_date}
                    onChange={handleChange}
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
              </div>
            )}

            <div>
              <label className="block text-sm font-medium mb-1">Status</label>
              <select
                name="status"
                value={form.status}
                onChange={handleChange}
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              >
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
              </select>
            </div>

            {/* Feature Flags Section */}
            <div className="p-3 border border-yellow-300 rounded-lg bg-yellow-50">
              <h3 className="font-semibold text-sm mb-3 text-yellow-900">Product Features</h3>
              
              <div className="space-y-2">
                <div className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    name="is_new"
                    checked={form.is_new}
                    onChange={handleChange}
                    className="w-4 h-4 text-blue-600 rounded focus:ring-blue-500"
                  />
                  <label className="text-sm font-medium">Mark as New Arrival</label>
                </div>

                <div className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    name="is_bestseller"
                    checked={form.is_bestseller}
                    onChange={handleChange}
                    className="w-4 h-4 text-blue-600 rounded focus:ring-blue-500"
                  />
                  <label className="text-sm font-medium">Mark as Best Seller</label>
                </div>

                <div className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    name="is_featured"
                    checked={form.is_featured}
                    onChange={handleChange}
                    className="w-4 h-4 text-blue-600 rounded focus:ring-blue-500"
                  />
                  <label className="text-sm font-medium">Mark as Featured</label>
                </div>
              </div>
            </div>

            {/* Metrics Section */}
            <div className="p-3 border border-purple-300 rounded-lg bg-purple-50">
              <h3 className="font-semibold text-sm mb-3 text-purple-900">Product Metrics</h3>
              
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium mb-1">Sales Count</label>
                  <input 
                    type="number" 
                    name="sales_count" 
                    placeholder="0" 
                    value={form.sales_count} 
                    onChange={handleChange} 
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                    min="0"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">Rating (0-5)</label>
                  <input 
                    type="number" 
                    name="rating" 
                    placeholder="0.00" 
                    value={form.rating} 
                    onChange={handleChange} 
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                    step="0.01"
                    min="0"
                    max="5"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">Review Count</label>
                  <input 
                    type="number" 
                    name="review_count" 
                    placeholder="0" 
                    value={form.review_count} 
                    onChange={handleChange} 
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                    min="0"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">Display Order</label>
                  <input 
                    type="number" 
                    name="display_order" 
                    placeholder="0" 
                    value={form.display_order} 
                    onChange={handleChange} 
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
                    min="0"
                  />
                </div>
              </div>
            </div>

            {/* Featured Image Section */}
            <div>
              <label className="block text-sm font-medium mb-1">Featured Image URL</label>
              <input 
                type="text" 
                name="featured_image" 
                placeholder="Path to featured image" 
                value={form.featured_image} 
                onChange={handleChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" 
              />
              <p className="text-xs text-gray-500 mt-1">Path relative to storage folder (e.g., products/image.jpg)</p>
            </div>
          </div>

          {/* Right Column - Image Upload & Preview */}
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium mb-2">Product Images</label>
              <input 
                type="file" 
                multiple 
                onChange={handleImageChange} 
                className="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100" 
                accept="image/jpg,image/jpeg,image/png,image/webp"
              />
              <p className="text-xs text-gray-500 mt-1">Select multiple images. First image will be set as primary.</p>
            </div>
            
            {/* Image Previews */}
            {imagePreviews.length > 0 && (
              <div className="border border-gray-300 rounded-lg p-4">
                <h3 className="text-sm font-medium mb-3">
                  Image Previews ({imagePreviews.length})
                  <span className="text-xs text-green-600 ml-2">
                    • First image is primary
                  </span>
                </h3>
                
                <div className="space-y-3 max-h-96 overflow-y-auto">
                  {imagePreviews.map((image, index) => (
                    <div 
                      key={image.id} 
                      className={`flex items-center gap-3 p-3 border rounded-lg ${
                        index === 0 ? 'border-green-500 bg-green-50' : 'border-gray-200'
                      }`}
                    >
                      {/* Image */}
                      <div className="flex-shrink-0 w-16 h-16 border rounded overflow-hidden">
                        <img 
                          src={image.preview} 
                          alt={`Preview ${index + 1}`}
                          className="w-full h-full object-cover"
                        />
                      </div>
                      
                      {/* Image Info */}
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium truncate">
                          {image.file.name}
                        </p>
                        <p className="text-xs text-gray-500">
                          {(image.file.size / 1024).toFixed(1)} KB
                        </p>
                        {index === 0 && (
                          <span className="inline-block px-2 py-1 text-xs bg-green-100 text-green-800 rounded mt-1">
                            Primary
                          </span>
                        )}
                      </div>
                      
                      {/* Action Buttons */}
                      <div className="flex flex-col gap-1">
                        {index !== 0 && (
                          <button
                            type="button"
                            onClick={() => setAsPrimary(index)}
                            className="px-2 py-1 text-xs bg-blue-500 text-white rounded hover:bg-blue-600"
                            title="Set as primary"
                          >
                            ⭐
                          </button>
                        )}
                        <div className="flex gap-1">
                          <button
                            type="button"
                            onClick={() => moveImageUp(index)}
                            disabled={index === 0}
                            className="px-2 py-1 text-xs bg-gray-500 text-white rounded hover:bg-gray-600 disabled:opacity-50 disabled:cursor-not-allowed"
                            title="Move up"
                          >
                            ↑
                          </button>
                          <button
                            type="button"
                            onClick={() => moveImageDown(index)}
                            disabled={index === imagePreviews.length - 1}
                            className="px-2 py-1 text-xs bg-gray-500 text-white rounded hover:bg-gray-600 disabled:opacity-50 disabled:cursor-not-allowed"
                            title="Move down"
                          >
                            ↓
                          </button>
                        </div>
                        <button
                          type="button"
                          onClick={() => removeImage(image.id)}
                          className="px-2 py-1 text-xs bg-red-500 text-white rounded hover:bg-red-600"
                          title="Remove image"
                        >
                          ×
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}
            
            {/* Submit Button */}
            <button 
              type="submit" 
              disabled={isSubmitting}
              className="w-full bg-blue-500 text-white p-3 rounded-lg hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed font-medium"
            >
              {isSubmitting ? 'Creating Product...' : 'Add Product'}
            </button>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}