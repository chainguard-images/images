#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" --version
docker run --rm "${IMAGE_NAME}" help
docker run --rm "${IMAGE_NAME}" ec2 help
docker run --rm "${IMAGE_NAME}" ec2 run-instances help
