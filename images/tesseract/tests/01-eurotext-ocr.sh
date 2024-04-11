#!/usr/bin/env bash

## Using example image from
## https://tesseract-ocr.github.io/tessdoc/images/eurotext.png

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm \
    -v "${PWD}:/work" \
    -w /work \
    "${IMAGE_NAME}" \
    eurotext.png - | diff -u eurotext.exp -
