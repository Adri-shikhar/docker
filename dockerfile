# Start from a machine that already has Node.js installed.
FROM node:22-alpine

# Everything below happens inside this folder in the container.
WORKDIR /app

# Copy the package list and download the packages.
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the project in, then build it.
COPY . .
RUN npm run build

# The app listens on port 3000.
EXPOSE 3000

# The command that runs when the container starts.
CMD ["npm", "start"]
