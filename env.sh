#!/usr/bin/env bash

export PROJECT_ID="project-40825"

export CLUSTER_NAME="cluster-sandbox"
export CLUSTER_REGION="europe-west3"
export CLUSTER_ZONE="europe-west3-a"

export CLOUDSQL_ID="shared-database"
export CLOUDSQL_NAME="${PROJECT_ID}:${CLUSTER_REGION}:${CLOUDSQL_ID}"
export CLOUDSQL_ROOT_PASSWORD="oGeqk8NshH6AEavD"

export CLOUDSQL_ENDPOINT="35.198.107.225"
export CLOUDSQL_USERNAME="sandbox"
export CLOUDSQL_PASSWORD="113w3KbyJ8LkQOP"
export CLOUDSQL_DATABASE_NAME="sandbox_database"

# export EXTERNAL_DATABASE_ENDPOINT="35.198.107.225"
# export EXTERNAL_DATABASE_USERNAME="sandbox"
# export EXTERNAL_DATABASE_PASSWORD="113w3KbyJ8LkQOP"
# export EXTERNAL_DATABASE_NAME="sandbox_database"

# ...
# ----------------------------------

export DEPLOYMENT_DOMAIN="soprun.com"
export DEPLOYMENT_NAMESPACE="sandbox-namespace"
export DEPLOYMENT_INSTANCE_NAME="sandbox-instance"
