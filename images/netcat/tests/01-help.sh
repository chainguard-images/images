#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

docker run $IMAGE_NAME -h
