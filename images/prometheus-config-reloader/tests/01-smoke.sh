#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

#
# kill_if_running checks to see if a container needs to be killed before
# killing it.
#
kill_if_running() {
  local -r container_id="${1}"
  if [ "$(docker ps --no-trunc | grep "${container_id}" | wc -l)" -ne "0" ]; then
    docker kill "${container_id}"
  fi
}

#
# search_log_for checks if a string shows up in logs
#
search_log_for() {
  local -r logfile="${1}"
  local -r search_string="${2}"
  local -r found=$(cat ${logfile} | grep ".*${search_string}.*" | wc -l)
  if [ "${found}" -eq "0" ]; then
    cat ${logfile}
    echo "Failed on ${search_string}"
    exit 1;
  fi
}

#
# start_container_detached is a helper function to start up a detached
# container with a fake config file so the server doesn't die immediately.
#
# The `docker run` command will spit out the container id on stdout so it can
# be captured to operate on the container further.
#
start_container_detached() {
  local -r config=/tmp/config.yaml
  touch "${config}"
  docker run \
    --detach --rm \
    --volume "${config}:/config.yaml" \
    "${IMAGE_NAME}" \
    --config-file /config.yaml
  sleep 2
}

#
# TEST_default_args tests that the container starts up without any arguments
#
TEST_default_args() {
  echo "Container starts up and finds config"
  local -r container_id=$(docker run --detach --tty "${IMAGE_NAME}")
  sleep 2

  local -r logfile=$(mktemp)
  docker logs -t "${container_id}" > ${logfile}
  kill_if_running "${container_id}"

  # Make sure the reloader tried to start
  search_log_for "${logfile}" 'Starting prometheus-config-reloader'

  # The reloader expects to be watching for configs but it won't find any
  search_log_for "${logfile}" 'nothing to be watched'
  echo "Success"
}

#
# TEST_startup is equivalent to `prometheus-config-reloader --version` and should test whether
# the binary can even print the version.
#
TEST_startup() {
  echo "Container starts up and finds config"
  docker run --rm --entrypoint prometheus-config-reloader "${IMAGE_NAME}" --version
  echo "Success"
}

#
# TEST_kill_signal tests to ensure the container will respond to kill signals.
# It will start up a container in the background and then send the specific
# signal to the container. After waiting for a few seconds it checks to see if
# the container is still alive, failing if it is.
#
TEST_kill_signal() {
  local -r signal="${1}"

  echo "${signal} Testing"

  local -r container_id=$(start_container_detached)

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
# Basic functional testing
#
TEST_startup
TEST_default_args
TEST_kill_signal "SIGTERM"
TEST_kill_signal "SIGKILL"
