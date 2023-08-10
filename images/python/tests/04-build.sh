#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NEW_IMAGE_TAG="app-${RANDOM}"

# Using registry.local:5000 as the FROM in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

docker build \
  --build-arg=IMAGE_NAME="${IMAGE_NAME}" \
  --tag "${NEW_IMAGE_TAG}" .

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
