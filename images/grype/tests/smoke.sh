#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

image=$(echo "$IMAGES" | jq -r '.grype.ref')

# Test help command works
docker run --rm "${image}" help

# Test version command works
docker run --rm "${image}" version

# Test db status and update
docker run --rm "${image}" db update

# Test scanning various images
# Use a known minimal image
docker run --rm "${image}" cgr.dev/chainguard/static:latest

# Test scanning with different output formats
docker run --rm "${image}" cgr.dev/chainguard/static:latest -o table
docker run --rm "${image}" cgr.dev/chainguard/static:latest -o json

# Test scanning with specific severity threshold
docker run --rm "${image}" cgr.dev/chainguard/static:latest --fail-on high
