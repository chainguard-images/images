#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=influx-setup-test-${RANDOM}
docker run -d --rm --name ${CONTAINER_NAME} "${IMAGE_NAME}"
trap "docker rm -f ${CONTAINER_NAME}" EXIT

# Wait for influx to start
sleep 10

# We have to setup a user before we can do anything with influx
docker exec ${CONTAINER_NAME} influx setup --username foo --password bazbarbat --org myorg --bucket foo --force
docker exec ${CONTAINER_NAME} influx user list | grep foo
docker exec ${CONTAINER_NAME} influx ping
