#!/bin/bash

# Quit Docker
osascript -e 'quit app "Docker Desktop"'

# Wait for Docker to quit
while pgrep -q "Docker*"; do
    echo "Waiting for Docker to quit..."
    sleep 5
done
if [[ -S /var/run/docker.sock ]]; then
    echo "Removing docker.sock..."
    rm /var/run/docker.sock
fi

echo "All Docker processes have quit"
sleep 30

# Start Docker
open -a "Docker Desktop"
echo "Docker Desktop starting..."

# Wait for Docker to start
sleep 30
while ! docker info >/dev/null 2>&1; do
    echo "Waiting for Docker to start..."
    sleep 5
done

# Set Docker to use Minikube's Docker daemon
minikube start --driver docker &
fg %1

# Wait for Minikube to start
while ! minikube status | grep -q "host: Running"; do
    echo "Waiting for Minikube to start..."
    sleep 5
done

# Set Docker to use Minikube's Docker daemon
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

