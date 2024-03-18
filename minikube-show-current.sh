#!/bin/bash


# Set Docker to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)


# List Docker containers
echo "




Docker containers:"
docker ps -a | grep 'minikube' | grep  'minikube-soft-intro'

# List Docker images
echo "


Docker images:"
docker images | grep 'minikube' | grep  'minikube-soft-intro'

# List Kubernetes deployments
echo "


Kubernetes deployments:"
kubectl get deployments -n minikube-soft-intro

# List Kubernetes services
echo "


Kubernetes services:"
kubectl get services -n minikube-soft-intro

# List Kubernetes pods
echo "


Kubernetes pods:"   
kubectl get pods -n minikube-soft-intro

# List Kubernetes nodes
echo "

Kubernetes nodes:"  
kubectl get nodes -n minikube-soft-intro

# List Kubernetes namespaces
echo "

Kubernetes namespaces:"
kubectl get namespaces

# Minikube status
echo "

Minikube status:"
minikube status

# Minikube ip
echo "

Minikube ip:"
minikube ip

# Set Docker to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)


