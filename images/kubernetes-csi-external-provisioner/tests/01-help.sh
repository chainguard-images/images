#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail

# The log should show an error because we're not in a k8s cluster, but the container should get to this point
docker run --rm $IMAGE_NAME  2>&1 | grep "Failed to create config: unable to load in-cluster configuration, KUBERNETES_SERVICE_HOST and KUBERNETES_SERVICE_PORT must be defined"
