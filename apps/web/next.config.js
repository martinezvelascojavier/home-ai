/** @type {import('next').NextConfig} */
const nextConfig = {
  // usa webpack en vez de turbopack
  webpack: (config) => {
    return config
  },
}

module.exports = nextConfig
