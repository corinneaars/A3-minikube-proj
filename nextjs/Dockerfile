# Use an official Node.js runtime as a parent image
FROM node:21.7-alpine3.18

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in package.json
RUN npm install
RUN npm run build

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the application when the container launches
CMD ["npm", "start"]
