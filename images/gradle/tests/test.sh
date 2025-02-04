#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.gradle.ref')

docker run --rm --entrypoint "" "$image" sh -c "gradle init --type java-application --dsl kotlin --test-framework junit-jupiter --package my.project --project-name my-project --no-split-project --incubating --java-version ${JAVA_VERSION} && gradle build"
