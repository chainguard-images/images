#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

 docker run --rm --entrypoint "" cgr.dev/chainguard/gradle:latest sh -c "gradle init --type java-application --test-framework junit-jupiter && gradle build"