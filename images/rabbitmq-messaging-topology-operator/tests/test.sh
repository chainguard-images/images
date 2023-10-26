#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
KUSTOMIZE_FILE="${TMPDIR}/kustomization.yaml"

function manifests() {
  # if image tag is latest then find the latest version of the git release
  LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/messaging-topology-operator/releases/latest" | jq -r '.tag_name')

  cat <<EOF > "${KUSTOMIZE_FILE}"
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

CAKEY="${TMPDIR}/ca.key"
CACRT="${TMPDIR}/ca.crt"
TLSKEY="${TMPDIR}/tls.key"
TLSCRT="${TMPDIR}/tls.crt"

function certs() {
  openssl genrsa -out "${CAKEY}" 2048
  openssl req -x509 -new -nodes -days 1 -key "${CAKEY}" -out "${CACRT}" -subj "/CN=testdomain.com"
  openssl req -x509 -nodes -days 1 -newkey rsa:2048 -keyout "${TLSKEY}" -out "${TLSCRT}" -subj "/CN=testdomain.com"
  kubectl create namespace rabbitmq-system
  kubectl create secret generic webhook-server-cert -n rabbitmq-system --from-file="${CACRT}" --from-file="${TLSCRT}" --from-file="${TLSKEY}"
}

certs

helm repo add jetstack https://charts.jetstack.io

helm install cert-manager-rmq-mto \
    --namespace cert-manager-rmq-mto \
    --create-namespace \
    --set installCRDs=true \
    --wait \
    jetstack/cert-manager

CLUSTER_LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/cluster-operator/releases/latest" | jq -r '.tag_name')
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/download/${CLUSTER_LATEST}/cluster-operator.yml"

kubectl apply -k "${TMPDIR}"

kubectl rollout status --timeout=5m --namespace rabbitmq-system deployment messaging-topology-operator

kubectl delete -k "${TMPDIR}"

helm uninstall cert-manager-rmq-mto -n cert-manager-rmq-mto

rm -rf "${KUSTOMIZE_FILE}" "${CAKEY}" "${CACRT}" "${TLSKEY}" "${TLSCRT}"
