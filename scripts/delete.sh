#!/usr/bin/env bash

source .env.sh

echo "Cluster delete namespace..."
kubectl delete namespace ${DEPLOYMENT_NAMESPACE}
