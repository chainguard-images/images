#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.dive.ref')

# Test version command
docker run --rm "$image" --version >/dev/null

# Test dive analysis on a static image
docker pull cgr.dev/chainguard/static
docker save cgr.dev/chainguard/static >static.tar

docker run --rm -u 0:0 -v "$PWD":/work --workdir=/work "$image" --source docker-archive static.tar -j out.json
cat out.json | grep "efficiencyScore"

