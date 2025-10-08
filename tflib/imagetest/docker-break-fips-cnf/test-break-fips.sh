#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

image="$(get_test_image "test_image")"

test_break_fips_config() {
  echo "Testing that breaking FIPS config causes failure..."

  # to clean up error message
  docker pull "$image"

  if [ -n "${ENTRYPOINT:-}" ]; then
    output=$(docker run --rm -v "$(pwd)/fipsmodule.cnf:/etc/ssl/fipsmodule.cnf" "$image" sh -c "${ENTRYPOINT}" 2>&1 || true)
  else
    # Use default entrypoint
    output=$(docker run --rm -v "$(pwd)/fipsmodule.cnf:/etc/ssl/fipsmodule.cnf" "$image" 2>&1 || true)
  fi

  if echo "$output" | grep -q "${EXPECTED_PANIC_MESSAGE}"; then
    echo "Found expected error message containing: ${EXPECTED_PANIC_MESSAGE}"
  else
    echo "Expected to find: ${EXPECTED_PANIC_MESSAGE}"
    echo "Actual output: $output"
    exit 1
  fi
}

main() {
  test_break_fips_config
}

main "$@"
