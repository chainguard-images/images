#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker network create mlmd || true

TMP=$(mktemp -d)
cat <<EOF > "${TMP}/mlmd-config.yaml"
connection_config {
  sqlite {
    filename_uri: '/tmp/test_db'
    connection_mode: READWRITE_OPENCREATE
  }
}
EOF
# Start the server
ID=$(docker run --rm --net mlmd -v "${TMP}/mlmd-config.yaml:/mlmd-config.yaml" -d ${IMAGE_NAME} --metadata_store_server_config_file=/mlmd-config.yaml)

trap "(rm -rf "${TMP}" || sudo rm -rf "${TMP}") && \
  docker logs $ID && docker rm -f $ID && \
  docker network rm mlmd" EXIT
sleep 2
SERVER_IP=$(docker inspect ${ID} | jq -r '.[0].NetworkSettings.Networks.mlmd.IPAddress')

docker pull cgr.dev/chainguard/python:latest-dev
docker build -t ml-metadata-tester -f - . <<EOF
FROM cgr.dev/chainguard/python:latest-dev
USER root
RUN apk add py3-ml-metadata py3-protobuf py3-absl-py py3-attrs && pip3 install grpcio
COPY ./ml-metadata-test.py /home/ml-metadata-test.py
ENTRYPOINT ["python3", "/home/ml-metadata-test.py"]
EOF

TESTER_ID=$(docker run --net mlmd -d ml-metadata-tester ${SERVER_IP}:8080)
docker wait ${TESTER_ID}
docker logs ${TESTER_ID}
docker logs ${TESTER_ID} 2>&1 | grep "Done"
docker rm -f ${TESTER_ID}
