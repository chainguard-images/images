#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image="$(get_test_image "wait-for-it")"

# Test 1: Wait for an available service (google.com:80)
docker run --rm "$image" -h google.com -p 80

# Test 2: Negative test - verify timeout behavior on unreachable port
# Temporarily disable errexit to capture exit code
set +o errexit
docker run --rm "$image" www.google.com:81 --timeout=1 --strict -- echo "google is up"
exit_status=$?
set -o errexit

if [ "$exit_status" -ne 124 ]; then
  echo "Expected exit code 124, but got $exit_status"
  exit 1
fi
