#!/usr/bin/env bash

source ./env.sh

git commit -a -S -m "clusters create: ${GKE_CLUSTER_NAME}"

gcloud container clusters create ${GKE_CLUSTER_NAME} --project ${GCP_PROJECT_ID} \
  --zone ${GKE_CLUSTER_LOCATION} \
  --machine-type ${GKE_MACHINE_TYPE}
