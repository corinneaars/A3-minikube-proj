# Use an official Node.js runtime as a parent image
FROM node:21.7.1-alpine


# Add the current directory contents into the container at /app
ADD . /app
WORKDIR /app


# Install any needed packages specified in package.json
RUN npm cache clean --force
RUN npm install
RUN npm run build

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the application when the container launches
CMD ["npm", "start"]

