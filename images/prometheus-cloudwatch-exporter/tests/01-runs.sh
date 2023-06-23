#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run -d -v ${PWD}/images/prometheus-cloudwatch-exporter:/config -p "${FREE_PORT}:9106" --rm $IMAGE_NAME /config/example/example.yml
sleep 5
curl localhost:${FREE_PORT}/metrics | grep cloudwatch_exporter_build_info
