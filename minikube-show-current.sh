#!/bin/bash


# Set Docker to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)


# List Docker containers
echo "Docker containers:"
docker ps -a | grep 'minikube'

# List Docker images
echo "Docker images:"
docker images | grep 'minikube'

# List Kubernetes deployments
echo "Kubernetes deployments:"
kubectl get deployments -n minikube-soft-intro

# List Kubernetes services
echo "Kubernetes services:"
kubectl get services -n minikube-soft-intro

# Set Docker to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)


