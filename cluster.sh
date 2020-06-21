#!/usr/bin/env bash

set -e
source env.sh

gcloud container clusters create ${CLUSTER_NAME} \
    --num-nodes=3 \
    --enable-autoupgrade \
    --no-enable-basic-auth \
    --no-issue-client-certificate \
    --enable-ip-alias \
    --metadata \
    disable-legacy-endpoints=true
