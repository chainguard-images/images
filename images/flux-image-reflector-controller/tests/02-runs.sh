#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_REGISTRY}" == "" ]]; then
    echo "Must set IMAGE_REGISTRY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
    echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_TAG}" == "" ]]; then
    echo "Must set IMAGE_TAG environment variable. Exiting."
    exit 1
  fi
}

preflight

NAMESPACE=flux-system

function manifests() {
  # if image tag is latest then find the latest version of the git release
  if [[ "${IMAGE_TAG}" == "latest" ]]; then
    IMAGE_TAG=$(gh api repos/fluxcd/flux2/releases/latest | jq -r '.tag_name')
  fi

  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/fluxcd/flux2/manifests/bases/image-reflector-controller?ref=${IMAGE_TAG}
images:
  - name: fluxcd/image-reflector-controller
    newName: ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}
    newTag: ${IMAGE_TAG}
namespace: ${NAMESPACE}
EOF
}

manifests

kubectl create namespace ${NAMESPACE}
kubectl apply -k .

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/component=image-reflector-controller --namespace ${NAMESPACE}
