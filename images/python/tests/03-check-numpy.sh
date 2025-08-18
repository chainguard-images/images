#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Skip test if not checking dev variant
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "Skipping numpy test for non-dev variant"
  exit 0
fi

image=$(echo "$IMAGES" | jq -r '.python.ref')

docker run -u root --entrypoint sh --rm "${image}" -c "pip install numpy; python -c 'import numpy; print(numpy.__version__)'"
