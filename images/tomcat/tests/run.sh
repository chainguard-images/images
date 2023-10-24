#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

function cleanup() {
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

WAR_URL=${WAR_URL:-https://tomcat.apache.org/tomcat-10.0-doc/appdev/sample/sample.war}

curl -sSL -o "${TMPDIR}/sample.war" ${WAR_URL}

CONTAINER=$(docker run -v "${TMPDIR}/sample.war:/usr/share/tomcat/webapps/sample.war" -p "${FREE_PORT}:8080" -d --rm "${IMAGE_NAME}")
sleep 3
curl "localhost:${FREE_PORT}/sample/" | grep "Hello, World"
docker stop $CONTAINER
