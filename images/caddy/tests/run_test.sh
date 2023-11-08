#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "hello world" > index.html
ID=$(docker run -p ${FREE_PORT}:80 -v $PWD/index.html:/usr/share/caddy/index.html -v $PWD/Caddyfile:/etc/caddy/Caddyfile -d ${IMAGE_NAME} run --config /etc/caddy/Caddyfile)

docker logs $ID

trap "docker logs $ID && docker rm -f $ID" EXIT
sleep 5

# The healthcheck endpoin
curl http://localhost:${FREE_PORT} | grep "hello world"

