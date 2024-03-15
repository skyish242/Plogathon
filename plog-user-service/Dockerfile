# Step 1: Choose base image
FROM node:bookworm-slim

# Step 2: Set the working directory in the Docker container
WORKDIR /usr/src/app

# Step 3: Update dependencies
RUN apt-get update -y

# Step 4: Copy package files and install dependencies
COPY package*.json ./

# Step 5: Install dependencies
RUN npm install

# Step 6: Copy the rest of the code
COPY . .

# Step 7: Expose the port
EXPOSE 5002

# Step 7: Define entrypoint
CMD ["node", "user-service.js"]