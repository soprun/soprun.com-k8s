#!/usr/bin/env bash

# set -ex
set -e

# set environment variables: Google Cloud Platform
export PROJECT_ID=${PROJECT_ID:-project-40825}
export PROJECT_NUMBER=${PROJECT_NUMBER:-797048000142}
export WORKLOAD_IDENTITY="${PROJECT_ID}.svc.id.goog"

# Cluster
export CLUSTER_NAME=${CLUSTER_NAME:-cluster}
export CLUSTER_REGION=${CLUSTER_REGION:-europe-west3}
export CLUSTER_ZONE=${CLUSTER_REGION:-europe-west3-a}
export CLUSTER_LOCATION=${CLUSTER_LOCATION:-${CLUSTER_ZONE}} # ZONE_OR_REGION

# export CLUSTER_MASTER_IPV4=""
# export CLUSTER_MASTER_IPV4_NAME=""

# export NETWORK_EXTERNAL_IPV4=""
# export NETWORK_EXTERNAL_IPV4_NAME="static-ip"
# export NETWORK_EXTERNAL_IPV6=""
# export NETWORK_EXTERNAL_IPV6_NAME="static-ipv6"

export APP_DOMAIN_NAME=${APP_DOMAIN_NAME:-soprun.com}
export APP_INSTANCE_NAME="app"
export APP_NAMESPACE="publication"

# Configure default
# gcloud config set project ${PROJECT_ID}
# gcloud config set compute/region ${CLUSTER_REGION}
# gcloud config set compute/zone ${CLUSTER_LOCATION}

# Configure `kubectl` to connect to the new cluster:
# gcloud container clusters get-credentials "${CLUSTER_NAME}"
# gcloud container clusters --help

