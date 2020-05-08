#!/usr/bin/env bash

source ./env.sh

kubectl apply --namespace "${APP_NAMESPACE}" \
  -f ./certificate/Issuer.yaml
