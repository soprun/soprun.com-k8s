#!/usr/bin/env bash

source ./env.sh

helm delete ${APP_INSTANCE_NAME}

kubectl delete namespace "${APP_NAMESPACE}"
