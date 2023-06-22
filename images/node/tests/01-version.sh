#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" --version

# The image can be used to build an example application.
docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test --file ./../example/Dockerfile ../example
docker run --rm -p ${FREE_PORT}:8000 -d --name example-${FREE_PORT} smoke-test
sleep 3
curl http://localhost:${FREE_PORT}/test | grep payload
docker kill example-${FREE_PORT}
