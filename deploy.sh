#!/usr/bin/env bash

set -ex

source env.sh

# Configure gcloud as a Docker credential helper:
# gcloud auth configure-docker

echo "Get cluster credentials..."
# gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${CLUSTER_ZONE}

echo "Cluster delete namespace..."
# kubectl delete namespace ${DEPLOYMENT_NAMESPACE}

echo "Cluster create namespace..."
# kubectl create namespace ${DEPLOYMENT_NAMESPACE}

echo "Cluster apply configuration in app..."
kubectl apply --namespace ${DEPLOYMENT_NAMESPACE} --kustomize ./app/

# kubectl delete --kustomize ./app/


# Prometheus & Grafana info
# Forward Grafana port locally:
# kubectl port-forward --namespace prometheus prometheus-grafana-0 3000
# Grafana UI URL: http://localhost:3000/
# Grafana username: admin
# Grafana password: YehUk5hPJKPv
