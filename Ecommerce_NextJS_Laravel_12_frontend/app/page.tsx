import HomeClient from "./components/HomeClient";
import { apiUrl, localBaseUrl } from "./common/http";

interface Category {
  id?: number;
  name: string;
  image: string;
  itemCount: number;
}

interface Product {
  id: number;
  category_id: number;
  brand_id: number;
  name: string;
  sku: string;
  description: string;
  base_price: number;
  stock_quantity: number;
  weight: number;
  is_seasonal: boolean;
  seasonal_start_date: Date | string | null;
  seasonal_end_date: Date | string | null;
  images?: { image_url: string }[];
  status?: string;
}

interface Brand {
  id?: number;
  name: string;
  logo: string;
}

const toImageUrl = (path?: string) => {
  if (!path) return "/placeholder.jpg";
  if (path.startsWith("http")) return path;
  return `${localBaseUrl}${path.startsWith("/") ? "" : "/"}${path}`;
};

const normalizeCollection = (data: any) => {
  if (Array.isArray(data)) return data;
  return data?.data || data?.value || [];
};

const fetchJson = async (url: string) => {
  const res = await fetch(url, { cache: "no-store" });
  if (!res.ok) return null;
  return res.json();
};

const fetchNewArrivals = async (): Promise<Product[]> => {
  const data = await fetchJson(`${apiUrl}/products?limit=7`);
  const items = normalizeCollection(data);
  const products = items
    .filter((p: any) => p.status !== "inactive")
    .map((p: any) => ({
      ...p,
      base_price: Number(p.base_price ?? 0),
      images: Array.isArray(p.images) ? p.images.map((img: any) => {
        const imageUrl = img.image_url || img.image_path || img.image;
        console.log('New Arrivals - Product:', p.name, 'Image URL:', imageUrl);
        return { image_url: imageUrl };
      }) : []
    }));
  return products;
};

const fetchBestSellers = async (): Promise<Product[]> => {
  const data = await fetchJson(`${apiUrl}/products/best-sellers?limit=7`);
  const items = normalizeCollection(data);
  return items
    .filter((p: any) => p.status !== "inactive")
    .map((p: any) => ({
      ...p,
      base_price: Number(p.base_price ?? 0),
      images: Array.isArray(p.images) ? p.images.map((img: any) => ({
        image_url: img.image_url || img.image_path || img.image
      })) : []
    }));
};

const fetchCategories = async (): Promise<Category[]> => {
  const data = await fetchJson(`${apiUrl}/categories?limit=4`);
  const items = normalizeCollection(data);
  return items.map((c: any) => ({
    id: c.id,
    name: c.name,
    image: toImageUrl(c.image || c.image_url || c.image_path),
    itemCount: c.product_count ?? c.products_count ?? 0,
  }));
};

const fetchBrands = async (): Promise<Brand[]> => {
  const data = await fetchJson(`${apiUrl}/brands?limit=6`);
  const items = normalizeCollection(data);
  return items.map((b: any) => ({
    id: b.id,
    name: b.name,
    logo: toImageUrl(b.logo || b.image || b.image_url),
  }));
};

const fetchFeaturedProducts = async (): Promise<Product[]> => {
  const data = await fetchJson(`${apiUrl}/products`);
  const items = normalizeCollection(data);
  return items
    .filter((p: any) => p.status !== "inactive")
    .slice(0, 6)
    .map((p: any) => ({
      ...p,
      base_price: Number(p.base_price ?? 0),
      images: Array.isArray(p.images) ? p.images.map((img: any) => ({
        image_url: img.image_url || img.image_path || img.image
      })) : []
    }));
};

export default async function Home() {
  const [newArrivals, bestSellers, categories, brands, featuredProducts] = await Promise.all([
    fetchNewArrivals(),
    fetchBestSellers(),
    fetchCategories(),
    fetchBrands(),
    fetchFeaturedProducts(),
  ]);

  return (
    <HomeClient
      newArrivals={newArrivals}
      bestSellers={bestSellers}
      categories={categories}
      brands={brands}
      featuredProducts={featuredProducts}
    />
  );
}

