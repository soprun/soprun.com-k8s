#!/usr/bin/env bash

source ./env.sh

# printenv | sort
# exit;

# Configure: Google Kubernetes Engine (GKE)

tags="default-allow-ssh,default-allow-http,default-allow-https"
scopes="storage-ro,logging-write,monitoring,service-control,service-management,trace"
metadata="disable-legacy-endpoints=true"
addons="\
HttpLoadBalancing,\
HorizontalPodAutoscaling,\
NetworkPolicy,\
ApplicationManager,\
GcePersistentDiskCsiDriver\
"

git commit -a -S -m "clusters create: ${GKE_CLUSTER_NAME}"

gcloud container clusters create ${GKE_CLUSTER_NAME} --project ${GCP_PROJECT_ID} \
  --zone ${GKE_CLUSTER_LOCATION}
