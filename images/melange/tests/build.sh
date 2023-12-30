#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm --privileged=true -v "${PWD}/images/melange/tests:/work" $IMAGE_NAME build minimal.yaml --arch=$(uname -m) --out-dir /tmp
