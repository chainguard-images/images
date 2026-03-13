#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image="$(get_test_image "mariadb")"

docker run --rm "$image" --version
