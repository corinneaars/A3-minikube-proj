#!/bin/bash

# Set the terminal to use Minikube's Docker daemon
eval $(minikube docker-env)

# Navigate to the FastAPI directory and build the Docker image
cd fastapi
docker build -t fastapi-image .

# Navigate to the Next.js directory and build the Docker image
cd ../nextjs
docker build -t nextjs-image .

# Navigate to the MySQL directory and build the Docker image
cd ../mysql
docker build -t mysql-image .


