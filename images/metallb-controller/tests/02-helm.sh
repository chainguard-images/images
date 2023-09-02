#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

# Make a file in the current directory and run the cedar tool on it.

helm repo add metallb https://metallb.github.io/metallb
helm upgrade --install metallb metallb/metallb --set controller.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" --set controller.image.tag="${IMAGE_TAG}"
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=metallb --timeout 60s