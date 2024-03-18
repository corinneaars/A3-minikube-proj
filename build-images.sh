#!/bin/bash

# Set the terminal to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

kubectl delete namespace minikube-soft-intro
kubectl create namespace minikube-soft-intro
kubectl config set-context --current --namespace=minikube-soft-intro

docker login

# Navigate to the FastAPI directory and build the Docker image
cd fastapi
docker rmi fastapi-image
docker build -t fastapi-image .
sleep 30
docker tag fastapi-image corinneaarsbaylor/minikube-soft-intro:fastapi-image
sleep 30
docker push corinneaarsbaylor/minikube-soft-intro:fastapi-image


# Navigate to the Next.js directory and build the Docker image
cd ../nextjs
docker rmi nextjs-image
docker build -t nextjs-image .
sleep 30
docker tag nextjs-image corinneaarsbaylor/minikube-soft-intro:nextjs-image
sleep 30
docker push corinneaarsbaylor/minikube-soft-intro:nextjs-image

# Navigate to the MySQL directory and build the Docker image
cd ../mysql
docker rmi mysql-image
docker build -t mysql-image .
sleep 30
docker tag mysql-image corinneaarsbaylor/minikube-soft-intro:mysql-image
sleep 30
docker push corinneaarsbaylor/minikube-soft-intro:mysql-image


