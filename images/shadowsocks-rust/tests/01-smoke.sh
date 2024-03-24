#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${SERVER_IMAGE_NAME}"
echo "${LOCAL_IMAGE_NAME}"

PREFIX="shadowsocks"
SERVER_CONTAINER_NAME="${PREFIX}-ssserver-$(uuidgen)"
LOCAL_CONTAINER_NAME="${PREFIX}-sslocal-$(uuidgen)"
NETWORK_NAME="${PREFIX}-net-$(uuidgen)"
SSSERVER_PORT="${FREE_PORT}"
SSLOCAL_PORT="$((${SSSERVER_PORT} + 1))"

cleanup() {
    docker logs ${SERVER_CONTAINER_NAME}
    docker logs ${LOCAL_CONTAINER_NAME}
    docker kill ${SERVER_CONTAINER_NAME}
    docker kill ${LOCAL_CONTAINER_NAME}
    docker network rm ${NETWORK_NAME}
}

trap cleanup EXIT

docker network create ${NETWORK_NAME}

cat <<EOF > config.json
{
    "server": "127.0.0.1",
    "server_port": 8388,
    "local_port": 1080,
    "local_address": "127.0.0.1",
    "password": "password",
    "timeout": 300,
    "method": "aes-256-gcm"
}
EOF

# Start sserver
docker run \
    -d \
    --name ${SERVER_CONTAINER_NAME} \
    --network ${NETWORK_NAME} \
    -p "${SSSERVER_PORT}":8388/tcp \
    -p 8388:8388/udp \
    -v $(pwd)/config.json:/etc/shadowsocks-rust/config.json \
    ${SERVER_IMAGE_NAME}

sleep 5
docker logs ${SERVER_CONTAINER_NAME} | grep -q "listening on"

# Start sslocal
docker run \
    -d \
    --name ${LOCAL_CONTAINER_NAME} \
    --network ${NETWORK_NAME} \
    -p "${SSLOCAL_PORT}":1080/tcp \
    -v $(pwd)/config.json:/etc/shadowsocks-rust/config.json \
    ${LOCAL_IMAGE_NAME}

sleep 5
docker logs ${LOCAL_CONTAINER_NAME} | grep -q "listening on"
