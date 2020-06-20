#!/usr/bin/env bash

# https://docs.bitnami.com/tutorials/secure-wordpress-kubernetes-managed-database-ssl-upgrades/

export DEPLOYMENT_DOMAIN="soprun.com"
export DEPLOYMENT_NAMESPACE="wordpress"
export DEPLOYMENT_INSTANCE_NAME="wordpress-1"

export DEPLOYMENT_CLUSTER="cluster-shared"
export DEPLOYMENT_ZONE="europe-west3-a"

export EXTERNAL_DATABASE_ENDPOINT="10.98.160.5"
export EXTERNAL_DATABASE_USERNAME="cluster-shared-app"
export EXTERNAL_DATABASE_PASSWORD="x=n66+pR#2g$H*YgCV73"
export EXTERNAL_DATABASE_NAME="wordpress"

# gcloud container clusters get-credentials ${DEPLOYMENT_CLUSTER} --zone ${DEPLOYMENT_ZONE}
# exit;

# Create namespace
kubectl delete namespace "${DEPLOYMENT_NAMESPACE}"
exit;
kubectl create namespace "${DEPLOYMENT_NAMESPACE}"

# --dry-run \

helm install ${DEPLOYMENT_INSTANCE_NAME} bitnami/wordpress \
  --namespace ${DEPLOYMENT_NAMESPACE} \
  --set mariadb.enabled=false \
  --set externalDatabase.host=${EXTERNAL_DATABASE_ENDPOINT} \
  --set externalDatabase.user=${EXTERNAL_DATABASE_USERNAME} \
  --set externalDatabase.password=${EXTERNAL_DATABASE_PASSWORD} \
  --set externalDatabase.database=${EXTERNAL_DATABASE_NAME} \
  --set externalDatabase.port=3306

# Watch the status with:
kubectl get svc --namespace ${DEPLOYMENT_NAMESPACE} -w ${DEPLOYMENT_INSTANCE_NAME}

export SERVICE_IP=$(kubectl get svc --namespace ${DEPLOYMENT_NAMESPACE} ${DEPLOYMENT_INSTANCE_NAME} --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")

echo "WordPress URL: http://$SERVICE_IP/"
echo "WordPress Admin URL: http://$SERVICE_IP/admin"

# Open a browser and access WordPress using the obtained URL.
# Login with the following credentials below to see your blog:

echo Username: user
echo Password: $(kubectl get secret --namespace ${DEPLOYMENT_NAMESPACE} ${DEPLOYMENT_INSTANCE_NAME} -o jsonpath="{.data.wordpress-password}" | base64 --decode)
