#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"cloudwatch-runs-${FREE_PORT}"}

docker run -d -v ${PWD}:/config -p "${FREE_PORT}:9106" --name $CONTAINER_NAME $IMAGE_NAME /config/cloudwatch.yaml
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
curl localhost:${FREE_PORT}/metrics | grep cloudwatch_exporter_build_info
