#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail  # We expect the command to fail, but want its output anyway.

docker run --rm  -e WAVEFRONT_URL=https://example.com/api -e WAVEFRONT_TOKEN="test" "${IMAGE_NAME}"  2>&1 | grep "Wavefront Proxy version"
