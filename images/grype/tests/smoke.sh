#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

image=$(echo "$IMAGES" | jq -r '.grype.ref')

# Test help command works
docker run --rm "${image}" help

# Test version command works
docker run --rm "${image}" version

# Test db status and update
docker run --rm "${image}" db update | grep -E "(updated|update)"

# Test scanning a known minimal image
docker run --rm "${image}" cgr.dev/chainguard/static:latest | grep -E "(No vulnerabilities found|VULNERABILITY)"

# Test scanning with different output formats
docker run --rm "${image}" cgr.dev/chainguard/static:latest -o table | grep -E "(No vulnerabilities found|VULNERABILITY)"
docker run --rm "${image}" cgr.dev/chainguard/static:latest -o json | jq .

# Test image with vulnerabilities
docker run --rm "${image}" golang | grep -E "(No vulnerabilities found|VULNERABILITY)"

# Test scanning with all layers (include every image layer)
docker run --rm "${image}" cgr.dev/chainguard/static:latest --scope all-layers | grep -E "(No vulnerabilities found|VULNERABILITY)"

# Test scanning a container image archive
docker pull cgr.dev/chainguard/static:latest
docker save cgr.dev/chainguard/static:latest -o testimage.tar
docker run --rm -v testimage.tar:/testimage.tar "${image}" /testimage.tar | grep -E "(No vulnerabilities found|VULNERABILITY)"

# Test scanning with only fixed or not-fixed vulnerabilities
docker run --rm "${image}" cgr.dev/chainguard/static:latest --only-fixed | grep -E "(No vulnerabilities found|VULNERABILITY)"
docker run --rm "${image}" cgr.dev/chainguard/static:latest --only-notfixed | grep -E "(No vulnerabilities found|VULNERABILITY)"

# Test scanning while excluding specific paths
docker run --rm "${image}" cgr.dev/chainguard/static:latest --exclude '/etc/**' | grep -E "(No vulnerabilities found|VULNERABILITY)"