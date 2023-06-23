#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME -NoLogo -Command 'Get-Host' > /dev/null
