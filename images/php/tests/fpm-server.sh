#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

LOGFILE=$(mktemp)
ID=$(docker run --rm -d $IMAGE_NAME)
docker attach $ID 2> $LOGFILE &
sleep 3
docker stop $ID

grep "ready to handle connections" $LOGFILE