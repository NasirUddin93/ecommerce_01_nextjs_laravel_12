"use client";
import Layout from "../components/Layouts";
import { Mail, Phone, MapPin, Clock, MessageCircle, Headphones, Package, CreditCard, HelpCircle, CheckCircle } from "lucide-react";
import { useState } from "react";

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    subject: '',
    department: 'general',
    message: ''
  });

  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle form submission
    setSubmitted(true);
    setTimeout(() => setSubmitted(false), 3000);
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const contactMethods = [
    {
      icon: <Phone className="w-6 h-6" />,
      title: "Phone Support",
      description: "Speak with our team",
      details: "+1 (800) 123-4567",
      availability: "24/7 Available"
    },
    {
      icon: <Mail className="w-6 h-6" />,
      title: "Email Support",
      description: "Send us an email",
      details: "support@shopstyle.com",
      availability: "Response in 2-4 hours"
    },
    {
      icon: <MessageCircle className="w-6 h-6" />,
      title: "Live Chat",
      description: "Chat with us now",
      details: "Click to start chat",
      availability: "Online Now"
    },
    {
      icon: <MapPin className="w-6 h-6" />,
      title: "Visit Us",
      description: "Come to our office",
      details: "123 Commerce St, NY",
      availability: "Mon-Fri: 9AM-6PM"
    }
  ];

  const departments = [
    {
      icon: <Package className="w-8 h-8 text-blue-600" />,
      title: "Order Support",
      description: "Track orders, shipping questions, delivery issues",
      email: "orders@shopstyle.com",
      phone: "+1 (800) 123-4567"
    },
    {
      icon: <CreditCard className="w-8 h-8 text-green-600" />,
      title: "Payment & Billing",
      description: "Payment issues, refunds, invoice requests",
      email: "billing@shopstyle.com",
      phone: "+1 (800) 123-4568"
    },
    {
      icon: <Headphones className="w-8 h-8 text-purple-600" />,
      title: "Technical Support",
      description: "Website issues, account problems, technical help",
      email: "tech@shopstyle.com",
      phone: "+1 (800) 123-4569"
    },
    {
      icon: <HelpCircle className="w-8 h-8 text-orange-600" />,
      title: "General Inquiries",
      description: "Product questions, partnerships, other inquiries",
      email: "hello@shopstyle.com",
      phone: "+1 (800) 123-4570"
    }
  ];

  const faqs = [
    {
      question: "What are your customer service hours?",
      answer: "Our customer service is available 24/7 via phone and email. Live chat is available Mon-Fri 9AM-6PM EST."
    },
    {
      question: "How long does it take to get a response?",
      answer: "Email responses typically take 2-4 hours. Phone and live chat support is immediate."
    },
    {
      question: "Can I track my order?",
      answer: "Yes! You can track your order anytime using your order number on our Order Tracking page."
    },
    {
      question: "What is your return policy?",
      answer: "We offer 30-day returns on most items. Visit our Returns page for complete details."
    }
  ];

  return (
    <Layout>
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-blue-600 to-blue-800 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Contact Us</h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto">
            We're here to help! Get in touch with our team 24/7
          </p>
        </div>
      </section>

      {/* Contact Methods Cards */}
      <section className="py-12 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {contactMethods.map((method, index) => (
              <div key={index} className="bg-white rounded-lg p-6 shadow-lg hover:shadow-xl transition">
                <div className="flex items-center justify-center w-12 h-12 bg-blue-100 rounded-full text-blue-600 mb-4">
                  {method.icon}
                </div>
                <h3 className="text-lg font-bold text-gray-900 mb-2">{method.title}</h3>
                <p className="text-gray-600 text-sm mb-2">{method.description}</p>
                <p className="text-blue-600 font-semibold mb-1">{method.details}</p>
                <p className="text-green-600 text-xs font-medium">{method.availability}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Main Content: Form + Info */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
            {/* Contact Form */}
            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Send Us a Message</h2>
              <p className="text-gray-600 mb-8">Fill out the form below and we'll get back to you as soon as possible.</p>
              
              {submitted && (
                <div className="bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-lg mb-6 flex items-center gap-2">
                  <CheckCircle className="w-5 h-5" />
                  <span>Message sent successfully! We'll respond within 2-4 hours.</span>
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Full Name *</label>
                    <input
                      type="text"
                      name="name"
                      value={formData.name}
                      onChange={handleChange}
                      required
                      className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                      placeholder="John Doe"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Email Address *</label>
                    <input
                      type="email"
                      name="email"
                      value={formData.email}
                      onChange={handleChange}
                      required
                      className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                      placeholder="john@example.com"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Phone Number</label>
                    <input
                      type="tel"
                      name="phone"
                      value={formData.phone}
                      onChange={handleChange}
                      className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                      placeholder="+1 (555) 000-0000"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Department *</label>
                    <select
                      name="department"
                      value={formData.department}
                      onChange={handleChange}
                      required
                      className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value="general">General Inquiry</option>
                      <option value="orders">Order Support</option>
                      <option value="billing">Payment & Billing</option>
                      <option value="technical">Technical Support</option>
                      <option value="returns">Returns & Refunds</option>
                      <option value="wholesale">Wholesale/Business</option>
                    </select>
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Subject *</label>
                  <input
                    type="text"
                    name="subject"
                    value={formData.subject}
                    onChange={handleChange}
                    required
                    className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                    placeholder="How can we help you?"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Message *</label>
                  <textarea
                    name="message"
                    value={formData.message}
                    onChange={handleChange}
                    required
                    rows={6}
                    className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                    placeholder="Please provide details about your inquiry..."
                  ></textarea>
                </div>

                <button
                  type="submit"
                  className="w-full bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 font-medium transition-colors flex items-center justify-center gap-2"
                >
                  <Mail className="w-5 h-5" />
                  Send Message
                </button>
              </form>
            </div>

            {/* Contact Information */}
            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Contact Information</h2>
              
              {/* Response Time */}
              <div className="bg-green-50 border border-green-200 rounded-lg p-6 mb-8">
                <div className="flex items-start gap-3">
                  <Clock className="w-6 h-6 text-green-600 mt-1" />
                  <div>
                    <h3 className="font-bold text-gray-900 mb-2">Quick Response Time</h3>
                    <p className="text-gray-700 text-sm mb-2">We're committed to responding quickly:</p>
                    <ul className="space-y-1 text-sm text-gray-600">
                      <li>• Live Chat: Immediate</li>
                      <li>• Phone: Immediate</li>
                      <li>• Email: 2-4 hours</li>
                      <li>• Social Media: Within 1 hour</li>
                    </ul>
                  </div>
                </div>
              </div>

              {/* Business Hours */}
              <div className="bg-white border border-gray-200 rounded-lg p-6 mb-8">
                <h3 className="font-bold text-gray-900 mb-4 flex items-center gap-2">
                  <Clock className="w-5 h-5 text-blue-600" />
                  Business Hours
                </h3>
                <div className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <span className="text-gray-600">Monday - Friday:</span>
                    <span className="font-semibold text-gray-900">9:00 AM - 6:00 PM EST</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Saturday:</span>
                    <span className="font-semibold text-gray-900">10:00 AM - 4:00 PM EST</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Sunday:</span>
                    <span className="font-semibold text-gray-900">Closed</span>
                  </div>
                  <div className="pt-2 border-t mt-3">
                    <span className="text-green-600 font-semibold">24/7 Phone & Email Support Available</span>
                  </div>
                </div>
              </div>

              {/* Office Address */}
              <div className="bg-white border border-gray-200 rounded-lg p-6">
                <h3 className="font-bold text-gray-900 mb-4 flex items-center gap-2">
                  <MapPin className="w-5 h-5 text-blue-600" />
                  Office Address
                </h3>
                <p className="text-gray-700 mb-2">ShopStyle Headquarters</p>
                <p className="text-gray-600">123 Commerce Street</p>
                <p className="text-gray-600">New York, NY 10001</p>
                <p className="text-gray-600">United States</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Department-Specific Contacts */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Contact by Department</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {departments.map((dept, index) => (
              <div key={index} className="bg-white rounded-lg p-6 shadow-lg">
                <div className="flex items-start gap-4">
                  <div className="flex-shrink-0">{dept.icon}</div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-gray-900 mb-2">{dept.title}</h3>
                    <p className="text-gray-600 text-sm mb-4">{dept.description}</p>
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm">
                        <Mail className="w-4 h-4 text-gray-400" />
                        <a href={`mailto:${dept.email}`} className="text-blue-600 hover:text-blue-700">
                          {dept.email}
                        </a>
                      </div>
                      <div className="flex items-center gap-2 text-sm">
                        <Phone className="w-4 h-4 text-gray-400" />
                        <a href={`tel:${dept.phone}`} className="text-blue-600 hover:text-blue-700">
                          {dept.phone}
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Map Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Find Us on the Map</h2>
          <div className="bg-gray-200 rounded-lg overflow-hidden" style={{ height: '400px' }}>
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d193595.15830869428!2d-74.119763973046!3d40.69766374874431!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2s!4v1234567890123!5m2!1sen!2s"
              width="100%"
              height="100%"
              style={{ border: 0 }}
              allowFullScreen
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>
      </section>

      {/* FAQ Section */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-4">Quick Help & FAQs</h2>
          <p className="text-center text-gray-600 mb-12">Find answers to common questions before contacting us</p>
          <div className="space-y-6">
            {faqs.map((faq, index) => (
              <div key={index} className="bg-white rounded-lg p-6 shadow-sm border border-gray-200">
                <h3 className="text-lg font-bold text-gray-900 mb-2 flex items-start gap-2">
                  <HelpCircle className="w-5 h-5 text-blue-600 mt-1 flex-shrink-0" />
                  {faq.question}
                </h3>
                <p className="text-gray-700 ml-7">{faq.answer}</p>
              </div>
            ))}
          </div>
          <div className="text-center mt-8">
            <a
              href="/help"
              className="inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 font-semibold"
            >
              View All FAQs
              <span>→</span>
            </a>
          </div>
        </div>
      </section>

      {/* Alternative Support Options */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Other Ways to Get Help</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <a href="/orders/track" className="bg-gray-50 rounded-lg p-6 text-center hover:shadow-lg transition border border-gray-200">
              <Package className="w-12 h-12 text-blue-600 mx-auto mb-4" />
              <h3 className="text-lg font-bold text-gray-900 mb-2">Track Your Order</h3>
              <p className="text-gray-600 text-sm">Check your order status anytime</p>
            </a>
            <a href="/help" className="bg-gray-50 rounded-lg p-6 text-center hover:shadow-lg transition border border-gray-200">
              <HelpCircle className="w-12 h-12 text-blue-600 mx-auto mb-4" />
              <h3 className="text-lg font-bold text-gray-900 mb-2">Help Center</h3>
              <p className="text-gray-600 text-sm">Browse our knowledge base</p>
            </a>
            <a href="/returns" className="bg-gray-50 rounded-lg p-6 text-center hover:shadow-lg transition border border-gray-200">
              <CreditCard className="w-12 h-12 text-blue-600 mx-auto mb-4" />
              <h3 className="text-lg font-bold text-gray-900 mb-2">Returns Portal</h3>
              <p className="text-gray-600 text-sm">Start a return or exchange</p>
            </a>
          </div>
        </div>
      </section>

      {/* Trust Elements */}
      <section className="py-16 bg-gradient-to-r from-blue-600 to-blue-800 text-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-center mb-12">Our Customer Service Promise</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="text-5xl font-bold mb-2">98%</div>
              <p className="text-blue-100">Customer Satisfaction Rate</p>
            </div>
            <div className="text-center">
              <div className="text-5xl font-bold mb-2">&lt;2hrs</div>
              <p className="text-blue-100">Average Response Time</p>
            </div>
            <div className="text-center">
              <div className="text-5xl font-bold mb-2">24/7</div>
              <p className="text-blue-100">Support Availability</p>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  );
}