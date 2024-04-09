#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


# We just test if the container starts ok. as we don't have any backend tests yet
# this uses an output to file configuration for now  we can check for that file
TEST_container_starts_ok() {

    # Check if the container is running
    if ! kubectl get pods -n ${FB_NAMESPACE} | grep 'filebeat-'; then
        echo "FAILED: Pod  is not running."
        exit 1
    else
        echo "Pod is running."
    fi


}

TEST_container_starts_ok
