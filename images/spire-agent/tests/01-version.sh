#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm --entrypoint=/usr/bin/spire-agent "${IMAGE_NAME}" --version
