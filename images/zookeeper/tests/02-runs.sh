#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"zookeeper-status-${FREE_PORT}"}
docker run -d --rm --name ${CONTAINER_NAME} "${IMAGE_NAME}"

# Wait for zookeeper to start
sleep 10

# Run the status command, it should output something like this:
#   Using config: /usr/share/java/zookeeper/bin/../conf/zoo.cfg
#   Client port found: 2181. Client address: localhost. Client SSL: false.
#   Mode: standalone
# If it's not running, we'll get:
#   Using config: /usr/share/java/zookeeper/bin/../conf/zoo.cfg
#   Client port found: 2181. Client address: localhost. Client SSL: false.
#   Error contacting service. It is probably not running.
docker exec $CONTAINER_NAME /usr/share/java/zookeeper/bin/zkServer.sh status | grep "Mode: standalone"
