#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="temporal-ui-server-${FREE_PORT}"

docker run -d -p ${FREE_PORT}:8080 --name ${CONTAINER_NAME} ${IMAGE_NAME}

trap "docker rm -f ${CONTAINER_NAME}" EXIT

# TODO: Really test this once we have a temporal server available.
curl --retry-all-errors --retry 3 localhost:${FREE_PORT}
