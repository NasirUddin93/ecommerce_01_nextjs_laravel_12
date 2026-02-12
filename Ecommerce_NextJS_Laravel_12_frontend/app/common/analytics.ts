// Analytics utility for tracking page events
declare global {
  interface Window {
    gtag: (...args: any[]) => void;
  }
}

export const trackPageView = (pageName: string) => {
  if (typeof window !== "undefined" && window.gtag) {
    window.gtag("pageview", {
      page_path: pageName,
      page_title: pageName,
    });
  }
};

export const trackEvent = (
  eventName: string,
  eventData?: Record<string, any>
) => {
  if (typeof window !== "undefined" && window.gtag) {
    window.gtag("event", eventName, eventData);
  }
};

export const trackProductView = (productId: number, productName: string, price: number) => {
  trackEvent("view_item", {
    items: [
      {
        item_id: productId,
        item_name: productName,
        price: price,
      },
    ],
  });
};

export const trackAddToCart = (productId: number, productName: string, price: number, quantity: number) => {
  trackEvent("add_to_cart", {
    items: [
      {
        item_id: productId,
        item_name: productName,
        price: price,
        quantity: quantity,
      },
    ],
  });
};

export const trackSearch = (searchTerm: string) => {
  trackEvent("search", {
    search_term: searchTerm,
  });
};

export const trackNewsletterSubscription = (email: string) => {
  trackEvent("newsletter_signup", {
    email: email,
  });
};
