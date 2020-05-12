#!/usr/bin/env bash

# Чтобы включить метрики, выполните следующее:
# gcloud config set disable_usage_reporting false


gcloud services list >> tmp/services-list.txt

# gcloud services enable sqladmin.googleapis.com

gcloud services enable sqladmin.googleapis.com

gcloud sql instances create cloudsql001 
  --zone us-central1-a
  --root-password=[PASSWORD]
  --database-flags=log_output='FILE',slow_query_log=on,long_query_time=2
