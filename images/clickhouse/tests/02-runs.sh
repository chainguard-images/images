#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Start up the clickhouse server container in the background
name=clickhouse-${RANDOM}
docker run --rm -d --name $name -u101:101 -p8123:8123/tcp "${IMAGE_NAME}" server -- --listen_host 0.0.0.0

sleep 5

# Run curl container and run command to check version, greps for 200 OK status code from curl
echo 'SELECT version()' | docker run -i --rm --link $name cgr.dev/chainguard/curl "http://${name}:8123/?query=" -s -w '%{http_code}' --data-binary @- | grep 200

docker kill $name