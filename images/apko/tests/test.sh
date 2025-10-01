#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Source test libraries
source ../libs/libs.sh

# Get apko image reference
image=$(get_test_image "apko")

# Test apko version command
docker run --rm "$image" version