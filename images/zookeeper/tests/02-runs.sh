#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_NAME=${IMAGE_NAME:-"bitnami/zookeeper:3.9"}
echo "Testing ${IMAGE_NAME}..."

tmp=$(mktemp -d)
cd "$tmp"

cat <<EOF > docker-compose.yml
version: '2'

services:
  zookeeper:
    image: ${IMAGE_NAME}
    ports:
      - '${FREE_PORT}:2181'
    volumes:
      - 'zookeeper_data:/bitnami'
    environment:
      - ALLOW_ANONYMOUS_LOGIN=yes
      - ZOO_4LW_COMMANDS_WHITELIST='ruok,stat,conf,crst,env,dirs,cons,ruok,stat,mntr'

volumes:
  zookeeper_data:
    driver: local
EOF


# run docker-compose up in the background 
docker-compose up -d --wait -t 300

#wait for zookeeper to be ready
while ! nc -z localhost ${FREE_PORT}; do
    sleep 0.1
done

echo "Zookeeper is ready!"

# check zookeeper is actually running by runnig srvr
echo "srvr" | nc -w 2 localhost ${FREE_PORT} | grep -q "Zookeeper version:"

echo "ruok" | nc -w 2 localhost ${FREE_PORT} | grep -q "imok"

trap "docker-compose down" EXIT
