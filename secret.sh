#!/usr/bin/env bash

source env.sh

# List all secrets
# kubectl get secrets --namespace ${DEPLOYMENT_NAMESPACE}

readonly SECRET_NAME=wordpress-database-b56gc4mdch

# kubectl get secrets/db-user-pass --template={{.data.password}} | base64 -D
# kubectl get secrets/db-user-pass --template={{.data.username}} | base64 -D

#kubectl get secrets/${secret_name} --namespace ${DEPLOYMENT_NAMESPACE}

# kubectl describe secret ${secret_name} --namespace ${DEPLOYMENT_NAMESPACE}


# kubectl get secret ${SECRET_NAME} --output jsonpath="{.data.DATABASE_PASSWORD}" | base64 --decode > 1.txt


#kubectl edit secret ${secret_name}

#kubectl create secret generic ${secret_name} \
#--from-literal=DATABASE_PASSWORD=devuser

#kubectl create secret generic wordpress-database \
#    --from-literal=DATABASE_HOST=${DATABASE_HOST} \
#    --from-literal=DATABASE_USERNAME=${DATABASE_USERNAME} \
#    --from-literal=DATABASE_PASSWORD=${DATABASE_PASSWORD} \
#    --from-literal=DATABASE_NAME=${DATABASE_NAME} \
#    --output yaml \
#    --dry-run=client | kubectl apply -f -
#
#kubectl get secret wordpress-database --output yaml
