# Use lightweight Node image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files first (better layer caching)
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy source code
COPY src ./src

# Expose port (Railway will map automatically)
EXPOSE 3000

# Start app
CMD ["npm", "start"]
