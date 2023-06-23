#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

 docker run --rm --entrypoint "" cgr.dev/chainguard/gradle:latest sh -c "gradle init --type java-application --test-framework junit-jupiter && gradle build"
