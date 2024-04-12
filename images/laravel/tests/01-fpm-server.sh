#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"php-fpm-smoketest-${FREE_PORT}"}

docker run -p "${FREE_PORT}:9000" -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 1

count=0
max_retries=5
wait_time=1
while (( count < max_retries ))
do
    if nc -z localhost ${FREE_PORT}; then
        echo "Server is running"
        exit 0
    else
        sleep $wait_time
        ((wait_time *= 2))
        ((count++))
    fi
done
