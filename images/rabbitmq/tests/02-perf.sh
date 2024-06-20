#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat >dev.conf <<EOF

loopback_users.guest = false

log.console = true
EOF

NETWORK_NAME="rmq-${RANDOM_NAME}"
docker network create "$NETWORK_NAME"

docker run -d --rm --network "$NETWORK_NAME" --name "$RANDOM_NAME" \
	-v $(pwd)/dev.conf:/etc/rabbitmq/conf.d/10-defaults.conf \
	-p "$FREE_PORT":15672 $IMAGE_NAME

sleep 10

docker run --rm --network "$NETWORK_NAME" pivotalrabbitmq/perf-test:latest --uri amqp://"$RANDOM_NAME" -z 20 --variable-rate 10:5 --variable-rate 1000:10 --variable-rate 500:5 --shutdown-timeout 0
sleep 1

docker run --rm --network "$NETWORK_NAME" pivotalrabbitmq/perf-test:latest --uri amqp://"$RANDOM_NAME" -z 15 --variable-size 1000:5 --variable-size 10000:5 --variable-size 5000:5 --shutdown-timeout 0
sleep 1

docker run --rm --network "$NETWORK_NAME" pivotalrabbitmq/perf-test:latest --uri amqp://"$RANDOM_NAME" -z 15 --json-body --size 16000 --shutdown-timeout 0
sleep 1

docker run --rm --network "$NETWORK_NAME" pivotalrabbitmq/perf-test:latest --uri amqp://"$RANDOM_NAME" -z 30 --variable-latency 1000:15 --variable-latency 1000000:15 --shutdown-timeout 0
sleep 1

docker logs "$RANDOM_NAME"

function cleanup {
  docker kill "$RANDOM_NAME"
  docker network rm "$NETWORK_NAME"
}
trap cleanup EXIT
