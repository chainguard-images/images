#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.git.ref')

# Test git version
docker run --rm "${image}" --version

# Test git submodule help
docker run --rm "${image}" submodule -h

# Test repo cloning
CLONE_URL="https://github.com/chainguard-images/.github.git"
CLONEDIR="$(mktemp -d)"
chmod go+wrx "${CLONEDIR}"

# Clone and verify
pushd "${CLONEDIR}"
docker run --rm -v "${PWD}":/w -w /w "${image}" clone --depth 1 "${CLONE_URL}" .
popd

# Verify clone worked
find "${CLONEDIR}/README.md" && echo "Clone test passed."

# Cleanup
rm -rf "${CLONEDIR}"