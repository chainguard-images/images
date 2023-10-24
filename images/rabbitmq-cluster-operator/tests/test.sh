#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
KUSTOMIZE_FILE="${TMPDIR}/kustomization.yaml"

function manifests() {
  # if image tag is latest then find the latest version of the git release
  LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/cluster-operator/releases/latest" | jq -r '.tag_name')

  cat <<EOF > "${KUSTOMIZE_FILE}"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - "https://github.com/rabbitmq/cluster-operator/releases/download/${LATEST}/cluster-operator.yml"
patches:
  - patch: |
      - op: replace
        path: /spec/template/spec/containers/0/image
        value: ${RABBITMQ_CLUSTER_OPERATOR_IMAGE}
    target:
      version: v1
      kind: Deployment
      name: rabbitmq-cluster-operator
      namespace: rabbitmq-system
EOF
}

manifests

kubectl apply -k "${TMPDIR}"

kubectl rollout status --timeout=5m --namespace rabbitmq-system deployment rabbitmq-cluster-operator

kubectl delete -k "${TMPDIR}"

rm -rf "${KUSTOMIZE_FILE}"
