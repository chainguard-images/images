#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

ID=$(docker run -p 2019 -d ${IMAGE_NAME})

docker logs $ID

trap "docker logs $ID; docker stop $ID" EXIT

# The healthcheck endpoint requires auth, so just hit the normal URL.
curl localhost:$(docker port $ID | cut -d ' ' -f 3)
