#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="guacamole-${RANDOM}"
docker run --rm -d --name="${container_name}" "${IMAGE_NAME}"
trap "docker rm -f ${container_name}" EXIT

# Poll the logs for the startup string
for i in {1..5}; do
  if docker logs "${container_name}" 2>&1  | grep -e "Guacamole proxy daemon (guacd) version .* started"; then
    exit 0
  fi
  sleep 1
done

# Fail if the startup string was not found
exit 1
