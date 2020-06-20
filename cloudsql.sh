#!/usr/bin/env bash

set -o allexport
[[ -f .env ]] && source .env
set +o allexport

# https://cloud.google.com/sql/docs/mysql/connect-external-app


# curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
# chmod +x cloud_sql_proxy

# `project:region:instance-name`
# cloud_sql_proxy -instances=project-40825:europe-west3:shared-database=tcp:3306
