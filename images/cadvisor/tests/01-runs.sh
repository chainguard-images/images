#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NAMESPACE=cadvisor

function manifests() {
  # if image tag is latest then find the latest version of the git release
  LATEST=$(curl -s "https://api.github.com/repos/google/cadvisor/releases/latest" | jq -r '.tag_name')

  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/google/cadvisor/deploy/kubernetes/base?ref=${LATEST}
images:
  - name: gcr.io/cadvisor/cadvisor
    newName: ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}
    newTag: ${IMAGE_TAG}
namespace: ${NAMESPACE}
EOF
}

manifests

kubectl create namespace ${NAMESPACE}
kubectl apply -k .

kubectl wait --for=condition=ready pod --selector app=cadvisor --namespace ${NAMESPACE}
