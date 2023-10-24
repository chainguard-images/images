#!/usr/bin/env bash

# Source: https://github.com/trinodb/trino/blob/master/core/docker/container-test.sh

function cleanup {
    if [[ -n ${CONTAINER_ID:-} ]]; then
        docker rm -f "${CONTAINER_ID}"
    fi
}

function test_trino_starts {
    local QUERY_PERIOD=10
    local QUERY_RETRIES=90

    CONTAINER_ID=
    trap cleanup EXIT

    local CONTAINER_NAME=$1
    # We aren't passing --rm here to make sure container is available for inspection in case of failures
    CONTAINER_ID=$(docker run -d --health-interval=10s --health-timeout=5s --health-start-period=10s --health-cmd /usr/lib/trino/bin/health-check "${CONTAINER_NAME}")

    set +e
    I=0
    until docker inspect "${CONTAINER_ID}" --format "{{json .State.Health.Status }}" | grep -q '"healthy"'; do
        if [[ $((I++)) -ge ${QUERY_RETRIES} ]]; then
            echo "🚨 Too many retries waiting for Trino to start" >&2
            echo "Logs from ${CONTAINER_ID} follow..."
            docker logs "${CONTAINER_ID}"
            break
        fi
        sleep ${QUERY_PERIOD}
    done
    if ! RESULT=$(docker exec "${CONTAINER_ID}" trino --execute "SELECT 'success'" 2>/dev/null); then
        echo "🚨 Failed to execute a query after Trino container started" >&2
    fi
    set -e

    cleanup
    trap - EXIT

    if ! [[ ${RESULT} == '"success"' ]]; then
        echo "🚨 Test query didn't return expected result (\"success\"): [${RESULT}]" >&2
        return 1
    fi

    return 0
}

function test_javahome {
    local CONTAINER_NAME=$1    # Check if JAVA_HOME works
    docker run --rm "${CONTAINER_NAME}" \
        /bin/bash -c '$JAVA_HOME/bin/java -version' &>/dev/null

    [[ $? == "0" ]]
}

echo "🐢 Validating ${IMAGE_NAME}"
test_javahome "${IMAGE_NAME}"
test_trino_starts "${IMAGE_NAME}"
echo "🎉 Validated ${IMAGE_NAME}"
