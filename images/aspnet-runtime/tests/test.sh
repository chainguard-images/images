#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image=$(get_test_image "aspnet-runtime")

echo "=== Testing dotnet --info ==="
docker run --rm "$image" --info

echo "=== All tests passed ==="