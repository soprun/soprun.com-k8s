#!/usr/bin/env bash

# set -x
source ./env.sh

helm delete ${APP_INSTANCE_NAME}
kubectl delete namespace "${APP_NAMESPACE}" > /dev/null
