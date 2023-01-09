#!/usr/bin/env bash

set -x
set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"unset"}
if [[ "${IMAGE_NAME}" == "unset" ]]; then
    echo "Must set IMAGE_NAME in the environment. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"rabbitmq-testing"}

trap "docker logs ${CONTAINER_NAME} && docker rm -f ${CONTAINER_NAME}" EXIT
docker rm -f "${CONTAINER_NAME}"

docker run --name "${CONTAINER_NAME}" \
    -p 5672:5672 -d "${IMAGE_NAME}"

sleep 10 # give it a chance to crash first

# Try to access the port for 10 seconds
test_img_cmd="until </dev/tcp/localhost/5672; do sleep 1; done"
if which timeout; then
    timeout 10s bash -c "${test_img_cmd}"
else
    # gtimeout is avail in homebrew in coreutils pacakge
    gtimeout 10s bash -c "${test_img_cmd}" 
fi
