#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm "${IMAGE_NAME}" --version

# The image can be used to build an example application.
docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test --file example/Dockerfile example
docker run --rm -p 8000:8000 -d --name example smoke-test
sleep 2
curl http://localhost:8000/test | grep payload
docker kill example
