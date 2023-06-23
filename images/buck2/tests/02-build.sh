#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

pwd
docker run -v $(pwd)/images/buck2:/work --rm -w /work --entrypoint=/bin/bash "${IMAGE_NAME}" /work/testdata/build-test.sh

