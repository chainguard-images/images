#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Check that prometheus comes up, the configurator runs as an init container
# so if the prometheus agent comes up we can assume the init was successful
kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    statefulset.apps/${NAME}-newrelic-prometheus-agent 
