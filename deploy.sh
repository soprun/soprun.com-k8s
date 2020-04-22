#!/usr/bin/env bash

# Get started with Google Cloud Platform

cloud_project="publication-273509"
cloud_region="europe-west3"
cloud_zone="europe-west3-a"

# gcloud config set compute/zone ${cloud_zone}
# gcloud config set compute/region ${cloud_region}

# networks_load_balancer_ip="35.198.124.128"
# networks_addresses="35.198.171.100"
# networks_instance_ip="35.198.124.128"

networks_external_ip="35.198.171.100" # :80-443
networks_internal_ip="35.198.124.128" # :22-443

# networks_internal_ip="35.198.124.128"
# networks_instance_ip="35.198.124.128"
# networks_internal_ip_mask="10.156.0.3/20"
instance_user="develop"

app_name="app"
app_namespace="publication"

app_config_from_email="no-reply@soprun.com"

app_config_mailgun_api_key="key-1a09d5d7b4abdadeb63bb88353181f68"
app_config_mailgun_domain="mg.soprun.com"
app_config_mailgun_region="US"

app_config_sendgrid_api_key="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"

# -------------------

# sendgrid

# Server	smtp.sendgrid.net
# Ports 25, 587	(for unencrypted/TLS connections)
# Ports 465	(for SSL connections)
# Username	apikey
# Password	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


# United States


# gcloud --project=publication-274603 compute firewall-rules create "ghost-tcp-80" --network https://www.googleapis.com/compute/v1/projects/publication-274603/global/networks/default --allow tcp:80 --target-tags "ghost-deployment"

#  --mail         Mail transport, E.g SMTP, Sendmail or Direct                                                   [string] [default: "Direct"]
#  --mailservice  Mail service (used with SMTP transport), E.g. Mailgun, Sendgrid, Gmail, SES...                                     [string]
#  --mailuser     Mail auth user (used with SMTP transport)                                                                          [string]
#  --mailpass     Mail auth pass (used with SMTP transport)                                                                          [string]
#  --mailhost     Mail host (used with SMTP transport)                                                                               [string]
#  --mailport     Mail port (used with SMTP transport)

# soprun.com mail send

# echo $SSH_KEY_ID

# ssh -t -i ${SSH_KEY_ID} "${ID_USER}@35.198.124.128" "sudo su - bitnami"

ssh -t bitnami@35.198.124.128

sudo /opt/bitnami/ctlscript.sh restart apache && curl -sIL https://soprun.com
