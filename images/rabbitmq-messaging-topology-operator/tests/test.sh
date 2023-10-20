#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

function manifests() {
  # if image tag is latest then find the latest version of the git release
  LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/messaging-topology-operator/releases/latest" | jq -r '.tag_name')

  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - "https://github.com/rabbitmq/messaging-topology-operator/releases/download/${LATEST}/messaging-topology-operator.yaml"
patches:
  - patch: |
      - op: replace
        path: /spec/template/spec/containers/0/image
        value: ${RABBITMQ_MESSAGING_TOPOLOGY_OPERATOR_IMAGE}
    target:
      version: v1
      kind: Deployment
      name:  messaging-topology-operator
      namespace: rabbitmq-system
EOF
}

manifests

function certs() {
  openSSL genrsa -out ca.key 2048
  openssl req -x509 -new -nodes -days 1 -key ca.key -out ca.crt -subj "/CN=testdomain.com"
  openssl req -x509 -nodes -days 1 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=testdomain.com"
  kubectl create secret webhook-secret-cert -n rabbitmq-system --from-file=./ca.crt --from-file=./tls.crt --from-file=./tls.key
}

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

helm repo add jetstack https://charts.jetstack.io

helm install cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --set installCRDs=true \
    --wait \
    jetstack/cert-manager

CLUSTER_LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/cluster-operator/releases/latest" | jq -r '.tag_name')
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/download/${CLUSTER_LATEST}/cluster-operator.yml"

kubectl apply -k .

kubectl rollout status --timeout=5m --namespace rabbitmq-system deployment messaging-topology-operator
