#!/usr/bin/env bash

source ./env.sh

# printenv | sort
# exit;

GKE_CLUSTER_NAME="sandbox-cluster"

# Configure: Google Kubernetes Engine (GKE)

number_nodes=3 # default=3 The number of nodes to be created in each of the cluster's zones.
min_nodes_size=0
max_nodes_size=3

max_surge_upgrade=1
max_unavailable_upgrade=0

# --cluster-ipv4-cidr=10.0.0.0/14

# --max-nodes-per-pool=MAX_NODES_PER_POOL
# --default-max-nodes-per-pool=MAX_NODES_PER_POOL
# The maximum number of nodes to allocate per default initial node pool.

# --max-pods-per-node=MAX_PODS_PER_NODE
# --default-max-pods-per-node=MAX_PODS_PER_NODE
# The max number of pods per node for this node pool.

gcloud container clusters create ${GKE_CLUSTER_NAME} \
  --user-output-enabled \
  --zone=${GKE_CLUSTER_LOCATION} \
  --workload-pool ${GKE_WORKLOAD_IDENTITY} \
  --machine-type ${GKE_MACHINE_TYPE} \
  --image-type ${GKE_IMAGE_TYPE} \
  --disk-type ${GKE_DISK_TYPE} \
  --disk-size ${GKE_DISK_SIZE} \
  --metadata disable-legacy-endpoints=true \
  --enable-ip-alias \
  --enable-autorepair \
  --enable-autoupgrade \
  --enable-autoscaling \
  --enable-stackdriver-kubernetes \
  --enable-intra-node-visibility \
  --enable-network-policy \
  --enable-shielded-nodes \
  --enable-resource-consumption-metering \
  --num-nodes ${number_nodes} \
  --min-nodes ${min_nodes_size}\
  --max-nodes ${max_nodes_size} \
  --max-surge-upgrade ${max_surge_upgrade} \
  --max-unavailable-upgrade ${max_unavailable_upgrade} \
  --create-subnetwork "name=${GKE_CLUSTER_SUBNETWORK_NAME},range=${GKE_CLUSTER_SUBNETWORK_RANGE}" \
  --shielded-integrity-monitoring \
  --shielded-secure-boot \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --security-group "gke-security-groups@soprun.com"

# WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
# WARNING: The Pod address range limits the maximum size of the cluster.
# Please refer to https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr
# to learn how to optimize IP address allocation.
# This will enable the autorepair feature for nodes.
# Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair
# for more information on node autorepairs.
