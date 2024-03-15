#!/bin/bash

# Set the terminal to use Minikube's Docker daemon
#./docker-restart.sh

minikube start --driver docker
# Re-evaluate Docker environment variables
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)
minikube addons enable metrics-server
echo "Minikube started, metrics-server enabled"



# Create a namespace named minikube-soft-intro
kubectl create namespace minikube-soft-intro
echo "Namespace minikube-soft-intro created"
kubectl config set-context --current --namespace=minikube-soft-intro
echo "kubectl configured to use minikube-soft-intro namespace"

# Call the build-images.sh script
./build-images.sh
echo "Images built and pushed to Minikube's Docker daemon"
docker images


# Apply the Kubernetes deployment
echo "Applying the Kubernetes deployment in dev-deployment.yaml"
kubectl apply -f ./kubernetes/dev-deployment.yaml --namespace=minikube-soft-intro
echo "Deployment applied"
./minikube-show-current.sh


# Get Minikube IP
minikube_ip=$(minikube ip)

# Get NodePorts for the services
fastapi_service_port=$(kubectl get service fastapi-service -n minikube-soft-intro -o=jsonpath='{.spec.ports[0].nodePort}')
mysql_service_port=$(kubectl get service mysql-service -n minikube-soft-intro -o=jsonpath='{.spec.ports[0].nodePort}')
nextjs_service_port=$(kubectl get service nextjs-service -n minikube-soft-intro -o=jsonpath='{.spec.ports[0].nodePort}')

# Print connection strings
echo "FastAPI service: http://$minikube_ip:$fastapi_service_port"
echo "MySQL service: http://$minikube_ip:$mysql_service_port"
echo "Next.js service: http://$minikube_ip:$nextjs_service_port"
