#!/usr/bin/env bash

# Get started with Google Cloud Platform

cloud_project="publication-273509"
cloud_region="europe-west3"
cloud_zone="europe-west3-a"

# gcloud config set compute/zone ${cloud_zone}
# gcloud config set compute/region ${cloud_region}

# networks_load_balancer_ip="35.198.124.128"
# networks_addresses="35.198.171.100"
# networks_instance_ip="35.198.124.128"

# networks_external_ip="35.198.171.100" # :80-443
# networks_internal_ip="35.198.124.128" # :22-443

# networks_internal_ip="35.198.124.128"
# networks_instance_ip="35.198.124.128"
# networks_internal_ip_mask="10.156.0.3/20"
# instance_user="develop"

app_name="app"
app_namespace="publication"

# echo $SSH_KEY_ID

# ssh -t -i ${SSH_KEY_ID} "${ID_USER}@35.198.124.128" "sudo su - bitnami"

# ssh -t bitnami@35.198.124.128
# sudo /opt/bitnami/ctlscript.sh restart apache && curl -sIL https://soprun.com
