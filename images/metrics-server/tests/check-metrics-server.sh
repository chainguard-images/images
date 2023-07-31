#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Sadly Helm doesn't wait for things to report as ready,
# so we have to do it ourselves.
kubectl wait -n metrics-server --for=condition=ready pod --selector app.kubernetes.io/instance=metrics-server

# Give kubernetes a chance to observe the above and propagate the endpoints.
sleep 5

# These will error out if metrics-server is not running,
# and by default KinD does not run one.
kubectl top pods -A
kubectl top nodes
