#!/usr/bin/env bash

# set -o allexport
# [[ -f .env ]] && source .env
# set +o allexport

set -e
source env.sh

echo "Cluster create namespace..."
# kubectl create namespace ${DEPLOYMENT_NAMESPACE}

echo "Cluster create secret..."
kubectl create secret generic database-credentials \
  --namespace ${DEPLOYMENT_NAMESPACE} \
  --from-literal endpoint=${DATABASE_ENDPOINT} \
  --from-literal name=${DATABASE_NAME} \
  --from-literal username=${DATABASE_USERNAME} \
  --from-literal password=${DATABASE_PASSWORD} \
  --output yaml \
  --dry-run=client | kubectl apply -f -

echo "Cluster apply configuration in app..."
kubectl apply --namespace ${DEPLOYMENT_NAMESPACE} --kustomize ./app/

# export SERVICE_IP=$(kubectl get svc --namespace ${DEPLOYMENT_NAMESPACE} ${DEPLOYMENT_INSTANCE_NAME} --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")

# echo Username: user
# echo Password: $(kubectl get secret --namespace ${DEPLOYMENT_NAMESPACE} ${DEPLOYMENT_INSTANCE_NAME} -o jsonpath="{.data.wordpress-password}" | base64 --decode)


# Просмотрите группу контейнеров
# Чтобы проверить, запущена ли группа контейнеров головного хранилища Redis, введите следующую команду:
# kubectl get pods


# Чтобы убедиться, что сервис создан, введите следующую команду:
# kubectl get service

# Получите список сервисов:
# Дождитесь, когда в столбце External IP для интерфейсной службы отобразится IP-адрес frontend.
# Это может занять около минуты. Чтобы остановить мониторинг сервисов, нажмите Ctrl+C.
# kubectl get services --watch



