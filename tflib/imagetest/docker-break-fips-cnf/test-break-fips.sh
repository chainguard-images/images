#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

test_image="$(get_test_image "test_image")"

# Parse environment variables for docker run
# ENV_VARS should be space-separated like "VAR1=value1 VAR2=value2"
parse_env_vars() {
  local env_vars=""
  if [ -n "${ENV_VARS:-}" ]; then
    for var in $ENV_VARS; do
      env_vars="$env_vars -e $var"
    done
  fi
  echo "$env_vars"
}

ENV_VARS=$(parse_env_vars)

# TODO @klrmngr: implement custom script functionality
# dev_image="$(get_test_image "dev_image")"

test_break_fips_config() {
  echo "Testing that breaking FIPS config causes failure..."
  docker_cmd=(docker run --rm -v "$(pwd)/fipsmodule.cnf:/etc/ssl/fipsmodule.cnf")

  if [ -n "${ENV_VARS:-}" ]; then
    docker_cmd+=(${ENV_VARS})
  fi

  if [ -n "${ENTRYPOINT:-}" ]; then
    image="$test_image"
    docker_cmd+=(--entrypoint="${ENTRYPOINT}")
  else
    image="$test_image"
  fi

  docker pull "$image"
  docker_cmd+=("$image")

  if [ -n "${ENTRYPOINT_ARGS:-}" ]; then
    docker_cmd+=(${ENTRYPOINT_ARGS})
  fi

  output=$("${docker_cmd[@]}" 2>&1 || true)

  if echo "$output" | grep -q "${EXPECTED_PANIC_MESSAGE}"; then
    echo "Found expected error message containing: ${EXPECTED_PANIC_MESSAGE}"
  else
    echo "Expected to find: ${EXPECTED_PANIC_MESSAGE}"
    echo "Actual output: $output"
    echo "$output" | cat > out.log
    exit 1
  fi
}

main() {
  test_break_fips_config
}

main "$@"
