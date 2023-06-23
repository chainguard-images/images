#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" /usr/bin/newrelic-infra --version | grep "New Relic Infrastructure Agent"
