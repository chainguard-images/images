#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NAMESPACE=cadvisor

function manifests() {
  # if image tag is latest then find the latest version of the git release
  if [[ "${IMAGE_TAG}" == "latest" ]]; then
    IMAGE_TAG=$(gh api repos/google/cadvisor/releases/latest | jq -r '.tag_name')
  fi

  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/google/cadvisor/deploy/kubernetes/base?ref=${IMAGE_TAG}
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
