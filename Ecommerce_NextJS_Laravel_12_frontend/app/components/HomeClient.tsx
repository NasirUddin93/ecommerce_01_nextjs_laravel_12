"use client";

import Layout from "./Layouts";
import Image from "next/image";
import Link from "next/link";
import {
  Truck,
  Shield,
  RefreshCw,
  Star,
  TrendingUp,
  Users,
  MessageCircle,
} from "lucide-react";
import { useEffect, useState } from "react";
import FeaturedProducts from "../featured-products/page";
import NewArrivals from "../new-arrivals-section/page";
import BestSellers from "../best-sellers-section/page";
import { apiUrl } from "../common/http";
import HeroCarousel from "./HeroCarousel";
import { trackPageView } from "../common/analytics";

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

interface Testimonial {
  id: number;
  name: string;
  avatar: string;
  rating: number;
  comment: string;
  date: string;
}

interface Brand {
  id?: number;
  name: string;
  logo: string;
}

interface HomeClientProps {
  newArrivals: Product[];
  bestSellers: Product[];
  categories: Category[];
  brands: Brand[];
  featuredProducts: Product[];
}

export default function HomeClient({
  newArrivals,
  bestSellers,
  categories,
  brands,
  featuredProducts,
}: HomeClientProps) {
  const [email, setEmail] = useState("");
  const [subscribeSuccess, setSubscribeSuccess] = useState(false);
  const [subscribeError, setSubscribeError] = useState("");
  const [subscribeLoading, setSubscribeLoading] = useState(false);
  const [countdown, setCountdown] = useState({ hours: 12, minutes: 34, seconds: 56 });
  const [testimonials, setTestimonials] = useState<Testimonial[]>([]);

  useEffect(() => {
    trackPageView("Home");
  }, []);

  useEffect(() => {
    const fetchTestimonials = async () => {
      try {
        const res = await fetch(`${apiUrl}/reviews?limit=3&sort=latest`);
        const data = await res.json();
        if (data.status === 200 && Array.isArray(data.data)) {
          const reviews = data.data.slice(0, 3).map((r: any) => ({
            id: r.id,
            name: r.user?.name || "Anonymous",
            avatar: r.user?.avatar || "/women_fashon.jpg",
            rating: r.rating || 5,
            comment: r.comment || r.review,
            date: new Date(r.created_at).toLocaleDateString("en-US", {
              year: "numeric",
              month: "short",
              day: "numeric",
            }),
          }));
          setTestimonials(reviews);
          return;
        }
      } catch (error) {
        console.error("Error fetching testimonials:", error);
      }

      setTestimonials([
        {
          id: 1,
          name: "Sarah Johnson",
          avatar: "/women_fashon.jpg",
          rating: 5,
          comment: "Amazing products and fast shipping! I'm very satisfied with my purchase.",
          date: "2 days ago",
        },
        {
          id: 2,
          name: "Mike Chen",
          avatar: "/men_fashon.jpg",
          rating: 5,
          comment: "Great quality and excellent customer service. Highly recommend!",
          date: "1 week ago",
        },
        {
          id: 3,
          name: "Emma Wilson",
          avatar: "/women_fashon.jpg",
          rating: 4,
          comment: "Good variety of products. Will definitely shop here again.",
          date: "2 weeks ago",
        },
      ]);
    };

    fetchTestimonials();
  }, []);

  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown((prev) => {
        let { hours, minutes, seconds } = prev;

        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else if (hours > 0) {
          hours--;
          minutes = 59;
          seconds = 59;
        } else {
          hours = 23;
          minutes = 59;
          seconds = 59;
        }

        return { hours, minutes, seconds };
      });
    }, 1000);

    return () => clearInterval(timer);
  }, []);

  const features = [
    {
      icon: Truck,
      title: "Free Shipping",
      description: "Free shipping on orders over ৳5000",
    },
    {
      icon: Shield,
      title: "Secure Payment",
      description: "100% secure payment processing",
    },
    {
      icon: RefreshCw,
      title: "Easy Returns",
      description: "30-day return policy",
    },
  ];

  const handleNewsletterSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubscribeError("");

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setSubscribeError("Please enter a valid email address");
      return;
    }

    setSubscribeLoading(true);
    try {
      const res = await fetch(`${apiUrl}/newsletter/subscribe`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({ email }),
      });

      const result = await res.json();

      if (res.ok && result.status === 201) {
        setSubscribeSuccess(true);
        setEmail("");
        setTimeout(() => setSubscribeSuccess(false), 3000);
      } else {
        setSubscribeError(result.message || "Failed to subscribe. Please try again.");
      }
    } catch (error) {
      console.error("Newsletter subscription error:", error);
      setSubscribeError("An error occurred. Please try again later.");
    } finally {
      setSubscribeLoading(false);
    }
  };

  return (
    <Layout>
      <HeroCarousel />

      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {features.map((feature, index) => (
              <div key={index} className="text-center">
                <div className="bg-blue-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                  <feature.icon className="h-8 w-8 text-blue-600" />
                </div>
                <h3 className="text-lg font-semibold mb-2">{feature.title}</h3>
                <p className="text-gray-600">{feature.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <NewArrivals products={newArrivals} />

      <BestSellers products={bestSellers} />

      <section className="bg-gradient-to-r from-orange-500 to-red-600 text-gradient-to-r from-orange-500 to-red-600 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-2 gap-8 items-center">
            <div>
              <h2 className="text-4xl font-bold mb-4">Flash Sale!</h2>
              <p className="text-xl mb-6 opacity-90">
                Get up to 70% off on selected items. Limited time offer!
              </p>
              <div className="flex gap-4 mb-6">
                <div className="bg-white text-gray-900 px-4 py-3 rounded-lg text-center">
                  <div className="text-2xl font-bold">{String(countdown.hours).padStart(2, "0")}</div>
                  <div className="text-xs">Hours</div>
                </div>
                <div className="bg-white text-gray-900 px-4 py-3 rounded-lg text-center">
                  <div className="text-2xl font-bold">{String(countdown.minutes).padStart(2, "0")}</div>
                  <div className="text-xs">Minutes</div>
                </div>
                <div className="bg-white text-gray-900 px-4 py-3 rounded-lg text-center">
                  <div className="text-2xl font-bold">{String(countdown.seconds).padStart(2, "0")}</div>
                  <div className="text-xs">Seconds</div>
                </div>
              </div>
              <Link
                href="/sale"
                className="inline-block bg-white text-orange-600 px-8 py-4 rounded-lg font-semibold hover:bg-gray-100 transition-colors"
              >
                Shop Sale Now
              </Link>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-white/10 backdrop-blur-sm p-6 rounded-lg text-center">
                <div className="text-3xl font-bold mb-2">50K+</div>
                <div className="text-sm opacity-90">Happy Customers</div>
              </div>
              <div className="bg-white/10 backdrop-blur-sm p-6 rounded-lg text-center">
                <div className="text-3xl font-bold mb-2">10K+</div>
                <div className="text-sm opacity-90">Products</div>
              </div>
              <div className="bg-white/10 backdrop-blur-sm p-6 rounded-lg text-center">
                <div className="text-3xl font-bold mb-2">100+</div>
                <div className="text-sm opacity-90">Brands</div>
              </div>
              <div className="bg-white/10 backdrop-blur-sm p-6 rounded-lg text-center">
                <div className="text-3xl font-bold mb-2">24/7</div>
                <div className="text-sm opacity-90">Support</div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <FeaturedProducts products={featuredProducts} />

      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Shop by Category</h2>
            <p className="text-lg text-gray-600">Discover products from our main categories</p>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            {categories.map((category, index) => (
              <Link
                key={index}
                href={`/categories/${category.name.toLowerCase().replace(/\s+/g, "-")}`}
                className="group"
              >
                <div className="bg-white rounded-lg shadow-sm hover:shadow-lg transition-shadow overflow-hidden">
                  <div className="aspect-square relative bg-gray-100">
                    <Image
                      src={category.image}
                      alt={category.name}
                      fill
                      className="object-cover object-[20%_10%] group-hover:scale-105 transition-transform"
                    />
                  </div>
                  <div className="p-4">
                    <h3 className="font-semibold text-gray-900 mb-1">{category.name}</h3>
                    <p className="text-sm text-gray-600">{category.itemCount} items</p>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="bg-gray-50 py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-12">
            <div className="flex items-center justify-center gap-2 mb-2">
              <Users className="h-6 w-6 text-blue-600" />
              <h2 className="text-3xl font-bold text-gray-900">What Our Customers Say</h2>
            </div>
            <p className="text-lg text-gray-600">Real reviews from real customers</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {testimonials.map((testimonial) => (
              <div
                key={testimonial.id}
                className="bg-white rounded-lg p-6 shadow-sm hover:shadow-lg transition-shadow border border-gray-100"
              >
                <div className="flex items-center gap-4 mb-4">
                  <div className="relative w-12 h-12 rounded-full overflow-hidden">
                    <Image
                      src={testimonial.avatar}
                      alt={testimonial.name}
                      fill
                      className="object-cover"
                    />
                  </div>
                  <div>
                    <h4 className="font-semibold text-gray-900">{testimonial.name}</h4>
                    <p className="text-sm text-gray-500">{testimonial.date}</p>
                  </div>
                </div>
                <div className="flex items-center gap-1 mb-3">
                  {[...Array(5)].map((_, i) => (
                    <Star
                      key={i}
                      className={`h-5 w-5 ${
                        i < testimonial.rating ? "fill-yellow-400 text-yellow-400" : "text-gray-300"
                      }`}
                    />
                  ))}
                </div>
                <p className="text-gray-700 leading-relaxed">{testimonial.comment}</p>
                <div className="mt-4 flex items-center text-sm text-gray-500">
                  <MessageCircle className="h-4 w-4 mr-1" />
                  <span>Verified Purchase</span>
                </div>
              </div>
            ))}
          </div>

          <div className="text-center mt-12">
            <Link
              href="/reviews"
              className="inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 font-semibold"
            >
              Read More Reviews
              <TrendingUp className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Trusted Brands</h2>
            <p className="text-lg text-gray-600">We partner with the world's leading brands</p>
          </div>

          <div className="grid grid-cols-3 md:grid-cols-6 gap-8 items-center">
            {brands.map((brand, index) => (
              <div
                key={index}
                className="bg-white rounded-lg p-6 flex items-center justify-center shadow-sm hover:shadow-md transition-shadow border border-gray-100"
              >
                <div className="relative w-20 h-20 grayscale hover:grayscale-0 transition-all">
                  <Image
                    src={brand.logo}
                    alt={brand.name}
                    fill
                    className="object-contain"
                  />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="bg-gradient-to-r from-gray-900 to-gray-800 text-white py-16">
        <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl font-bold mb-4">Stay Updated</h2>
          <p className="text-gray-300 mb-8">
            Subscribe to our newsletter for exclusive offers and new product updates
          </p>
          <form onSubmit={handleNewsletterSubmit} className="flex flex-col gap-3 max-w-md mx-auto">
            <div className="flex flex-col sm:flex-row gap-4">
              <input
                type="email"
                placeholder="Enter your email"
                value={email}
                onChange={(e) => {
                  setEmail(e.target.value);
                  setSubscribeError("");
                }}
                className={`flex-1 px-4 py-3 rounded-lg text-gray-900 focus:outline-none focus:ring-2 ${
                  subscribeError ? "focus:ring-red-500" : "focus:ring-blue-500"
                }`}
              />
              <button
                type="submit"
                disabled={subscribeLoading}
                className="bg-blue-600 hover:bg-blue-700 disabled:bg-gray-400 px-6 py-3 rounded-lg font-semibold transition-colors whitespace-nowrap"
              >
                {subscribeLoading ? "Subscribing..." : subscribeSuccess ? "✓ Subscribed" : "Subscribe"}
              </button>
            </div>
            {subscribeError && <p className="text-red-400 text-sm">{subscribeError}</p>}
            {subscribeSuccess && (
              <p className="text-green-400 text-sm">Thank you for subscribing! Check your email for confirmation.</p>
            )}
          </form>
          <p className="text-sm text-gray-400 mt-4">Join 50,000+ subscribers and get exclusive deals</p>
        </div>
      </section>
    </Layout>
  );
}
