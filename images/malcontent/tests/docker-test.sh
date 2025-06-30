#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image="$(get_test_image "malcontent")"

test_entrypoint() {
  docker run --rm $image --help
  docker run --rm $image --version
}

test_analyze() {
  docker run --rm "$image" --ignore-self=false analyze /usr/bin/mal | tee /dev/stderr | grep -Ei 'RISK|DESCRIPTION|EVIDENCE'
}

test_scan() {
  docker run --rm "$image" scan /usr/bin/mal
}

test_analyze_image() {
  docker run --rm "$image" analyze --image cgr.dev/chainguard/curl:latest
}

main() {
  test_entrypoint
  test_analyze
  test_scan
  test_analyze_image
}

main "$@"
