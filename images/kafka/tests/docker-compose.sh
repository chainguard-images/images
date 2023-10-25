#!/bin/bash

# This is based on:
# https://github.com/bitnami/containers/blob/561da6cf36010ee9ff382cc0dabbfc6d5c4ec681/bitnami/kafka/3.5/debian-11/docker-compose.yml
set -euxo pipefail

IMAGE_NAME=${IMAGE_NAME:-"bitnami/kafka:3.5"}

tmp=$(mktemp -d)
cd "$tmp"

cat <<EOF > docker-compose.yml
version: "2"

services:
  kafka:
    image: ${IMAGE_NAME}
    ports:
      - "9092:9092"
    volumes:
      - "kafka_data:/opt/bitnami"
    environment:
      # KRaft settings
      - KAFKA_CFG_NODE_ID=0
      - KAFKA_CFG_PROCESS_ROLES=controller,broker
      - KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka:9093
      # Listeners
      - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093
      - KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://:9092
      - KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT
      - KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER
      - KAFKA_CFG_INTER_BROKER_LISTENER_NAME=PLAINTEXT
volumes:
  kafka_data:
    driver: local
EOF
docker-compose up -d --wait

KAFKA_BROKER=localhost
KAFKA_PORT=9092
MAX_RETRIES=5

retry=0

while [ $retry -lt $MAX_RETRIES ]; do
  if nc -z -v -w 1 $KAFKA_BROKER $KAFKA_PORT 2>/dev/null; then
    echo "Kafka on $KAFKA_BROKER:$KAFKA_PORT is up and running."
    exit 0
  else
    echo "Kafka on $KAFKA_BROKER:$KAFKA_PORT is not available. Retrying in $((2**retry)) seconds..."
    sleep $((2**retry))
    retry=$((retry + 1))
  fi
done

echo "Max retries reached. Kafka is still not available."
exit 1

trap "docker-compose down" EXIT
