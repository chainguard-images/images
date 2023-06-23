#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
git clone --depth=1 https://github.com/bazelbuild/examples ${TMPDIR}

docker run --rm \
  -v "${TMPDIR}/flags-parsing-tutorial:/work" \
  -w /work \
  "${IMAGE_NAME}" build //...
