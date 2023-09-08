#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME Rscript -e 'print("Hello World!")' | grep "Hello World!"