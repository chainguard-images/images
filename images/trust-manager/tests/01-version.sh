#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep "failed to create manager"
