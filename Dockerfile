# Build stage
FROM node:25-alpine as builder
 
WORKDIR /app
 
# Copy package files
COPY package*.json ./
 
# Install dependencies
RUN npm install
# Copy source code
COPY . .
 
# Build the application
RUN npm run build
 
# Serve stage
FROM nginx:alpine
 
# Copy built application to nginx
COPY --from=builder /app/dist /usr/share/nginx/html