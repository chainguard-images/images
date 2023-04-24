#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

IMAGE_REPOSITORY=$(echo "${IMAGE_NAME}" | cut -d: -f1)
IMAGE_TAG="$(echo "${IMAGE_NAME}" | cut -d: -f2)"

docker run "${IMAGE_REGISTRY}"/flux install --export --registry "${IMAGE_REGISTRY}" > flux-manifests.yaml

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

kustomize build . | kubectl apply -f -

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=flux-system --namespace flux-system