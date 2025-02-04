#!/usr/bin/env bash

image=$(echo "$IMAGES" | jq -r '.crane.ref')

docker run --rm "${image}" manifest cgr.dev/chainguard/static
docker run --rm "${image}" digest cgr.dev/chainguard/static
docker run --rm "${image}" ls --omit-digest-tags cgr.dev/chainguard/static
docker run --rm "${image}" config cgr.dev/chainguard/static
