#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

FLUX_CLI_IMAGE=${FLUX_CLI_IMAGE:-"cgr.dev/chainguard/flux"}

function flux_manifests() {
  docker run ${FLUX_CLI_IMAGE} install --export --registry "${IMAGE_REGISTRY}" > flux-manifests.yaml

  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - flux-manifests.yaml
images:
  - name: ${IMAGE_REGISTRY}/source-controller
    newName: ${IMAGE_REGISTRY}/source-controller
    newTag: ${IMAGE_TAG}
  - name: ${IMAGE_REGISTRY}/kustomize-controller
    newName: ${IMAGE_REGISTRY}/kustomize-controller
    newTag: ${IMAGE_TAG}
  - name: ${IMAGE_REGISTRY}/notification-controller
    newName: ${IMAGE_REGISTRY}/notification-controller
    newTag: ${IMAGE_TAG}
  - name: ${IMAGE_REGISTRY}/helm-controller
    newName: ${IMAGE_REGISTRY}/helm-controller
    newTag: ${IMAGE_TAG}
EOF
}

flux_manifests

kustomize build . | kubectl apply -f -

kubectl wait --for=condition=ready pod --selector app=notification-controller --namespace flux-system