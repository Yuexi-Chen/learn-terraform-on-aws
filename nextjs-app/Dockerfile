# Dockerfile for a Next.js application

# ===== STAGE 1: Dependencies =====
# Get base image
FROM node:18-alpine AS deps

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies using npm ci for faster, more reliable builds
RUN npm ci

# ===== STAGE 2: Builder =====
# Get base image
FROM node:18-alpine AS builder
WORKDIR /app

# Copy dependencies from previous stage
COPY --from=deps /app/node_modules ./node_modules
# Copy all other source code
COPY . .

# Build the application
# This command requires the `build` script to be defined in `package.json`
RUN npm run build

# ===== STAGE 3: Runner (Production) =====
# Get base image
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# To use this Dockerfile, you must enable the standalone output mode in `next.config.js`:
# module.exports = {
#   output: 'standalone',
# }
# This will significantly reduce the image size.
# More info: https://nextjs.org/docs/advanced-features/output-file-tracing

# Copy the standalone output
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

EXPOSE 3000

# The default command to start the app's server
CMD ["node", "server.js"] 