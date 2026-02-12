"use client";
import React, { useState, useEffect } from "react";
import Image from "next/image";
import { ChevronLeft, ChevronRight } from "lucide-react";
import Link from "next/link";

interface CarouselSlide {
  id: number;
  image: string;
  title: string;
  subtitle: string;
  buttonText: string;
  buttonLink: string;
  buttonStyle?: "primary" | "secondary";
}

interface HeroCarouselProps {
  slides?: CarouselSlide[];
}

const HeroCarousel: React.FC<HeroCarouselProps> = ({ 
  slides = [
    {
      id: 1,
      image: "/electronics.jpg",
      title: "Summer Sale Collection",
      subtitle: "Up to 50% off on selected items",
      buttonText: "Shop Now",
      buttonLink: "/shop",
      buttonStyle: "primary",
    },
    {
      id: 2,
      image: "/men_fashon.jpg",
      title: "Fashion Forward",
      subtitle: "Discover the latest trends",
      buttonText: "Browse Collection",
      buttonLink: "/shop?category=fashion",
      buttonStyle: "primary",
    },
    {
      id: 3,
      image: "/women_fashon.jpg",
      title: "Exclusive Deals",
      subtitle: "Limited time offers on premium items",
      buttonText: "View Sale",
      buttonLink: "/sale",
      buttonStyle: "secondary",
    },
  ]
}) => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [isAutoPlay, setIsAutoPlay] = useState(true);

  useEffect(() => {
    if (!isAutoPlay) return;

    const interval = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % slides.length);
    }, 5000); // Change slide every 5 seconds

    return () => clearInterval(interval);
  }, [isAutoPlay, slides.length]);

  const goToSlide = (index: number) => {
    setCurrentSlide(index);
    setIsAutoPlay(false);
  };

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % slides.length);
    setIsAutoPlay(false);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + slides.length) % slides.length);
    setIsAutoPlay(false);
  };

  if (slides.length === 0) return null;

  const slide = slides[currentSlide];

  return (
    <section className="relative bg-gray-900 text-white overflow-hidden">
      {/* Carousel slides */}
      <div className="relative h-96 md:h-[500px] w-full">
        {slides.map((s, index) => (
          <div
            key={s.id}
            className={`absolute inset-0 transition-opacity duration-1000 ${
              index === currentSlide ? "opacity-100" : "opacity-0"
            }`}
          >
            <Image
              src={s.image}
              alt={s.title}
              fill
              priority={index === 0}
              quality={85}
              className="object-cover"
              onMouseEnter={() => setIsAutoPlay(false)}
              onMouseLeave={() => setIsAutoPlay(true)}
            />
            {/* Overlay */}
            <div className="absolute inset-0 bg-black/40" />
          </div>
        ))}

        {/* Content overlay */}
        <div className="absolute inset-0 flex items-center justify-center">
          <div className="text-center max-w-2xl px-4">
            <h1 className="text-4xl md:text-6xl font-bold mb-4 animate-fade-in">
              {slide.title}
            </h1>
            <p className="text-lg md:text-2xl mb-8 opacity-90 animate-fade-in">
              {slide.subtitle}
            </p>
            <Link
              href={slide.buttonLink}
              className={`inline-block px-8 py-4 rounded-lg font-semibold transition-colors text-lg ${
                slide.buttonStyle === "secondary"
                  ? "border-2 border-white text-white hover:bg-white hover:text-gray-900"
                  : "bg-white text-gray-900 hover:bg-gray-100"
              }`}
            >
              {slide.buttonText}
            </Link>
          </div>
        </div>

        {/* Navigation buttons */}
        <button
          onClick={prevSlide}
          className="absolute left-4 top-1/2 transform -translate-y-1/2 z-10 bg-white/30 hover:bg-white/50 text-white p-3 rounded-full transition-colors"
          aria-label="Previous slide"
        >
          <ChevronLeft className="h-6 w-6" />
        </button>
        <button
          onClick={nextSlide}
          className="absolute right-4 top-1/2 transform -translate-y-1/2 z-10 bg-white/30 hover:bg-white/50 text-white p-3 rounded-full transition-colors"
          aria-label="Next slide"
        >
          <ChevronRight className="h-6 w-6" />
        </button>

        {/* Slide indicators */}
        <div className="absolute bottom-6 left-1/2 transform -translate-x-1/2 flex gap-2 z-10">
          {slides.map((_, index) => (
            <button
              key={index}
              onClick={() => goToSlide(index)}
              className={`h-3 rounded-full transition-all ${
                index === currentSlide
                  ? "bg-white w-8"
                  : "bg-white/50 w-3 hover:bg-white/70"
              }`}
              aria-label={`Go to slide ${index + 1}`}
            />
          ))}
        </div>
      </div>
    </section>
  );
};

export default HeroCarousel;
