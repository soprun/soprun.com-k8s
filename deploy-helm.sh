#!/usr/bin/env bash

set -e

source env.sh

# gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${CLUSTER_ZONE}
# exit;

# Create namespace &>/dev/null
kubectl delete namespace ${DEPLOYMENT_NAMESPACE}
exit;

kubectl create namespace ${DEPLOYMENT_NAMESPACE}

# --dry-run \

helm install ${DEPLOYMENT_INSTANCE_NAME} bitnami/wordpress \
  --namespace ${DEPLOYMENT_NAMESPACE} \
  --set mariadb.enabled=false \
  --set externalDatabase.host=${CLOUDSQL_ENDPOINT} \
  --set externalDatabase.user=${CLOUDSQL_USERNAME} \
  --set externalDatabase.password=${CLOUDSQL_PASSWORD} \
  --set externalDatabase.database=${CLOUDSQL_DATABASE_NAME} \
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
