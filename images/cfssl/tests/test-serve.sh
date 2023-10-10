#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run -d --name cfssl-${FREE_PORT} -p ${FREE_PORT}:${FREE_PORT} "${IMAGE_NAME}" serve --address 0.0.0.0 --port ${FREE_PORT}
trap "docker rm -f cfssl-${FREE_PORT}" EXIT
sleep 5

curl localhost:${FREE_PORT}/api/v1/cfssl/health | grep '"healthy":true'
