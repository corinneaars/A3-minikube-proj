#!/bin/bash
minikube stop

minikube start --driver docker

# Call the build-images.sh script
./build-images.sh

# Apply the Kubernetes deployment
kubectl apply -f ./kubernetes/dev-deployment.yaml

