#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add wait-for-it

NAME="php-fpm-smoketest-$(shuf -i 0-128 -n 1)"

docker run -d --name "${NAME}" "${IMAGE_NAME}"
trap "docker logs ${NAME} && docker rm -f ${NAME}" EXIT
sleep 1

IP="$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${NAME})"
wait-for-it $IP:9000 --timeout=60
