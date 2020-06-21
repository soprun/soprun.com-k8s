#!/usr/bin/env bash

export PROJECT_ID="project-40825"

export CLUSTER_NAME="cluster-sandbox"
export CLUSTER_REGION="europe-west3"
export CLUSTER_ZONE="europe-west3-a"

export CLOUDSQL_ID="shared-database"
export CLOUDSQL_NAME="${PROJECT_ID}:${CLUSTER_REGION}:${CLOUDSQL_ID}"
# export CLOUDSQL_ROOT_PASSWORD="oGeqk8NshH6AEavD"

export DATABASE_ENDPOINT="10.98.160.7"
export DATABASE_USERNAME="sandbox"
export DATABASE_PASSWORD="113w3KbyJ8LkQOP"
export DATABASE_DATABASE_NAME="sandbox_database"

# ...
# ----------------------------------

export DEPLOYMENT_DOMAIN="soprun.com"
export DEPLOYMENT_NAMESPACE="sandbox"
export DEPLOYMENT_INSTANCE_NAME="instance"

# projects/project-40825/locations/europe-west3/keyRings/default/cryptoKeys/default-encryption-decrypt
