#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Cosign 2.1 requires a TTY
# https://github.com/sigstore/cosign/issues/3081
docker run -t $IMAGE_NAME help
