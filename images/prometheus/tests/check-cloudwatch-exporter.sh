#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Sadly Helm doesn't wait for things to report as ready,
# so we have to do it ourselves.
kubectl wait -n prometheus-cloudwatch-exporter --for=condition=ready pod --selector app=prometheus-cloudwatch-exporter
