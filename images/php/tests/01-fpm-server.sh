#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add netcat-openbsd

NAME="php-fpm-smoketest-$(shuf -i 0-128 -n 1)"

docker run -d --name "${NAME}" "${IMAGE_NAME}"
trap "docker logs ${NAME} && docker rm -f ${NAME}" EXIT
sleep 1

IP="$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${NAME})"
count=0
max_retries=5
wait_time=1
while (( count < max_retries ))
do
    if nc -z "${IP}" 9000; then
        echo "Server is running"
        exit 0
    else
        sleep $wait_time
        ((wait_time *= 2))
        ((count++))
    fi
done
exit 1
