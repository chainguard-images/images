#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TAG="smoke-test-${FREE_PORT}"
CONTAINER="node-example-${FREE_PORT}"

function cleanup() {
  docker kill ${CONTAINER}
  docker rmi ${TAG}
}

trap cleanup EXIT

docker run --rm "${IMAGE_NAME}" --version

# The image can be used to build an example application.
docker build --build-arg BASE=${IMAGE_NAME} --tag ${TAG} --file ./../example/Dockerfile ../example
docker run --rm -p ${FREE_PORT}:8000 -d --name ${CONTAINER} ${TAG}
curl --retry 3 --retry-all-errors http://localhost:${FREE_PORT}/test | grep payload
