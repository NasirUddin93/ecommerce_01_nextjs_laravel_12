import Layout from "../components/Layouts";
import { Award, Truck, Shield, Users, Heart, Star } from "lucide-react";

export default function AboutPage() {
  const stats = [
    { label: "Happy Customers", value: "150K+" },
    { label: "Products Sold", value: "500K+" },
    { label: "Years in Business", value: "5+" },
    { label: "Expert Team", value: "50+" },
  ];

  const values = [
    {
      icon: <Award className="w-8 h-8 text-blue-600" />,
      title: "Quality First",
      description: "We're committed to offering only the highest quality products",
    },
    {
      icon: <Truck className="w-8 h-8 text-blue-600" />,
      title: "Fast Shipping",
      description: "Quick and reliable delivery to your doorstep",
    },
    {
      icon: <Shield className="w-8 h-8 text-blue-600" />,
      title: "Secure Shopping",
      description: "Your data and transactions are fully protected",
    },
    {
      icon: <Heart className="w-8 h-8 text-blue-600" />,
      title: "Customer Care",
      description: "Dedicated support team available 24/7",
    },
  ];

  const teamMembers = [
    {
      name: "John Smith",
      role: "Founder & CEO",
      bio: "Visionary leader with 20+ years in retail",
      image: "👨‍💼",
    },
    {
      name: "Sarah Johnson",
      role: "VP Operations",
      bio: "Expert in supply chain and logistics",
      image: "👩‍💼",
    },
    {
      name: "Mike Chen",
      role: "Head of Technology",
      bio: "Tech innovator driving digital transformation",
      image: "👨‍💻",
    },
    {
      name: "Emma Davis",
      role: "Customer Experience Manager",
      bio: "Passionate about customer satisfaction",
      image: "👩‍💼",
    },
  ];

  const testimonials = [
    {
      name: "Jessica Williams",
      role: "Verified Customer",
      text: "Outstanding product quality and incredibly fast shipping. Will definitely shop again!",
      rating: 5,
    },
    {
      name: "Robert Martinez",
      role: "Regular Shopper",
      text: "Great selection and competitive prices. Customer service was very helpful when I had questions.",
      rating: 5,
    },
    {
      name: "Amanda Lee",
      role: "Verified Customer",
      text: "Best shopping experience I've had online. The attention to detail is amazing!",
      rating: 5,
    },
  ];

  return (
    <Layout>
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-blue-600 to-blue-800 text-white py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">About ShopStyle</h1>
          <p className="text-xl md:text-2xl text-blue-100 max-w-2xl mx-auto">
            Redefining e-commerce with quality, trust, and exceptional service
          </p>
        </div>
      </section>

      {/* Company Story Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Our Story</h2>
              <p className="text-gray-600 text-lg mb-4">
                Founded in 2019, ShopStyle started with a simple mission: to make quality shopping accessible to everyone. What began as a small startup has grown into a trusted marketplace serving over 150,000 satisfied customers worldwide.
              </p>
              <p className="text-gray-600 text-lg mb-4">
                We believe that e-commerce should be easy, reliable, and enjoyable. That's why we've built our platform with customer-first thinking at every step, from product selection to delivery.
              </p>
              <p className="text-gray-600 text-lg">
                Today, we're proud to offer thousands of premium products across multiple categories, backed by our commitment to excellence and customer satisfaction.
              </p>
            </div>
            <div className="bg-gradient-to-br from-blue-100 to-blue-50 rounded-lg p-8 text-center">
              <div className="text-6xl mb-4">🏢</div>
              <p className="text-gray-700 font-semibold">Growing Since 2019</p>
              <p className="text-gray-600 mt-2">From startup to trusted marketplace</p>
            </div>
          </div>
        </div>
      </section>

      {/* Mission & Vision Section */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Our Mission & Vision</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
            <div className="bg-white p-8 rounded-lg shadow-lg">
              <h3 className="text-2xl font-bold text-blue-600 mb-4">Our Mission</h3>
              <p className="text-gray-700 text-lg leading-relaxed">
                To provide customers with access to quality products at competitive prices, delivered with exceptional service and care. We're committed to building lasting relationships with our customers and creating a shopping experience that exceeds expectations every time.
              </p>
            </div>
            <div className="bg-white p-8 rounded-lg shadow-lg">
              <h3 className="text-2xl font-bold text-blue-600 mb-4">Our Vision</h3>
              <p className="text-gray-700 text-lg leading-relaxed">
                To become the world's most trusted and customer-centric e-commerce platform. We envision a future where shopping is seamless, sustainable, and rewarding for both customers and partners.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Core Values / Why Choose Us */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Why Choose Us</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {values.map((value, index) => (
              <div key={index} className="text-center p-6">
                <div className="flex justify-center mb-4">{value.icon}</div>
                <h3 className="text-xl font-semibold text-gray-900 mb-2">{value.title}</h3>
                <p className="text-gray-600">{value.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Statistics Section */}
      <section className="py-16 bg-blue-600 text-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-center mb-12">By The Numbers</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {stats.map((stat, index) => (
              <div key={index} className="text-center">
                <div className="text-4xl font-bold mb-2">{stat.value}</div>
                <p className="text-blue-100 text-lg">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Team Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Meet Our Team</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {teamMembers.map((member, index) => (
              <div key={index} className="bg-gray-50 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition">
                <div className="text-6xl text-center py-8 bg-gradient-to-b from-blue-100 to-blue-50">
                  {member.image}
                </div>
                <div className="p-6">
                  <h3 className="text-xl font-bold text-gray-900 mb-1">{member.name}</h3>
                  <p className="text-blue-600 font-semibold text-sm mb-3">{member.role}</p>
                  <p className="text-gray-600 text-sm">{member.bio}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">What Our Customers Say</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {testimonials.map((testimonial, index) => (
              <div key={index} className="bg-white p-8 rounded-lg shadow-lg">
                <div className="flex gap-1 mb-4">
                  {[...Array(testimonial.rating)].map((_, i) => (
                    <Star key={i} className="w-5 h-5 fill-yellow-400 text-yellow-400" />
                  ))}
                </div>
                <p className="text-gray-700 mb-4 italic">"{testimonial.text}"</p>
                <div className="border-t pt-4">
                  <p className="font-semibold text-gray-900">{testimonial.name}</p>
                  <p className="text-gray-600 text-sm">{testimonial.role}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Sustainability Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Our Commitment to Sustainability</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="text-5xl mb-4">🌱</div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Eco-Friendly Packaging</h3>
              <p className="text-gray-600">We use recyclable and biodegradable packaging materials to minimize environmental impact.</p>
            </div>
            <div className="text-center">
              <div className="text-5xl mb-4">🤝</div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Fair Trade Partners</h3>
              <p className="text-gray-600">We work with suppliers who practice fair wages and ethical labor standards.</p>
            </div>
            <div className="text-center">
              <div className="text-5xl mb-4">♻️</div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Carbon Neutral Shipping</h3>
              <p className="text-gray-600">We're committed to offsetting our carbon footprint and supporting green initiatives.</p>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-gradient-to-r from-blue-600 to-blue-800 text-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl font-bold mb-6">Ready to Shop?</h2>
          <p className="text-xl text-blue-100 mb-8 max-w-2xl mx-auto">
            Explore our wide selection of premium products and experience the ShopStyle difference.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="/shop"
              className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition"
            >
              Shop Now
            </a>
            <a
              href="/contact"
              className="border-2 border-white text-white px-8 py-3 rounded-lg font-semibold hover:bg-white hover:bg-opacity-10 transition"
            >
              Contact Us
            </a>
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Get In Touch</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="text-4xl mb-4">📍</div>
              <h3 className="text-lg font-bold text-gray-900 mb-2">Address</h3>
              <p className="text-gray-600">123 Commerce Street<br />New York, NY 10001</p>
            </div>
            <div className="text-center">
              <div className="text-4xl mb-4">📞</div>
              <h3 className="text-lg font-bold text-gray-900 mb-2">Phone</h3>
              <p className="text-gray-600">+1 (800) 123-4567<br />Available 24/7</p>
            </div>
            <div className="text-center">
              <div className="text-4xl mb-4">✉️</div>
              <h3 className="text-lg font-bold text-gray-900 mb-2">Email</h3>
              <p className="text-gray-600">support@shopstyle.com<br />hello@shopstyle.com</p>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  );
}
