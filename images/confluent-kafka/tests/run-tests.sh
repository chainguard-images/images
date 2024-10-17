#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="confluent-kafka-$(uuidgen)"

KAFKA_PORT="${FREE_PORT}"
KAFKA_JMX_PORT="$((${KAFKA_PORT} + 1))"
KRAFT_PORT="$((${KAFKA_JMX_PORT} + 1))"
KRAFT_PORT_PLUS="$((${KRAFT_PORT} + 1))"

REQUEST_RETRIES=10
RETRY_DELAY=15

declare -a expected_logs=(
  "Awaiting socket connections"
  "Transition from STARTING to STARTED"
  "Kafka Server started"
)
declare -a missing_logs=()

start_container() {
  container_id=$(docker run \
    -d --rm \
    --name "${CONTAINER_NAME}" \
    -h kafka-kraft \
    -p "${KAFKA_PORT}":"${KAFKA_PORT}" \
    -p "${KAFKA_JMX_PORT}":"${KAFKA_JMX_PORT}" \
    -p "${KRAFT_PORT}":"${KRAFT_PORT}" \
    -p "${KRAFT_PORT_PLUS}":"${KRAFT_PORT_PLUS}" \
    -e KAFKA_NODE_ID=1 \
    -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP='CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT' \
    -e KAFKA_ADVERTISED_LISTENERS='PLAINTEXT://kafka-kraft:'"${KRAFT_PORT}"',PLAINTEXT_HOST://localhost:'"${KAFKA_PORT}" \
    -e KAFKA_JMX_PORT="${KAFKA_JMX_PORT}" \
    -e KAFKA_JMX_HOSTNAME=localhost \
    -e KAFKA_PROCESS_ROLES='broker,controller' \
    -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    -e KAFKA_CONTROLLER_QUORUM_VOTERS='1@kafka-kraft:'"${KRAFT_PORT_PLUS}" \
    -e KAFKA_LISTENERS='PLAINTEXT://kafka-kraft:'"${KRAFT_PORT}"',CONTROLLER://kafka-kraft:'"${KRAFT_PORT_PLUS}"',PLAINTEXT_HOST://0.0.0.0:'"${KAFKA_PORT}" \
    -e KAFKA_INTER_BROKER_LISTENER_NAME='PLAINTEXT' \
    -e KAFKA_CONTROLLER_LISTENER_NAMES='CONTROLLER' \
    -e CLUSTER_ID='MkU3OEVBNTcwNTJENDM2Qk' \
    "${IMAGE_NAME}")
  trap "docker stop ${container_id}" EXIT
}

# Validate the container logs contain expected log messages.
TEST_validate_container_logs() {
  local logs=""
  local logs_found=true

  echo "Running: TEST_validate_container_logs()..."
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    logs=$(docker logs "${container_id}" 2>&1)
    logs_found=true

    # Search the container logs for our expected log lines.
    for log in "${expected_logs[@]}"; do
      if ! echo "$logs" | grep -Fq "$log"; then
        logs_found=false
      fi
    done

    if $logs_found; then
      return 0
    elif [[ $i -lt ${REQUEST_RETRIES} ]]; then
      echo "Some expected logs were missing. Retrying in ${RETRY_DELAY} seconds..."
      sleep ${RETRY_DELAY}
    fi
  done

  # After all retries, record the missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines were not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

TEST_produce_consume() {
  TOPIC_NAME="test-topic-$(uuidgen)"
  PARTITIONS=1
  REPLICATION_FACTOR=1

  # Create a Kafka topic
  docker exec "${CONTAINER_NAME}" kafka-topics --create --topic "${TOPIC_NAME}" --partitions "${PARTITIONS}" --replication-factor "${REPLICATION_FACTOR}" --if-not-exists --bootstrap-server kafka-kraft:"${KAFKA_PORT}"

  # Produce a test message
  echo "Hello Kafka" | docker exec -i "${CONTAINER_NAME}" kafka-console-producer --bootstrap-server kafka-kraft:"${KAFKA_PORT}" --topic "${TOPIC_NAME}"

  # Consume the message
  consumed_message=$(docker exec "${CONTAINER_NAME}" timeout 10 kafka-console-consumer --bootstrap-server kafka-kraft:"${KAFKA_PORT}" --topic "${TOPIC_NAME}" --from-beginning --max-messages 1)

  # Verify the message
  if [[ "${consumed_message}" == "Hello Kafka" ]]; then
    echo "Successfully produced and consumed a test message."
  else
    echo "Failed to verify the consumed message."
    dump_logs_and_exit
  fi

  # Clean up the test topic (optional)
  docker exec "${CONTAINER_NAME}" kafka-topics --delete --topic "${TOPIC_NAME}" --bootstrap-server kafka-kraft:"${KAFKA_PORT}"
}

start_container
TEST_validate_container_logs
TEST_produce_consume

echo "All tests passed!"
