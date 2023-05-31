#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

TMPDIR="$(mktemp -d)"
git clone --depth=1 https://github.com/bazelbuild/examples ${TMPDIR}

docker run --rm \
  -v "${TMPDIR}/flags-parsing-tutorial:/work" \
  -w /work \
  "${IMAGE_NAME}" build //...
