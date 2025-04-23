#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

test_entrypoint() {
  local image
  image="$(get_test_image "min-toolkit-debug")"
  docker run --rm --entrypoint "$1" "${image}" "$2"
}

main() {
  test_entrypoint "bash" "--version"
  test_entrypoint "bash" "--help"
  test_entrypoint "grpcurl" "--version"
  test_entrypoint "grpcurl" "--help"
  test_entrypoint "oras" "--help"
  test_entrypoint "oras" "version"
}

main "$@"


