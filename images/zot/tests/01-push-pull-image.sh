#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CRANE_IMAGE_NAME=${CRANE_IMAGE_NAME:-"cgr.dev/chainguard/crane:latest"}
CRANE_CP_IMAGE_NAME=${CRANE_CP_IMAGE_NAME:-"cgr.dev/chainguard/wolfi-base:latest"}
CONTAINER_NAME=${CONTAINER_NAME:-"zot-test-${FREE_PORT}"}

TMP=$(mktemp -d)
mkdir "${TMP}/data"
chmod go+wrx "${TMP}/data"

# "sudo" possibly needed in github actions due to permissions issues
trap "(rm -rf "${TMP}" || sudo rm -rf "${TMP}") && \
  docker logs ${CONTAINER_NAME} && docker rm -f ${CONTAINER_NAME}" EXIT

cat <<EOF > "${TMP}/zot-config.yaml"
distspecversion: 1.1.0-dev
http:
  address: 0.0.0.0
  port: ${FREE_PORT}
storage:
  rootdirectory: /var/lib/zot/data
EOF

docker run -d -p ${FREE_PORT}:${FREE_PORT} --name "${CONTAINER_NAME}" \
  -v "${TMP}/zot-config.yaml:/zot-config.yaml" \
  -v "${TMP}/data:/var/lib/zot/data" \
  "${IMAGE_NAME}" serve /zot-config.yaml
ZOT_IP="$(docker inspect "${CONTAINER_NAME}" | jq -r '.[0].NetworkSettings.IPAddress')"
sleep 2

# Crane copy
docker run --rm "${CRANE_IMAGE_NAME}" \
    cp "${CRANE_CP_IMAGE_NAME}" "${ZOT_IP}:${FREE_PORT}/smoketest:latest"

# Docker pull
docker pull localhost:${FREE_PORT}/smoketest:latest
