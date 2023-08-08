#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl create namespace open-telemetry-custom-config
kubectl create configmap -n open-telemetry-custom-config custom --from-file=${PWD}/images/opentelemetry-collector-contrib/tests/custom-config.yaml