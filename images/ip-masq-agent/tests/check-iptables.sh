#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"ip-masq-${FREE_PORT}"}

docker run -d --privileged --name "$CONTAINER_NAME" "$IMAGE_NAME"
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

# This command is from:
# https://kubernetes.io/docs/tasks/administer-cluster/ip-masq-agent/
docker exec $CONTAINER_NAME iptables -t nat -L IP-MASQ-AGENT | grep 'local traffic is not subject to MASQUERADE'
docker exec $CONTAINER_NAME iptables -t nat -L IP-MASQ-AGENT | grep 'outbound traffic is subject to MASQUERADE'
