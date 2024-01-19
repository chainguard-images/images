#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="dependency-track-${RANDOM}"
docker run --rm -d -p $FREE_PORT:8080 --name="${container_name}" "${IMAGE_NAME}"
trap "docker rm -f ${container_name}" EXIT

sleep 10

curl localhost:$FREE_PORT/api/version | jq .application | grep Dependency-Track
