#!/usr/bin/env bash

set -x
source ./env.sh

kubectl edit secret ${APP_INSTANCE_NAME} --namespace ${APP_NAMESPACE} -o yaml >>
