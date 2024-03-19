#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NAME="k8ssandra-system-logger"

docker run --rm -d --name "$NAME" ${IMAGE_NAME}

sleep 10

logs=$(docker logs "$NAME" 2>&1)

docker kill --signal=INT "$NAME"
docker wait "$NAME"

asserts=("Vector has started." "Healthcheck passed.")

# assert that all the expected logs are present
for assert in "${asserts[@]}"; do
  if ! echo "$logs" | grep -q "$assert"; then
    echo "Assertion failed: $assert"
    exit 1
  fi
done

echo "All assertions passed."
