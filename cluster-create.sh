#!/usr/bin/env bash

source ./env.sh

# Основной внутренний IP-адрес: 10.156.0.4
# Псевдонимы диапазонов IP-адресов: 10.40.2.0/24
# Внешний IP-адрес:

# cluster-ipv4-cidr=10.0.0.0/21 \

# gcloud beta container --project ${PROJECT_ID} clusters create --help >> clusters-create.txt

machine_type="g1-small"
image_type="COS"
disk_type="pd-standard"
disk_size=100

gcloud beta container --project ${PROJECT_ID} clusters create ${CLUSTER_NAME} \
  --zone ${CLUSTER_ZONE} \
  --no-enable-basic-auth \
  --release-channel "regular" \
  --machine-type ${machine_type} \
  --image-type ${image_type} \
  --disk-type ${disk_type} \
  --disk-size ${disk_size} \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --enable-stackdriver-kubernetes \
  --enable-ip-alias \
  --cluster-ipv4-cidr=10.0.0.0/21 \
  --services-ipv4-cidr=10.4.0.0/19 \
  --create-subnetwork name="cluster-name-subnet",range=/21 \
  --network "projects/project-40825/global/networks/default" \
  --subnetwork "projects/project-40825/regions/europe-west3/subnetworks/default" \
  --enable-intra-node-visibility \
  --default-max-pods-per-node=28 \
  --min-nodes "1" \
  --max-nodes "3" \
  --max-pods-per-node "28" \
  --no-enable-master-authorized-networks \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver \
  --enable-autoupgrade \
  --enable-autoscaling \
  --enable-autorepair \
  --max-surge-upgrade 1 \
  --max-unavailable-upgrade 0 \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --enable-resource-consumption-metering \
  --identity-namespace ${WORKLOAD_IDENTITY} \
  --enable-shielded-nodes \
  --shielded-secure-boot \
  --security-group "gke-security-groups@soprun.com"

# WARNING: The Pod address range limits the maximum size of the cluster.
# Please refer to https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr
# to learn how to optimize IP address allocation.
#
# This will enable the autorepair feature for nodes.
# Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair
# for more information on node autorepairs.


# Created [https://container.googleapis.com/v1beta1/projects/project-40825/zones/europe-west3-a/clusters/cluster].
# To inspect the contents of your cluster, go to:
# https://console.cloud.google.com/kubernetes/workload_/gcloud/europe-west3-a/cluster?project=project-40825
# kubeconfig entry generated for cluster.
