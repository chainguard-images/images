#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source ../libs/libs.sh

image="$(get_test_image "chainctl")"

test_entrypoint() {
  docker run --rm "$image" --help
  docker run --rm "$image" version
}

main() {
  test_entrypoint
}

main "$@"
