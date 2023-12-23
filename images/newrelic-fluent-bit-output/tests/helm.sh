#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    daemonset.apps/${NAME}-newrelic-logging
