#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

pwd
docker run -v $(pwd)/images/buck2:/work --rm -w /work --entrypoint=/bin/bash "${IMAGE_NAME}" /work/testdata/build-test.sh

