#!/usr/bin/env bash

set -ex

# set environment variables: Google Cloud Platform
export PROJECT_ID=${PROJECT_ID:-project-40825}
export PROJECT_NUMBER=${PROJECT_NUMBER:-797048000142}
export PROJECT_REGION=${PROJECT_REGION:-europe-west3}
export PROJECT_ZONE=${PROJECT_ZONE:-europe-west3-a}

# Cluster
export CLUSTER_NAME=${CLUSTER_NAME:-cluster}
export CLUSTER_LOCATION=${CLUSTER_LOCATION:-europe-west3-a} # ZONE_OR_REGION
export CLUSTER_MASTER_IP=${CLUSTER_MASTER_IP:-34.89.153.11}
export WORKLOAD_IDENTITY="${PROJECT_ID}.svc.id.goog"

# export CLUSTER_MASTER_IPV4=${CLUSTER_MASTER_IPV4}
# export CLUSTER_MASTER_IPV4_NAME=""

# export NETWORK_EXTERNAL_IPV4=""
# export NETWORK_EXTERNAL_IPV4_NAME="static-ip"
# export NETWORK_EXTERNAL_IPV6=""
# export NETWORK_EXTERNAL_IPV6_NAME="static-ipv6"

export APP_DOMAIN_NAME=${APP_DOMAIN_NAME:-soprun.com}
export APP_INSTANCE_NAME="app"
export APP_NAMESPACE="sandbox" # sandbox or publication

# Configure default
# gcloud config set project ${PROJECT_ID}
# gcloud config set compute/region ${CLUSTER_REGION}
# gcloud config set compute/zone ${CLUSTER_LOCATION}

# Configure `kubectl` to connect to the new cluster:
# gcloud container clusters get-credentials "${CLUSTER_NAME}"
# gcloud container clusters --help

