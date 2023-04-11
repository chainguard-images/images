#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"opensearch-smoketest-$(date +%s)"}

docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 20
curl -v http://localhost:9200/ | jq .version.build_type | grep "docker"
