#!/bin/bash

# Set the terminal to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)


# Navigate to the FastAPI directory and build the Docker image
cd fastapi
docker rmi fastapi-image
docker build -t fastapi-image .
docker login
docker push fastapi-image

# Navigate to the Next.js directory and build the Docker image
cd ../nextjs
docker rmi nextjs-image
docker build -t nextjs-image .
docker login
docker push nextjs-image

# Navigate to the MySQL directory and build the Docker image
cd ../mysql
docker rmi mysql-image
docker build -t mysql-image .
docker login
docker push mysql-image


