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

# kubectl delete --kustomize ./app/


kubectl create secret generic wordpress-database \
    --from-literal=DATABASE_HOST=${DATABASE_HOST} \
    --from-literal=DATABASE_USERNAME=${DATABASE_USERNAME} \
    --from-literal=DATABASE_PASSWORD=${DATABASE_PASSWORD} \
    --from-literal=DATABASE_NAME=${DATABASE_NAME} \
    --output yaml \
    --dry-run=client | kubectl apply -f -

kubectl get secret wordpress-database --output yaml


# Prometheus & Grafana info
# Forward Grafana port locally:
# kubectl port-forward --namespace prometheus prometheus-grafana-0 3000
# Grafana UI URL: http://localhost:3000/
# Grafana username: admin
# Grafana password: YehUk5hPJKPv
