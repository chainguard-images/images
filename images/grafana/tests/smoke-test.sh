#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "Basic Grafana test"

if kubectl logs "deploy/${K8S_NAME}" -n "${K8S_NAMESPACE}" | grep "level=error"; then
  echo "Test failed: Found a line with level=error in the logs"
  exit 1
fi

if ! kubectl logs "deploy/${K8S_NAME}" -n "${K8S_NAMESPACE}" | grep "version=9.3"; then
  echo "Test failed: Did not find version=9.3 in the logs"
  exit 1
fi

if ! kubectl logs "deploy/${K8S_NAME}" -n "${K8S_NAMESPACE}" | grep "3000 protocol=http subUrl= socket="; then
  echo "Test failed: Pod did not start correctly"
  exit 1
fi

echo "Test passed: Pod started correctly"
