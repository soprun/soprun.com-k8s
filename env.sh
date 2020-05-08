#!/usr/bin/env bash

# Get started with Google Cloud Platform
# core
export PROJECT_NAME="${PROJECT_NAME:-project-name}"
# compute
export COMPUTE_REGION="${COMPUTE_REGION:-europe-west3}"
export COMPUTE_ZONE="${COMPUTE_REGION:-europe-west3-a}"
# app
# export APP_INSTANCE_NAME="${APP_INSTANCE_NAME:-app}"
# export APP_NAMESPACE="${APP_NAMESPACE:-publication}"

export APP_INSTANCE_NAME="wordpress-app"
export APP_NAMESPACE="wordpress-helm"
export CLUSTER_MASTER_IP="35.234.99.88"
export CLUSTER_NAME="cluster"

# Configure default
# gcloud config set project ${cloud_project}
# gcloud config set compute/region ${COMPUTE_REGION}
# gcloud config set compute/zone ${COMPUTE_ZONE}
# gcloud config list

# Configure `kubectl` to connect to the new cluster:
# gcloud container clusters get-credentials "${CLUSTER_MASTER_IP}"
