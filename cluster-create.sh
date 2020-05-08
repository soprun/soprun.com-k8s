#!/usr/bin/env bash

#echo 'Run!...';
#exit 0;

# Основной внутренний IP-адрес: 10.156.0.4
# Псевдонимы диапазонов IP-адресов: 10.40.2.0/24
# Внешний IP-адрес:

gcloud beta container \
  --project "project-40825"
  clusters create "cluster" \
  --zone "europe-west3-a" \
  --no-enable-basic-auth \
  --release-channel "regular" \
  --machine-type "n1-standard-2" \
  --image-type "COS" \
  --disk-type "pd-standard" \
  --disk-size "100" \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes "3" \
  --enable-stackdriver-kubernetes \
  --enable-ip-alias \
  --network "projects/project-40825/global/networks/default" \
  --subnetwork "projects/project-40825/regions/europe-west3/subnetworks/default" \
  --enable-intra-node-visibility \
  --default-max-pods-per-node "110" \
  --no-enable-master-authorized-networks \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing,CloudRun,GcePersistentDiskCsiDriver \
  --enable-autoupgrade \
  --enable-autorepair \
  --resource-usage-bigquery-dataset "cluster_usage_metering" \
  --enable-resource-consumption-metering \
  --identity-namespace "project-40825.svc.id.goog" \
  --enable-shielded-nodes \
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
