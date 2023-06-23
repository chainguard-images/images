#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

docker run $IMAGE_NAME -zv google.com 443 2>&1 | grep "443 port \[tcp/https\] succeeded"
