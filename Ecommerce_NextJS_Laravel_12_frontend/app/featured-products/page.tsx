import { apiUrl } from "../common/http";
import FeaturedProductsClient from "./client";

export interface Product {
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
  seasonal_start_date: string | Date | null;
  seasonal_end_date: string | Date | null;
  images?: { image_url: string }[];
  status?: string;
}

const normalizeCollection = (data: unknown) => {
  if (Array.isArray(data)) return data;
  const obj = data as Record<string, unknown>;
  return (Array.isArray(obj?.data) ? obj.data : Array.isArray(obj?.value) ? obj.value : []) as unknown[];
};

const fetchJson = async (url: string) => {
  const res = await fetch(url, { cache: "no-store" });
  if (!res.ok) return null;
  return res.json();
};

const fetchFeaturedProducts = async (): Promise<Product[]> => {
  const data = await fetchJson(`${apiUrl}/products/featured?limit=20`);
  const items = normalizeCollection(data);
  return (items as Record<string, unknown>[])
    .filter((p: Record<string, unknown>) => p.status !== "inactive")
    .map((p: Record<string, unknown>) => ({
      ...p,
      base_price: Number(p.base_price ?? 0),
      images: Array.isArray(p.images) ? (p.images as Record<string, unknown>[]).map((img: Record<string, unknown>) => ({
        image_url: (img?.image_url || img?.image_path || img?.image) as string
      })) : []
    })) as Product[];
};

export default async function FeaturedProductsPage() {
  const products = await fetchFeaturedProducts();

  return <FeaturedProductsClient products={products} />;
}