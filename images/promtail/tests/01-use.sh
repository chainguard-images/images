#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"


id=$(docker run -d --rm "${IMAGE_NAME}")
sleep 10
trap "docker kill ${id}" EXIT

docker logs "${id}" 2>&1 | grep "Starting Promtail"
