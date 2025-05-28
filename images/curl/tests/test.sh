#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.curl.ref')

# Test basic command
docker run --rm "$image" --version

GET_URL="https://raw.githubusercontent.com/chainguard-images/images/main/README.md"
POST_URL="https://httpbin.org/post"

docker run --rm "$image" -v "${GET_URL}" | tee output.txt | grep -q "Chainguard Images" 

docker run --rm "$image" curl --fail -X POST -H "Content-Type: application/json" \
  -d '{"name": "chainguard"}' \
  "${POST_URL}" | grep -q '"name": "chainguard"'
