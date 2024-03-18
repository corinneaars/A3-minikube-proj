#!/bin/bash

# Set the terminal to use Minikube's Docker daemon
# ./docker-restart.sh

minikube start --driver docker

# Re-evaluate Docker environment variables
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)
minikube addons enable metrics-server
echo "Minikube started, metrics-server enabled"

sleep 30
# Call the build-images.sh script
./build-images.sh
echo "Images built and pushed to Minikube's Docker daemon"

sleep 20
kubectl config set-context --current --namespace minikube-soft-intro
echo "kubectl configured to use minikube-soft-intro namespace"


# Apply the Kubernetes deployment
echo "Applying the Kubernetes deployment in dev-deploy.yaml"
kubectl apply -f ./dev-deploy.yaml --namespace=minikube-soft-intro
echo "Deployment applied"
# ./minikube-show-current.sh

# Get Minikube IP
minikube_ip=$(minikube ip)
echo "Minikube IP: $minikube_ip"

echo "Sleeping 45 seconds..."
sleep 45
minikube service nextjs-service -n minikube-soft-intro
