#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run ${IMAGE_NAME} install --export --registry "${IMAGE_REGISTRY}"
