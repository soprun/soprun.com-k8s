#!/usr/bin/env bash

source ./env.sh

# printenv | sort

# Create namespace
# kubectl expose namespace "${APP_NAMESPACE}"

helm repo add bitnami https://charts.bitnami.com/bitnami

#helm install ${APP_INSTANCE_NAME} \
#  --namespace ${APP_NAMESPACE} \
#  -f ./app/values.yaml \
#  bitnami/wordpress

# https://raw.githubusercontent.com/bitnami/charts/master/bitnami/wordpress/values-production.yaml

#kubectl get svc --namespace "${APP_NAMESPACE}" -w "${APP_INSTANCE_NAME}";

# echo Username: user
# echo Password: $(kubectl get secret --namespace wordpress-helm wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)

# Reserve a static external IP address:
# gcloud compute addresses create "${EXTERNAL_IP_NAME}" --global

# Get the static IP address:
# gcloud compute addresses describe "${EXTERNAL_IP_NAME}" --global

# gcloud compute zones list
# gcloud compute regions list
# gcloud compute machine-types list | more
