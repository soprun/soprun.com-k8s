#!/usr/bin/env bash

set -o allexport
[[ -f .env ]] && source .env
set +o allexport

# gcloud config set project project-40825
