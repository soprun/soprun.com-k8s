#!/usr/bin/env bash

source ./env.sh

# printenv | sort
# exit;

GKE_CLUSTER_NAME="cluster-sandbox-12"
GKE_CLUSTER_SUBNETWORK_NAME="${GKE_CLUSTER_NAME}-subnet"

# Configure: Google Kubernetes Engine (GKE)

tags="default-allow-ssh,default-allow-http,default-allow-https"
scopes="storage-ro,logging-write,monitoring,service-control,service-management,trace"
metadata="disable-legacy-endpoints=true"

printenv | sort >> tmp/cluster-${GKE_CLUSTER_NAME}.log

gcloud beta container clusters create ${GKE_CLUSTER_NAME} --project ${GCP_PROJECT_ID} \
  --user-output-enabled \
  --verbosity=info \
  --zone=${GKE_CLUSTER_LOCATION} \
  --node-locations europe-west3-a,europe-west3-b,europe-west3-c \
  --no-enable-basic-auth \
  --release-channel regular \
  --workload-pool ${GKE_WORKLOAD_IDENTITY} \
  --machine-type ${GKE_MACHINE_TYPE} \
  --image-type ${GKE_IMAGE_TYPE} \
  --disk-type ${GKE_DISK_TYPE} \
  --disk-size ${GKE_DISK_SIZE} \
  --metadata ${metadata} \
  --tags ${tags} \
  --scopes ${scopes} \
  --enable-ip-alias \
  --enable-autorepair \
  --enable-autoupgrade \
  --enable-autoscaling \
  --autoscaling-profile optimize-utilization \
  --enable-stackdriver-kubernetes \
  --enable-intra-node-visibility \
  --enable-network-policy \
  --enable-shielded-nodes \
  --enable-resource-consumption-metering \
  --num-nodes ${GKE_CLUSTER_NUMBER_NODES} \
  --default-max-pods-per-node ${GKE_CLUSTER_MAXIMUM_PODS_PER_NODE} \
  --min-nodes ${GKE_CLUSTER_MINIMUM_NUMBER_NODES}\
  --max-nodes ${GKE_CLUSTER_MAXIMUM_NUMBER_NODES} \
  --max-surge-upgrade ${GKE_CLUSTER_MAXIMUM_SURGE_UPGRADE} \
  --max-unavailable-upgrade ${GKE_CLUSTER_MAXIMUM_UNAVAILABLE_UPGRADE} \
  --shielded-integrity-monitoring \
  --shielded-secure-boot \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --security-group "gke-security-groups@soprun.com"
