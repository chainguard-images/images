#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TMP=$(mktemp -d)
JAVA_SOURCE_VERSION="${JAVA_SOURCE_VERSION:-8}"
JAVA_TARGET_VERSION="${JAVA_TARGET_VERSION:-8}"

function cleanup() {
    rm -rf "${TMP}"
}
trap cleanup EXIT

cp "${SCRIPT_DIR}"/*.java "${TMP}"

# Make this writeable by the nonroot container user
chmod 777 "${TMP}"

docker run --rm -v "${TMP}:/tmp" \
  `# Build using the latest JDK image` \
  --entrypoint "javac" "${SDK_IMAGE}" \
  `# Targeting Java 8 so that all our JREs can run the produced .class file` \
  -source ${JAVA_SOURCE_VERSION} -target ${JAVA_TARGET_VERSION} \
  /tmp/HelloWorld.java -d /tmp

# Now we have the .class file, run it to test our JRE.
docker run --rm -v "${TMP}:/tmp" --entrypoint "java" "${IMAGE_NAME}" -cp /tmp HelloWorld
