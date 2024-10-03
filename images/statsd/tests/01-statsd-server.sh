#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add netcat-openbsd

NAME="statsd-smoketest-$(shuf -i 0-128 -n 1)"

docker run -d --name "${NAME}" "${IMAGE_NAME}"
trap "docker logs ${NAME} && docker rm -f ${NAME}" EXIT
sleep 1

IP="$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${NAME})"
count=0
max_retries=5
wait_time=1
while (( count < max_retries ))
do
    if nc -u -z "${IP}" 8125; then
        echo "Server is running"
	break
    else
        sleep $wait_time
        ((wait_time *= 2))
        ((count++))
    fi
    exit 1
done
if echo counters | nc -N "${IP}" 8126 | grep -q "bad_lines"; then
    echo "Management service is running"
else
    exit 1
fi
echo "foo:1|c" | nc -u -w0 "${IP}" 8125
if echo counters | nc -N "${IP}" 8126 | grep -q "foo"; then
    echo "Test count data received"
else
    exit 1
fi
