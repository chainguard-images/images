#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

uid="sqlpad-$FREE_PORT"

docker run -d \
  -p $FREE_PORT:3000 \
  --name $uid \
  ${IMAGE_NAME}

# The server takes some time to startup
sleep 15

docker logs $uid

trap "docker logs $uid; docker kill $uid" EXIT

# The healthcheck endpoint requires auth, so just hit the normal URL.
curl -L localhost:$FREE_PORT/sqlpad | grep "SQLPad"
