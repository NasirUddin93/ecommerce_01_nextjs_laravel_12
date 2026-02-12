// app/checkout/page.tsx
"use client";

import { useState, useEffect } from 'react';
// import { useCart } from '../../contexts/CartContext';
import { useCart } from '../contexts/CartContext';

import { useRouter } from 'next/navigation';
import { CreditCard, Lock, ArrowLeft, CheckCircle } from 'lucide-react';
import Link from 'next/link';
import { apiUrl } from '../common/http';
import CheckoutModeSelector from '../components/CheckoutModeSelector';
import SocialLoginButtons from '../components/SocialLoginButtons';

interface CheckoutFormData {
  email: string;
  firstName: string;
  lastName: string;
  phone: string;
  address: string;
  city: string;
  state: string;
  zipCode: string;
  country: string;
  division_id: string;
  district_id: string;
  area_id: string;
}

interface Division {
  id: number;
  name: string;
  code: string;
}

interface District {
  id: number;
  name: string;
  code: string;
  division_id: number;
}

interface Area {
  id: number;
  name: string;
  thana_name: string;
  code: string;
  district_id: number;
}

export default function CheckoutPage() {
  const { cartItems, getCartTotal, clearCart } = useCart();
  const router = useRouter();
  const [isProcessing, setIsProcessing] = useState(false);
  const [orderComplete, setOrderComplete] = useState(false);
  const [divisions, setDivisions] = useState<Division[]>([]);
  const [districts, setDistricts] = useState<District[]>([]);
  const [areas, setAreas] = useState<Area[]>([]);
  const [loadingDivisions, setLoadingDivisions] = useState(true);
  const [loadingDistricts, setLoadingDistricts] = useState(false);
  const [loadingAreas, setLoadingAreas] = useState(false);
  
  // Checkout mode state (guest or registered)
  const [checkoutMode, setCheckoutMode] = useState<"guest" | "registered">("guest");
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [showLoginForm, setShowLoginForm] = useState(false);
  
  const [formData, setFormData] = useState<CheckoutFormData>({
    email: '',
    firstName: '',
    lastName: '',
    phone: '',
    address: '',
    city: '',
    state: '',
    zipCode: '',
    country: 'Bangladesh',
    division_id: '',
    district_id: '',
    area_id: '',
  });

  // Check if user is already logged in
  useEffect(() => {
    const authToken = localStorage.getItem('authToken');
    if (authToken) {
      setIsLoggedIn(true);
      // Pre-fill user data from localStorage or API
      const userEmail = localStorage.getItem('userEmail');
      if (userEmail) {
        setFormData(prev => ({ ...prev, email: userEmail }));
      }
    }
  }, []);

  const subtotal = getCartTotal();
  const tax = subtotal * 0.1;
  const total = subtotal + tax;

  // Fetch divisions on mount
  useEffect(() => {
    const fetchDivisions = async () => {
      try {
        setLoadingDivisions(true);
        const response = await fetch(`${apiUrl}/bangladeshi-divisions`);
        const data = await response.json();
        if (data.data) {
          setDivisions(data.data);
        }
      } catch (error) {
        console.error('Error fetching divisions:', error);
      } finally {
        setLoadingDivisions(false);
      }
    };

    fetchDivisions();
  }, []);

  // Fetch districts when division changes
  useEffect(() => {
    if (formData.division_id) {
      const fetchDistricts = async () => {
        try {
          setLoadingDistricts(true);
          const response = await fetch(`${apiUrl}/bangladeshi-districts?division_id=${formData.division_id}`);
          const data = await response.json();
          if (data.data) {
            setDistricts(data.data);
          }
        } catch (error) {
          console.error('Error fetching districts:', error);
        } finally {
          setLoadingDistricts(false);
        }
      };

      fetchDistricts();
      // Reset dependent fields
      setFormData(prev => ({ ...prev, district_id: '', area_id: '', city: '', state: '' }));
      setDistricts([]);
      setAreas([]);
    }
  }, [formData.division_id]);

  // Fetch areas when district changes
  useEffect(() => {
    if (formData.district_id) {
      const fetchAreas = async () => {
        try {
          setLoadingAreas(true);
          const response = await fetch(`${apiUrl}/bangladeshi-areas?district_id=${formData.district_id}`);
          const data = await response.json();
          if (data.data) {
            setAreas(data.data);
          }
        } catch (error) {
          console.error('Error fetching areas:', error);
        } finally {
          setLoadingAreas(false);
        }
      };

      fetchAreas();
      // Reset area field
      setFormData(prev => ({ ...prev, area_id: '' }));
      setAreas([]);
    }
  }, [formData.district_id]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));

    // Update city and state based on location selection
    if (name === 'division_id') {
      const selectedDivision = divisions.find(d => d.id === parseInt(value));
      if (selectedDivision) {
        setFormData(prev => ({ ...prev, state: selectedDivision.name }));
      }
    } else if (name === 'district_id') {
      const selectedDistrict = districts.find(d => d.id === parseInt(value));
      if (selectedDistrict) {
        setFormData(prev => ({ ...prev, city: selectedDistrict.name }));
      }
    } else if (name === 'area_id') {
      const selectedArea = areas.find(a => a.id === parseInt(value));
      if (selectedArea) {
        setFormData(prev => ({ ...prev, zipCode: selectedArea.code }));
      }
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsProcessing(true);

    try {
      if (cartItems.length === 0) {
        alert('Your cart is empty. Please add items before checkout.');
        return;
      }

      // Prepare cart items for API
      const items = cartItems.map(item => ({
        product_id: item.product.id,
        quantity: item.quantity,
        price_at_purchase: Number(item.product.base_price),
      }));

      // Prepare complete order data
      const orderData = {
        customer_name: `${formData.firstName} ${formData.lastName}`,
        customer_email: formData.email,
        customer_phone: formData.phone,
        shipping_address: formData.address,
        city: formData.city,
        state: formData.state || '',
        postal_code: formData.zipCode,
        country: formData.country,
        payment_method: 'cod', // Default to COD, user can change on payment page
        total_amount: total,
        items: items,
        customer_notes: '',
      };
      
      // Save complete order data to localStorage for payment page
      localStorage.setItem('orderData', JSON.stringify(orderData));
      localStorage.setItem('cartItems', JSON.stringify(cartItems));
      
      // Redirect to payment selection page
      router.push('/checkout/payment');
      
    } catch (error) {
      console.error('Checkout error:', error);
      alert('There was an error processing your order. Please try again.');
    } finally {
      setIsProcessing(false);
    }
  };

  if (cartItems.length === 0 && !orderComplete) {
    return (
      <div className="max-w-2xl mx-auto px-4 py-16 text-center">
        <h1 className="text-2xl font-bold text-gray-900 mb-4">Your cart is empty</h1>
        <p className="text-gray-600 mb-8">Add some items to your cart before checking out.</p>
        <Link
          href="/"
          className="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors"
        >
          Continue Shopping
        </Link>
      </div>
    );
  }

  if (orderComplete) {
    return (
      <div className="max-w-2xl mx-auto px-4 py-16 text-center">
        <CheckCircle className="mx-auto h-16 w-16 text-green-500 mb-4" />
        <h1 className="text-2xl font-bold text-gray-900 mb-4">Order Confirmed!</h1>
        <p className="text-gray-600 mb-8">
          Thank you for your purchase. Your order has been successfully processed.
        </p>
        <div className="space-y-4">
          <Link
            href="/"
            className="block bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors"
          >
            Continue Shopping
          </Link>
          <Link
            href="/orders"
            className="block border border-gray-300 text-gray-700 px-6 py-3 rounded-lg font-semibold transition-colors hover:bg-gray-50"
          >
            View Orders
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <Link
        href="/cart"
        className="inline-flex items-center text-blue-600 hover:text-blue-800 mb-6"
      >
        <ArrowLeft className="h-4 w-4 mr-2" />
        Back to Cart
      </Link>

      <h1 className="text-3xl font-bold text-gray-900 mb-8">Checkout</h1>

      {/* Checkout Mode Selector - Show only if not logged in */}
      {!isLoggedIn && (
        <div className="mb-8">
          <CheckoutModeSelector
            checkoutMode={checkoutMode}
            onModeChange={(mode) => {
              setCheckoutMode(mode);
              setShowLoginForm(mode === "registered");
            }}
            isLoggedIn={isLoggedIn}
          />
        </div>
      )}

      {/* Show Login/Register Form if registered mode selected and not logged in */}
      {showLoginForm && !isLoggedIn && (
        <div className="bg-white rounded-lg shadow-sm border p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4">Login or Create Account</h2>
          <p className="text-gray-600 mb-6">
            Please log in to continue with your saved information, or create a new account
          </p>
          <SocialLoginButtons />
          <div className="mt-6 text-center">
            <Link
              href="/login?redirect=/checkout"
              className="inline-block bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
            >
              Go to Login Page
            </Link>
          </div>
        </div>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        {/* Checkout Form */}
        <div className="bg-white rounded-lg shadow-sm border p-6">
          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Contact Information */}
            <div>
              <h2 className="text-lg font-semibold mb-4">Contact Information</h2>
              <div className="space-y-4">
                <input
                  type="email"
                  name="email"
                  placeholder="Email address"
                  required
                  value={formData.email}
                  onChange={handleInputChange}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <input
                  type="tel"
                  name="phone"
                  placeholder="Phone number (e.g., 01712345678)"
                  required
                  value={formData.phone}
                  onChange={handleInputChange}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
            </div>

            {/* Shipping Address */}
            <div>
              <h2 className="text-lg font-semibold mb-4">Shipping Address</h2>
              <div className="grid grid-cols-2 gap-4 mb-4">
                <input
                  type="text"
                  name="firstName"
                  placeholder="First name"
                  required
                  value={formData.firstName}
                  onChange={handleInputChange}
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <input
                  type="text"
                  name="lastName"
                  placeholder="Last name"
                  required
                  value={formData.lastName}
                  onChange={handleInputChange}
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
              <input
                type="text"
                name="address"
                placeholder="Address"
                required
                value={formData.address}
                onChange={handleInputChange}
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4"
              />
              
              {/* Location Dropdowns */}
              <div className="space-y-4 mb-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Division / State <span className="text-red-500">*</span>
                  </label>
                  <select
                    name="division_id"
                    required
                    value={formData.division_id}
                    onChange={handleInputChange}
                    disabled={loadingDivisions}
                    className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">
                      {loadingDivisions ? 'Loading divisions...' : 'Select Division'}
                    </option>
                    {divisions.map(division => (
                      <option key={division.id} value={division.id}>
                        {division.name}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    District / City <span className="text-red-500">*</span>
                  </label>
                  <select
                    name="district_id"
                    required
                    value={formData.district_id}
                    onChange={handleInputChange}
                    disabled={!formData.division_id || loadingDistricts}
                    className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:bg-gray-100"
                  >
                    <option value="">
                      {loadingDistricts ? 'Loading districts...' : 'Select District'}
                    </option>
                    {districts.map(district => (
                      <option key={district.id} value={district.id}>
                        {district.name}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Area / Thana <span className="text-red-500">*</span>
                  </label>
                  <select
                    name="area_id"
                    required
                    value={formData.area_id}
                    onChange={handleInputChange}
                    disabled={!formData.district_id || loadingAreas}
                    className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:bg-gray-100"
                  >
                    <option value="">
                      {loadingAreas ? 'Loading areas...' : 'Select Area'}
                    </option>
                    {areas.map(area => (
                      <option key={area.id} value={area.id}>
                        {area.name} {area.thana_name && `(${area.thana_name})`}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <input
                  type="text"
                  name="city"
                  placeholder="City"
                  required
                  value={formData.city}
                  onChange={handleInputChange}
                  readOnly
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                />
                <input
                  type="text"
                  name="state"
                  placeholder="State"
                  required
                  value={formData.state}
                  onChange={handleInputChange}
                  readOnly
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                />
              </div>
              <div className="grid grid-cols-2 gap-4 mt-4">
                <input
                  type="text"
                  name="zipCode"
                  placeholder="ZIP code"
                  required
                  value={formData.zipCode}
                  onChange={handleInputChange}
                  readOnly
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                />
                <input
                  type="text"
                  name="country"
                  placeholder="Country"
                  required
                  value={formData.country}
                  onChange={handleInputChange}
                  readOnly
                  className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                />
              </div>
            </div>

            {/* Payment Method Notice */}
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <div className="flex items-start">
                <Lock className="h-5 w-5 text-blue-600 mr-2 mt-0.5" />
                <div>
                  <h3 className="font-semibold text-blue-900 mb-1">Secure Payment</h3>
                  <p className="text-sm text-blue-700">
                    You will select your payment method (Cash on Delivery, bKash, Nagad, Rocket) on the next page.
                  </p>
                </div>
              </div>
            </div>

            <button
              type="submit"
              disabled={isProcessing}
              className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white py-3 rounded-lg font-semibold transition-colors flex items-center justify-center"
            >
              {isProcessing ? (
                <>
                  <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                  Saving...
                </>
              ) : (
                'Continue to Payment'
              )}
            </button>
          </form>
        </div>

        {/* Order Summary */}
        <div className="bg-white rounded-lg shadow-sm border p-6 h-fit">
          <h2 className="text-xl font-semibold mb-4">Order Summary</h2>
          
          <div className="space-y-4 mb-6">
            {cartItems.map((item) => (
              <div key={item.product.id} className="flex justify-between items-center">
                <div className="flex items-center space-x-3">
                  <span className="bg-gray-100 px-2 py-1 rounded text-sm">
                    {item.quantity}
                  </span>
                  <span className="text-gray-700">{item.product.name}</span>
                </div>
                <span className="font-semibold">
                  ৳{(Number(item.product.base_price) * item.quantity).toFixed(2)}
                </span>
              </div>
            ))}
          </div>

          <div className="space-y-3 border-t pt-4">
            <div className="flex justify-between">
              <span>Subtotal</span>
              <span>৳{subtotal.toFixed(2)}</span>
            </div>
            <div className="flex justify-between">
              <span>Shipping</span>
              <span>Free</span>
            </div>
            <div className="flex justify-between">
              <span>Tax</span>
              <span>৳{tax.toFixed(2)}</span>
            </div>
            <div className="flex justify-between text-lg font-semibold border-t pt-3">
              <span>Total</span>
              <span>৳{total.toFixed(2)}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}