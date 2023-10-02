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
  docker run \
    --detach --rm \
    --publish 127.0.0.1:${FREE_PORT}:24224 \
    --volume "$(pwd)/configs/basic_splunk.conf:/etc/fluent/fluent.conf" \
    "${IMAGE_NAME}"
  sleep 15
}

TEST_started_ok() {
  local -r container_id=$(start_fluentd_detached)

  docker logs "${container_id}" | grep "fluentd worker is now running worker=0"
}

TEST_started_ok
