#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"influx-setup-test-$(date +%s)"}
docker run -d -p 8086:8086 --rm --name ${CONTAINER_NAME} "${IMAGE_NAME}"

# Wait for influx to start
sleep 20

# We have to setup a user before we can do anything with influx
docker exec $CONTAINER_NAME influx setup --username foo --password bazbarbat --org myorg --bucket foo --force
docker exec $CONTAINER_NAME influx user list | grep foo
docker exec $CONTAINER_NAME influx ping
