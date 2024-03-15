#!/bin/bash
./docker-restart.sh
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

# configure kubectl to use minikube minikube-soft-intro namespace
kubectl config set-context --current --namespace=minikube-soft-intro


# Delete Kubernetes services
kubectl delete services --all -n minikube-soft-intro
kubectl delete deployments --all -n minikube-soft-intro
kubectl patch namespace minikube-soft-intro -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl delete namespace minikube-soft-intro

# Stop and remove Docker containers related to minikube-soft-intro
docker ps -a | grep 'minikube-soft-intro' | awk '{print $1}' | xargs docker stop
docker ps -a | grep 'minikube-soft-intro' | awk '{print $1}' | xargs docker rm

# Remove Docker images related to minikube-soft-intro
docker images | grep 'minikube-soft-intro' | awk '{print $3}' | xargs docker rmi -f

# Unset Docker to use Minikube's Docker daemon
eval $(minikube -p minikube docker-env)

echo "Minikube cleaned and reset"
./minikube-show-current.sh

