#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm \
    -v "${PWD}/images/ffmpeg/tests:/work" \
    -w /work \
    "${IMAGE_NAME}" \
    -i sample.mov \
    /tmp/sample.mp4
