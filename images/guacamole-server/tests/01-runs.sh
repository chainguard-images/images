#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm -d --name=guacamole "${IMAGE_NAME}"
docker logs guacamole | grep "Guacamole proxy daemon (guacd) version 1.5.2 started"
trap "docker rm -f guacamole" EXIT
