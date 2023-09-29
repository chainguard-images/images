#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Set the name of the image if needed
if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

#
# start_fluentd_detached is a helper function to start up a detached fluentd
# container with the config in the tests/configs directory. The `docker run`
# command will spit out the container id on stdout so it can be captured to
# operate on the container further.
#
start_fluentd_detached() {
  SCRIPT_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
  docker run \
    --detach --rm \
    --publish 127.0.0.1:${FREE_PORT}:24224 \
    --volume "$(pwd)/configs/basic_docker.conf:/etc/fluent/fluent.conf" \
    "${IMAGE_NAME}"
  sleep 2
}

echo_to_fluentd() {
  local -r echo_string="${1}"
  docker run \
    --rm \
    --log-driver=fluentd \
    --log-opt fluentd-address=127.0.0.1:${FREE_PORT} \
    --log-opt tag="docker.{{.ID}}" \
    cgr.dev/chainguard/wolfi-base \
    echo "${echo_string}"
}

#
# TEST_default_args tests that the container starts up without any arguments
#
TEST_default_args() {
  echo "Container starts up and finds config"
  local -r container_id=$(docker run --detach --rm "${IMAGE_NAME}")
  sleep 5
  docker kill "${container_id}"
  echo "Success"
}
#
# TEST_find_config is equivalent to `fluentd --dry-run` and should test a few
# things:
# 1. Will the fluentd image even start?
# 2. Does fluentd find it's config file?
# 3. Does fluentd have access to all the files it needs to start up?
#
TEST_find_config() {
  echo "Container starts up and finds config"
  docker run --rm --entrypoint fluentd "${IMAGE_NAME}" --dry-run
  echo "Success"
}

#
# TEST_kill_signal tests to ensure the container will respond to kill signals.
# It will start up a fluentd container in the background and then send the
# specific signal to the container. After waiting for a few seconds it checks
# to see if the container is still alive, failing if it is.
#
TEST_kill_signal() {
  local -r signal="${1}"

  echo "${signal} Testing"
  local -r container_id=$(start_fluentd_detached)

  # Attempt to kill the container with the specified signal
  docker kill "${container_id}" --signal "${signal}"

  # Wait for the container to die
  sleep 5

  # Check if container is still running
  # NOTE: The `grep` needs to be inside the conditional so it doesn't fail the
  #       script due to the `-o pipefail`
  if [ "$(docker ps --no-trunc | grep "${container_id}" | wc -l)" -ne "0" ]; then
    docker ps --no-trunc
    echo "${signal} Failed"
    exit 1;
  fi
  echo "${signal} Success"
}

#
# TEST_basic_docker_logging tests that the fluentd process will receive logs
# from another container when specified as the log driver. It will start a
# detached fluentd container and then use a second container to echo a string
# which should be picked up by the fluentd logging process.
#
# The fluentd process will log the message to stdout so the function just greps
# the logs for the same string.
#
TEST_basic_docker_logging_single() {
  echo "Basic logging single"

  # Start fluentd container
  local -r container_id=$(start_fluentd_detached)

  # Echo string to fluentd
  local -r echo_string="Hello Fluentd! We built ${IMAGE_NAME}"
  echo_to_fluentd "${echo_string}"

  # Check if string shows up in fluentd logs
  local -r found=$(docker logs "${container_id}" | grep ".*\"log\":\"${echo_string}\".*" | wc -l)
  if [ "${found}" -eq "0" ]; then
    docker logs "${container_id}"
    echo "Failed"
    exit 1;
  fi
  echo "Success"

  # Clean up fluentd container
  docker kill "${container_id}"
}

TEST_basic_docker_logging_multiple() {
  echo "Basic logging multiple"

  # Start fluentd container
  local -r container_id=$(start_fluentd_detached)

  # Echo string three separate strings to fluentd
  for echo_string in "Hello Fluentd!" "We built ${IMAGE_NAME}" $(head -c 50 /dev/urandom | base64); do
    echo_to_fluentd "${echo_string}"

    # Check if string shows up in fluentd logs
    local found=$(docker logs "${container_id}" | grep ".*\"log\":\"${echo_string}\".*" | wc -l)
    if [ "${found}" -eq "0" ]; then
      docker logs "${container_id}"
      echo "Failed on ${echo_string}"
      exit 1;
    fi
  done
  echo "Success"

  # Clean up fluentd container
  docker kill "${container_id}"
}

#
# Basic functional testing
#
TEST_default_args
TEST_find_config
TEST_kill_signal "SIGTERM"
TEST_kill_signal "SIGKILL"
TEST_basic_docker_logging_single
TEST_basic_docker_logging_multiple
