#!/usr/bin/env bash

set -x
source ./env.sh

# Create namespace
kubectl create namespace "${APP_NAMESPACE}"

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install ${APP_INSTANCE_NAME} \
  --namespace ${APP_NAMESPACE} \
  -f values.yaml \
  bitnami/wordpress

# https://raw.githubusercontent.com/bitnami/charts/master/bitnami/wordpress/values-production.yaml

echo Username: user
echo Password: $(kubectl get secret --namespace wordpress-helm wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)

kubectl get svc --namespace "${APP_NAMESPACE}" -w "${APP_INSTANCE_NAME}";
