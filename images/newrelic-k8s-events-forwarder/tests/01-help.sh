#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail  # We expect the command to fail, but want its output anyway.

docker run --rm "${IMAGE_NAME}" | grep "no license key"
docker run --rm "${IMAGE_NAME}" newrelic-infra | grep "New Relic Infrastructure Agent"
# Since entrypoint is set to `tini`, we have to kill the parent process otherwise the container will hang forever.
timeout 3 docker run --rm "${IMAGE_NAME}" newrelic-infra-service --version | grep "New Relic Infrastructure Agent"
