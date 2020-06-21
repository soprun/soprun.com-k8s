#!/usr/bin/env bash

# set -o allexport
# [[ -f .env ]] && source .env
# set +o allexport

set -e
source env.sh

# Configure gcloud as a Docker credential helper:
# gcloud auth configure-docker

echo "Get cluster credentials..."
# gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${CLUSTER_ZONE}

echo "Cluster create namespace..."
kubectl create namespace ${DEPLOYMENT_NAMESPACE}

echo "Cluster apply configuration in app..."
kubectl apply --kustomize ./app/

echo "Cluster create secret..."
kubectl create secret generic wordpress-secret \
    --from-literal=APP_SECRET=$(openssl rand -base64 16) \
    --from-literal=DATABASE_HOST=${DATABASE_HOST} \
    --from-literal=DATABASE_USERNAME=${DATABASE_USERNAME} \
    --from-literal=DATABASE_PASSWORD=${DATABASE_PASSWORD} \
    --from-literal=DATABASE_NAME=${DATABASE_NAME} \
    --output yaml
