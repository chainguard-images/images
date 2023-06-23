#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

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
  touch /tmp/token
  docker run \
    --detach --rm \
    -e KUBERNETES_SERVICE_HOST=mock \
    -e KUBERNETES_SERVICE_PORT=mock \
    -v /tmp/token:/var/run/secrets/kubernetes.io/serviceaccount/token \
    "${IMAGE_NAME}"
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

  # Make sure the operator tried to start
  search_log_for "${logfile}" 'Starting Prometheus Operator'

  # The operator expects to be inside a k8s pod so it should print these on stderr
  search_log_for "${logfile}" 'KUBERNETES_SERVICE_HOST and KUBERNETES_SERVICE_PORT'
  echo "Success"
}

#
# TEST_startup is equivalent to `operator --version` and should test whether
# the binary can even print the version.
#
TEST_startup() {
  echo "Container starts up and finds config"
  docker run --rm --entrypoint operator "${IMAGE_NAME}" --version
  echo "Success"
}

#
# Basic functional testing
#
TEST_startup
TEST_default_args
