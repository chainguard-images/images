#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

set +o pipefail

docker run --rm "${IMAGE_NAME}" | grep "no license key"
docker run --rm "${IMAGE_NAME}" newrelic-infra | grep "New Relic Infrastructure Agent"
# Since entrypoint is set to `tini`, we have to kill the parent process otherwise the container will hang forever.
timeout 3 docker run --rm "${IMAGE_NAME}" newrelic-infra-service --version | grep "New Relic Infrastructure Agent"
