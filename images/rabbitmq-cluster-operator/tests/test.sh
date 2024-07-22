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

function test_rabbitmq_cluster_operator() {
  # First ensure the operator pod is running our image and not the upstream one
  local actual_image="$(kubectl get pods -n rabbitmq-system -o json | jq -r .items[0].spec.containers[0].image)"
  if [[ "${actual_image}" != "${RABBITMQ_CLUSTER_OPERATOR_IMAGE}" ]]; then
    echo "Test failed: actual image deployed by oeprator is ${actual_image} (vs. ${RABBITMQ_CLUSTER_OPERATOR_IMAGE})."
    exit 1
  fi

  # Create the rabbitmq custom resource
  # (orgiinally from https://github.com/rabbitmq/cluster-operator/blob/ac49962867b9c0d94f05c3a49fbe9d002d851b37/docs/examples/hello-world/rabbitmq.yaml)
  kubectl apply -f - <<EOF
apiVersion: rabbitmq.com/v1beta1
kind: RabbitmqCluster
metadata:
  name: hello-world
EOF

  # Give the operator a few seconds to modify the resource
  sleep 3
  kubectl get -o yaml rabbitmqclusters.rabbitmq.com hello-world

  # Check that the spec has been modified by the operator
  if [[ "$(kubectl get -o json rabbitmqclusters.rabbitmq.com hello-world | jq -r .spec.image)" == "" ]]; then
    echo "Test failed: rabbitmqcluster resource did not get updated by operator."
    exit 1
  fi

  # Delete it (remove finializers first so it does not hang)
  kubectl patch rabbitmqclusters.rabbitmq.com hello-world \
    -p '{"metadata":{"finalizers":null}}' --type=merge && \
      kubectl delete rabbitmqclusters.rabbitmq.com hello-world
}

manifests

kubectl apply -k "${TMPDIR}"

kubectl rollout status --timeout=5m --namespace rabbitmq-system deployment rabbitmq-cluster-operator

test_rabbitmq_cluster_operator

kubectl delete -k "${TMPDIR}"

rm -rf "${KUSTOMIZE_FILE}"
