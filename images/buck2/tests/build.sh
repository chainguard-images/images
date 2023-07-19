#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

pwd
docker run -v $(pwd):/work --rm -w /work --entrypoint=/bin/bash "${IMAGE_NAME}" build-test.sh

