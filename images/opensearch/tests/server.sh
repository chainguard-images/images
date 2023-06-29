#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"opensearch-smoketest-${FREE_PORT}"}

docker run -p ${FREE_PORT}:9200 -e "discovery.type=single-node" -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT

sleep 45
curl -v http://localhost:${FREE_PORT}/ | jq .version.build_type | grep "docker"
