#!/usr/bin/env bash

source ./env.sh

# Основной внутренний IP-адрес: 10.156.0.4
# Псевдонимы диапазонов IP-адресов: 10.40.2.0/24
# Внешний IP-адрес:

# cluster-ipv4-cidr=10.0.0.0/21 \

# networks_internal_ip_mask="10.156.0.0/20"

# gcloud beta container --project ${PROJECT_ID} clusters create --help >> clusters-create.txt

machine_type="g1-small"
image_type="COS"
disk_type="pd-standard"
disk_size=100
num_nodes=3
default_max_pods_per_node=28

gcloud beta container --project ${PROJECT_ID} clusters create ${CLUSTER_NAME} \
  --zone ${CLUSTER_LOCATION} \
  --no-enable-basic-auth \
  --release-channel "regular" \
  --machine-type ${machine_type} \
  --image-type ${image_type} \
  --disk-type ${disk_type} \
  --disk-size ${disk_size} \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes ${num_nodes} \
  --enable-stackdriver-kubernetes \
  --enable-ip-alias \
  --network "projects/project-40825/global/networks/default" \
  --subnetwork "projects/project-40825/regions/europe-west3/subnetworks/default" \
  --enable-intra-node-visibility \
  --default-max-pods-per-node ${default_max_pods_per_node} \
  --enable-network-policy \
  --no-enable-master-authorized-networks \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing,NodeLocalDNS,GcePersistentDiskCsiDriver \
  --enable-autoupgrade \
  --enable-autorepair \
  --max-surge-upgrade 1 \
  --max-unavailable-upgrade 0 \
  --enable-tpu \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --enable-resource-consumption-metering \
  --identity-namespace ${WORKLOAD_IDENTITY} \
  --enable-shielded-nodes \
  --shielded-secure-boot \
  --security-group "gke-security-groups@soprun.com"
