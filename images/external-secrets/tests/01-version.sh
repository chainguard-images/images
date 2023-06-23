#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The image fails if it can't connect to the k8s API, so we need to just make sure it fails correctly.
set +o pipefail
docker run --rm "${IMAGE_NAME}" --help 2>&1 | grep external-secrets
