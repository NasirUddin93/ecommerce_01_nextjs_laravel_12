/**
 * Smart caching utility with TTL and invalidation
 */

import { CacheEntry } from '../types';

class CacheManager {
  private cache: Map<string, CacheEntry<any>> = new Map();
  
  /**
   * Set cache entry with TTL (time to live in milliseconds)
   */
  set<T>(key: string, data: T, ttl: number = 3600000): void {
    this.cache.set(key, {
      data,
      timestamp: Date.now(),
      ttl
    });
  }
  
  /**
   * Get cache entry if not expired
   */
  get<T>(key: string): T | null {
    const entry = this.cache.get(key);
    
    if (!entry) {
      return null;
    }
    
    const age = Date.now() - entry.timestamp;
    
    if (age > entry.ttl) {
      this.cache.delete(key);
      return null;
    }
    
    return entry.data as T;
  }
  
  /**
   * Check if cache entry exists and is not expired
   */
  has(key: string): boolean {
    const entry = this.cache.get(key);
    
    if (!entry) {
      return false;
    }
    
    const age = Date.now() - entry.timestamp;
    
    if (age > entry.ttl) {
      this.cache.delete(key);
      return false;
    }
    
    return true;
  }
  
  /**
   * Get remaining TTL in milliseconds
   */
  getTTL(key: string): number | null {
    const entry = this.cache.get(key);
    
    if (!entry) {
      return null;
    }
    
    const remaining = entry.ttl - (Date.now() - entry.timestamp);
    
    return remaining > 0 ? remaining : null;
  }
  
  /**
   * Remove cache entry
   */
  remove(key: string): void {
    this.cache.delete(key);
  }
  
  /**
   * Clear all cache entries matching pattern
   */
  clear(pattern?: string): void {
    if (!pattern) {
      this.cache.clear();
      return;
    }
    
    const regex = new RegExp(pattern);
    
    for (const key of this.cache.keys()) {
      if (regex.test(key)) {
        this.cache.delete(key);
      }
    }
  }
  
  /**
   * Get all cache keys
   */
  keys(): string[] {
    return Array.from(this.cache.keys());
  }
  
  /**
   * Get cache statistics
   */
  getStats(): {
    total: number;
    expired: number;
    valid: number;
    entries: Array<{ key: string; age: number; ttl: number }>;
  } {
    const entries: Array<{ key: string; age: number; ttl: number }> = [];
    let expired = 0;
    
    for (const [key, entry] of this.cache.entries()) {
      const age = Date.now() - entry.timestamp;
      const isExpired = age > entry.ttl;
      
      entries.push({ key, age, ttl: entry.ttl });
      
      if (isExpired) {
        expired++;
      }
    }
    
    return {
      total: this.cache.size,
      expired,
      valid: this.cache.size - expired,
      entries
    };
  }
}

// Cache key constants
export const CACHE_KEYS = {
  USER_PROFILE: 'user_profile_v1',
  USER_ADDRESSES: 'user_addresses_v1',
  USER_SESSIONS: 'user_sessions_v1',
  USER_PREFERENCES: 'user_preferences_v1',
  USER_PAYMENTS: 'user_payments_v1',
  USER_ACCOUNT_SUMMARY: 'user_account_summary_v1',
} as const;

// TTL values (in milliseconds)
export const CACHE_TTL = {
  PROFILE: 60 * 60 * 1000,        // 1 hour
  ADDRESSES: 30 * 60 * 1000,      // 30 minutes
  SESSIONS: 5 * 60 * 1000,        // 5 minutes (real-time)
  PREFERENCES: 60 * 60 * 1000,    // 1 hour
  PAYMENTS: 30 * 60 * 1000,       // 30 minutes
  SUMMARY: 10 * 60 * 1000,        // 10 minutes
  SHORT: 5 * 60 * 1000,           // 5 minutes
  MEDIUM: 30 * 60 * 1000,         // 30 minutes
  LONG: 60 * 60 * 1000,           // 1 hour
} as const;

// Create singleton instance
export const cacheManager = new CacheManager();

/**
 * LocalStorage-based persistent cache (survives page reload)
 */
export class PersistentCache {
  private prefix = 'app_cache_';
  
  /**
   * Set cache entry with TTL
   */
  set<T>(key: string, data: T, ttl: number = 3600000): void {
    const entry = {
      data,
      timestamp: Date.now(),
      ttl
    };
    
    try {
      localStorage.setItem(
        this.prefix + key,
        JSON.stringify(entry)
      );
    } catch (error) {
      console.error('Failed to set cache:', error);
    }
  }
  
  /**
   * Get cache entry if not expired
   */
  get<T>(key: string): T | null {
    try {
      const item = localStorage.getItem(this.prefix + key);
      
      if (!item) {
        return null;
      }
      
      const entry = JSON.parse(item) as CacheEntry<T>;
      const age = Date.now() - entry.timestamp;
      
      if (age > entry.ttl) {
        localStorage.removeItem(this.prefix + key);
        return null;
      }
      
      return entry.data;
    } catch (error) {
      console.error('Failed to get cache:', error);
      return null;
    }
  }
  
  /**
   * Check if cache entry exists and is valid
   */
  has(key: string): boolean {
    return this.get(key) !== null;
  }
  
  /**
   * Remove cache entry
   */
  remove(key: string): void {
    try {
      localStorage.removeItem(this.prefix + key);
    } catch (error) {
      console.error('Failed to remove cache:', error);
    }
  }
  
  /**
   * Clear all cache entries
   */
  clear(): void {
    try {
      const keys = Object.keys(localStorage);
      keys.forEach(key => {
        if (key.startsWith(this.prefix)) {
          localStorage.removeItem(key);
        }
      });
    } catch (error) {
      console.error('Failed to clear cache:', error);
    }
  }
}

export const persistentCache = new PersistentCache();

/**
 * Utility function to fetch with cache
 */
export async function fetchWithCache<T>(
  url: string,
  cacheKey: string,
  ttl: number,
  options?: RequestInit
): Promise<T> {
  // Check memory cache first
  const cached = cacheManager.get<T>(cacheKey);
  if (cached) {
    console.log(`[Cache Hit] ${cacheKey}`);
    return cached;
  }
  
  // Check persistent cache
  const persistedCached = persistentCache.get<T>(cacheKey);
  if (persistedCached) {
    console.log(`[Persistent Cache Hit] ${cacheKey}`);
    return persistedCached;
  }
  
  // Fetch from API
  console.log(`[Cache Miss] ${cacheKey} - fetching from API`);
  const response = await fetch(url, options);
  const data = await response.json();
  
  // Cache the result
  cacheManager.set(cacheKey, data, ttl);
  persistentCache.set(cacheKey, data, ttl);
  
  return data;
}
