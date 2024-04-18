#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add jq curl

cid=$(docker run --network imagetest -d $IMAGE_NAME)
hostname=$(docker inspect --format '{{ .Config.Hostname }}' $cid)

trap "docker logs $cid && docker rm -f $cid" EXIT

sleep 5
curl $hostname:8222/healthz | jq .status | grep ok

# Start subscribing in the background, and expect a message with our pseudo-random port number
(docker run --rm --network imagetest --link $cid --entrypoint=nats cgr.dev/chainguard/nats:latest-dev sub --server $hostname foo --count=1 | grep test-message-${cid}) &
pid=$!

# Give that a moment to block, and then send a message on that topic matching the text it expects.
sleep 5
docker run --rm --network imagetest --link $cid --entrypoint=nats cgr.dev/chainguard/nats:latest-dev pub --server $hostname foo test-message-${cid}

# Wait for the subscriber to receive the message with a successful exit code.
wait $pid
