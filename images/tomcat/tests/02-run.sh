#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

TMPDIR="$(mktemp -d)"

function cleanup() {
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

curl -sSL -o "${TMPDIR}/sample.war" 'https://tomcat.apache.org/tomcat-10.0-doc/appdev/sample/sample.war'

CONTAINER=$(docker run -v "${TMPDIR}/sample.war:/usr/share/tomcat/webapps/sample.war" -p 8080:8080 -d --rm "${IMAGE_NAME}")
sleep 3
curl localhost:8080/sample/ | grep "Hello, World"
docker stop $CONTAINER
