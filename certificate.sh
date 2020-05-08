#!/usr/bin/env bash

set -x
source ./env.sh

kubectl apply --namespace "${APP_NAMESPACE}" \
  -f ./certificate/Issuer.yaml
