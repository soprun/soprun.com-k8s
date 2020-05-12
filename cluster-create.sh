#!/usr/bin/env bash

source ./env.sh

# printenv | sort
# exit;

GKE_CLUSTER_NAME="sandbox-cluster-6"
GKE_CLUSTER_SUBNETWORK_NAME="${GKE_CLUSTER_NAME}-subnet"

# Configure: Google Kubernetes Engine (GKE)

tags="default-allow-ssh,default-allow-http,default-allow-https"
scopes="storage-ro,logging-write,monitoring,service-control,service-management,trace"

gcloud container clusters create ${GKE_CLUSTER_NAME} --project ${GCP_PROJECT_ID} \
  --user-output-enabled \
  --verbosity=info \
  --zone=${GKE_CLUSTER_LOCATION} \
  --no-enable-basic-auth \
  --release-channel "regular" \
  --workload-pool ${GKE_WORKLOAD_IDENTITY} \
  --machine-type ${GKE_MACHINE_TYPE} \
  --image-type ${GKE_IMAGE_TYPE} \
  --disk-type ${GKE_DISK_TYPE} \
  --disk-size ${GKE_DISK_SIZE} \
  --metadata disable-legacy-endpoints=true \
  --enable-ip-alias \
  --enable-autorepair \
  --enable-autoupgrade \
  --no-enable-autoscaling \
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
  --network default \
  --subnetwork default \
  --shielded-integrity-monitoring \
  --shielded-secure-boot \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --tags ${tags} \
  --scopes ${scopes}

# --security-group "gke-security-groups@soprun.com"

# WARNING: The Pod address range limits the maximum size of the cluster.
# Please refer to https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr
# to learn how to optimize IP address allocation.
# This will enable the autorepair feature for nodes.
# Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair
# for more information on node autorepairs.
