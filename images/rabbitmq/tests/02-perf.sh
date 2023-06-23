#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat >dev.conf <<EOF
## DEFAULT SETTINGS ARE NOT MEANT TO BE TAKEN STRAIGHT INTO PRODUCTION
## see https://www.rabbitmq.com/configure.html for further information
## on configuring RabbitMQ

## allow access to the guest user from anywhere on the network
## https://www.rabbitmq.com/access-control.html#loopback-users
## https://www.rabbitmq.com/production-checklist.html#users
loopback_users.guest = false

## Send all logs to stdout/TTY. Necessary to see logs when running via
## a container
log.console = true
EOF

docker network create rmq

docker run -d --rm --network rmq --name rabbitmq \
	-v $(pwd)/dev.conf:/etc/rabbitmq/conf.d/10-defaults.conf \
	-p 15672:15672 $IMAGE_NAME

sleep 10

# vary publishing rate
docker run --rm --network rmq pivotalrabbitmq/perf-test:latest --uri amqp://rabbitmq -z 20 --variable-rate 10:5 --variable-rate 1000:10 --variable-rate 500:5 --shutdown-timeout 0
sleep 1

# vary message size
docker run --rm --network rmq pivotalrabbitmq/perf-test:latest --uri amqp://rabbitmq -z 15 --variable-size 1000:5 --variable-size 10000:5 --variable-size 5000:5 --shutdown-timeout 0
sleep 1

# try a json body
docker run --rm --network rmq pivotalrabbitmq/perf-test:latest --uri amqp://rabbitmq -z 15 --json-body --size 16000 --shutdown-timeout 0
sleep 1

# vary consumer latency
docker run --rm --network rmq pivotalrabbitmq/perf-test:latest --uri amqp://rabbitmq -z 30 --variable-latency 1000:15 --variable-latency 1000000:15 --shutdown-timeout 0
sleep 1

# dump the server logs
docker logs rabbitmq
