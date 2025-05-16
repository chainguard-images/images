#!/usr/bin/env bash
set -euo pipefail

image=$(echo "$IMAGES" | jq -r '.crane.ref')

docker run --rm "${image}" manifest cgr.dev/chainguard/static | grep image.manifest.v1+json
docker run --rm "${image}" digest cgr.dev/chainguard/static | grep sha256:
docker run --rm "${image}" ls --omit-digest-tags cgr.dev/chainguard/static | grep latest
docker run --rm "${image}" config cgr.dev/chainguard/static | grep sha256:

docker network create my-network

docker run -d --rm --name dummy-registry --network my-network -p 5002:5002 \
  "${image}" registry serve --address :5002

registry_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dummy-registry)

docker run --rm --network my-network "${image}" cp cgr.dev/chainguard/static ${registry_ip}:5002/chainguard/static 

docker run --rm --network my-network "${image}" manifest ${registry_ip}:5002/chainguard/static| grep image.manifest.v1+json
