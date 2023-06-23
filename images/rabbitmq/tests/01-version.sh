#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# TODO: no way to get version from rabbitmq-server?
docker run --rm --entrypoint rabbitmqctl "${IMAGE_NAME}" version
