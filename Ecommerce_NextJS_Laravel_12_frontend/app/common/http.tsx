export const apiUrl = 'http://127.0.0.1:8000/api'
// export const apiUrl = 'https://ecommerce.softnovait.com/api'

export const localBaseUrl = 'http://127.0.0.1:8000'
// export const localBaseUrl = 'https://ecommerce.softnovait.com'

export const adminToken = () => {
    if (typeof window !== 'undefined') {
        return localStorage.getItem('adminToken');
    }
    return null;
}


// Safe image URL helper
export const getImageUrl = (imagePath: string | undefined | null): string => {
  if (!imagePath) return '';  
  // Handle absolute URLs
  if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) return imagePath;
  // Handle storage paths
  if (imagePath.startsWith('/storage/')) return `${localBaseUrl}${imagePath}`;
  // Handle any other relative path
  return `${localBaseUrl}${imagePath.startsWith('/') ? '' : '/'}${imagePath}`;
};

// Safe placeholder image for SSR
export const getPlaceholderImage = (width: number = 48, height: number = 48, text: string = 'No Image'): string => {
  // Use SVG data URL that works on both server and client
  return `data:image/svg+xml;base64,${Buffer.from(`
    <svg width="${width}" height="${height}" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="100%" fill="#f3f4f6"/>
      <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="10" 
            text-anchor="middle" dy=".3em" fill="#9ca3af">${text}</text>
    </svg>
  `).toString('base64')}`;
};