#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NEW_IMAGE_TAG="app-${RANDOM}"

docker build \
  --build-arg=IMAGE_NAME="${IMAGE_NAME}" \
  --tag "${NEW_IMAGE_TAG}"

id=$(docker run --detach --publish "${FREE_PORT}:5000" ${NEW_IMAGE_TAG})
trap "docker kill ${id}" EXIT

for i in {1..5}
do
  if curl http://0.0.0.0:${FREE_PORT} | grep 'Hello, World!'; then
    exit 0
  fi
  sleep 1
done

exit 1
