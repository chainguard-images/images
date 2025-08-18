#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Skip test if not checking dev variant
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "Skipping pip test for non-dev variant"
  exit 0
fi

image=$(echo "$IMAGES" | jq -r '.python.ref')

docker run --rm --entrypoint /usr/bin/pip "${image}" --version
