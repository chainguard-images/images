#!/usr/bin/env bash

# monopod:tag:functional

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

IMAGE_REPOSITORY="$(echo "${IMAGE_NAME}" | cut -d: -f1)"
IMAGE_TAG="$(echo "${IMAGE_NAME}" | cut -d: -f2)"

helm repo add fluent https://fluent.github.io/helm-charts

helm upgrade \
  --install \
  fluent-bit fluent/fluent-bit \
  --set image.repository="${IMAGE_REPOSITORY}" \
  --set image.tag="${IMAGE_TAG}"

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=fluent-bit
