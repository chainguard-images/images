#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The image fails to connect without a valid WAVEFRONT_API_TOKEN and WAVEFRONT_URL
set +o pipefail
docker run --rm  -e WAVEFRONT_URL=https://example.com/api -e WAVEFRONT_TOKEN="test" "${IMAGE_NAME}"  2>&1 | grep "Wavefront Proxy version"
