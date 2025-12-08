#!/usr/bin/env bash

set -xeuo pipefail

# shellcheck disable=SC1091
source ../libs/libs.sh

IMAGE="$(get_test_image "tomcat")"

TMPDIR="$(mktemp -d)"

apk_add curl wait-for-it

curl -sSL -o "$TMPDIR/sample.war" "${WAR_URL}"

CONTAINER_ID="$(docker run -d --rm --network host -v "${TMPDIR}/sample.war:/usr/share/tomcat/webapps/sample.war" "$IMAGE")"
trap 'docker kill "${CONTAINER_ID}"' EXIT

wait-for-it localhost:8080
curl -SL "http://localhost:8080/sample/" | grep -e 'Hello'
