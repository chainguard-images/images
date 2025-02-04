#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.wordpress.ref')

container_id=$(docker run --detach --rm "$image")

max_attempts=15
attempt=1
delay=30

while [ $attempt -le $max_attempts ]; do
  if docker logs "$container_id" 2>&1 | grep -q "ready to handle connections"; then
    echo "WordPress is ready!"
    break
  fi

  echo "Attempt $attempt failed. Retrying in $delay seconds..."
  sleep $delay
  attempt=$((attempt + 1))

  if [ $attempt -gt $max_attempts ]; then
    echo "Failed after $max_attempts attempts"
    exit 1
  fi
done
