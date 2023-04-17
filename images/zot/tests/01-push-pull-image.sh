#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CRANE_IMAGE_NAME=${CRANE_IMAGE_NAME:-"cgr.dev/chainguard/crane:latest"}
CRANE_CP_IMAGE_NAME=${CRANE_CP_IMAGE_NAME:-"cgr.dev/chainguard/wolfi-base:latest"}
CONTAINER_NAME=${CONTAINER_NAME:-"zot-test-$(date +%s)"}

# "sudo" possibly needed in github actions due to permissions issues
trap "rm -rf zot-config.yaml && (rm -rf data || sudo rm -rf data) && \
  docker logs ${CONTAINER_NAME} && docker rm -f ${CONTAINER_NAME}" EXIT

cat <<EOF > zot-config.yaml
distspecversion: 1.1.0-dev
http:
  address: 0.0.0.0
  port: 5000
storage:
  rootdirectory: /var/lib/zot/data
EOF

rm -rf data && mkdir data && chmod go+wrx data
docker run -d -p 5000:5000 --name "${CONTAINER_NAME}" \
  -v "${PWD}/zot-config.yaml":/zot-config.yaml \
  -v "${PWD}/data":/var/lib/zot/data \
  "${IMAGE_NAME}" serve /zot-config.yaml
ZOT_IP="$(docker inspect "${CONTAINER_NAME}" | jq -r '.[0].NetworkSettings.IPAddress')"
sleep 2

# Crane copy
docker run --rm "${CRANE_IMAGE_NAME}" \
    cp "${CRANE_CP_IMAGE_NAME}" "${ZOT_IP}:5000/smoketest:latest"

# Docker pull
docker pull localhost:5000/smoketest:latest
