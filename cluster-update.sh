#!/usr/bin/env bash

source ./env.sh

# printenv | sort
# exit;

GKE_CLUSTER_NAME="cluster-sandbox-11"
GKE_CLUSTER_SUBNETWORK_NAME="${GKE_CLUSTER_NAME}-subnet"

# Configure: Google Kubernetes Engine (GKE)

gcloud beta container clusters update ${GKE_CLUSTER_NAME} --project ${GCP_PROJECT_ID} \
  --min-nodes ${GKE_CLUSTER_MINIMUM_NUMBER_NODES}\
  --max-nodes ${GKE_CLUSTER_MAXIMUM_NUMBER_NODES}
#  --enable-autoprovisioning \
#  --autoprovisioning-locations ${GKE_CLUSTER_LOCATION} \
#  --autoprovisioning-max-surge-upgrade ${GKE_CLUSTER_MAXIMUM_SURGE_UPGRADE} \
#  --autoprovisioning-max-unavailable-upgrade ${GKE_CLUSTER_MAXIMUM_UNAVAILABLE_UPGRADE}
#
