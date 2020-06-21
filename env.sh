#!/usr/bin/env bash

# Project
# ----------------------------------
export PROJECT_ID="project-40825"

# Cloud DNS
# ----------------------------------
export DNS_ZONE=soprun-com
export DNS_NAME=soprun.com.

# Crypto Keys
# ----------------------------------
export CRYPTO_KEY="projects/project-40825/locations/europe-west3/keyRings/default/cryptoKeys/default-encryption-decrypt"

# Cluster
# ----------------------------------
export CLUSTER_NAME="cluster-sandbox"
export CLUSTER_REGION="europe-west3"
export CLUSTER_ZONE="europe-west3-a"

# Cloud SQL: shared-database
# ----------------------------------
export CLOUDSQL_ID="shared-database"
export CLOUDSQL_NAME="${PROJECT_ID}:${CLUSTER_REGION}:${CLOUDSQL_ID}"
export CLOUDSQL_ROOT_PASSWORD="oGeqk8NshH6AEavD"


# shared-database: sandbox
# ----------------------------------
export DATABASE_HOST="10.98.160.7"
export DATABASE_PORT="3306"
export DATABASE_ENDPOINT="${DATABASE_HOST}:${DATABASE_PORT}"
export DATABASE_USERNAME="sandbox"
export DATABASE_PASSWORD="113w3KbyJ8LkQOP"
export DATABASE_NAME="sandbox_database"

# Deployment
# ----------------------------------
export DEPLOYMENT_NAMESPACE="sandbox"
# export DEPLOYMENT_INSTANCE_NAME="instance"

# Set configuration
# ----------------------------------
echo "Set project ${PROJECT_ID}..."
# gcloud config set project ${PROJECT_ID} &>/dev/null
# gcloud config set compute/zone ${CLUSTER_ZONE}

echo "Get cluster credentials..."
gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${CLUSTER_ZONE}

echo "Set current namespace ${DEPLOYMENT_NAMESPACE}..."
kubectl config set-context --current --namespace=${DEPLOYMENT_NAMESPACE} &>/dev/null

echo "Get Docker credentials..."
# gcloud auth configure-docker
