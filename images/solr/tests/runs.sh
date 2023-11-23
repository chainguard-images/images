#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="aws-flb-${RANDOM}"
docker run --rm -d -p $FREE_PORT:8983 --name="${container_name}" "${IMAGE_NAME}"
trap "docker rm -f ${container_name}" EXIT

sleep 10
docker logs "${container_name}" | grep "Server Started"

curl localhost:$FREE_PORT/api | jq .responseHeader.status | grep 0
