# Use the official Node.js base image with the LTS tag
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the package files first to leverage Docker's cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["npm", "run", "develop"]