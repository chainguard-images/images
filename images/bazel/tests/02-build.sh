#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
git clone --depth=1 https://github.com/bazelbuild/examples ${TMPDIR}

function test_build {
  docker run --rm \
    -v "${TMPDIR}/flags-parsing-tutorial:/work" \
    -w /work \
    "${IMAGE_NAME}" build $@ //...
}

# Bazel 7+ needs the --noenable_bzlmod flag, but
# older versions do not recognize it. Require either to pass
# See https://github.com/chainguard-images/images/pull/2062
test_build --noenable_bzlmod || test_build
