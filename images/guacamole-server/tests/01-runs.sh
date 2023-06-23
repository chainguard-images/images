#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" 2>&1 | grep "Guacamole proxy daemon (guacd) version 1.5.2 started"
