#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm $IMAGE_NAME dex serve /etc/dex/config.docker.yaml
sleep 10
curl -L http://127.0.0.1:5556/dex/.well-known/openid-configuration | jq '.issuer' | grep "http://127.0.0.1:5556/dex"
