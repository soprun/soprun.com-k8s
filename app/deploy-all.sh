#!/usr/bin/env bash

source ./environment.sh
# printenv | sort

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ingress bitnami/nginx-ingress-controller

kubectl get svc ingress-nginx-ingress-controller -o jsonpath="{.status.loadBalancer.ingress[0].ip}"

helm repo add jetstack https://charts.jetstack.io
kubectl create namespace cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.1/cert-manager.crds.yaml

kubectl apply -f letsencrypt-prod.yaml

helm install cert-manager --namespace cert-manager jetstack/cert-manager --version v0.14.1





helm install ${DEPLOYMENT_NAME} bitnami/wordpress \
  --set mariadb.enabled=false \
  --set externalDatabase.host=DATABASE-ENDPOINT \
  --set externalDatabase.user=DATABASE-USERNAME \
  --set externalDatabase.password=DATABASE-PASSWORD \
  --set externalDatabase.database=DATABASE-NAME \
  --set externalDatabase.port=3306 \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.certManager=true \
  --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod \
  --set ingress.hostname=soprun.com \
  --set ingress.extraTls[0].hosts[0]=soprun.com \
  --set ingress.extraTls[0].secretName=wordpress.local-tls
