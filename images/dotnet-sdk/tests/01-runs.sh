#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME dotnet --info > /dev/null
