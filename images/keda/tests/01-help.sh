#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The help command exists with a non-zero exit code, so we need to just make sure it fails correctly.
set +o pipefail
docker run --rm "${IMAGE_NAME}" --help 2>&1 | grep keda
