#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# falcoctl help
docker run --rm "${IMAGE_NAME}" help

# falcoctl version
output=$(docker run --rm "${IMAGE_NAME}" version)
if ! echo "$output" | grep -q "Client Version:"; then
    echo "Test failed: 'Client Version:' was not found in the output."
    exit 1
fi

# Valiate we can retrieve artifact details.
# - 'falcosecurity' is expected in the response.
# - Also valiates correct permissions on /etc/falcoctl, as this cmd fails otherwise.
output=$(docker run --rm "${IMAGE_NAME}" artifact search cloudtrail-rules)
if ! echo "$output" | grep -q "falcosecurity	cloudtrail-rules"; then
    echo "TEST FAILED: expected: 'falcosecurity was not returned in output."
    exit 1
fi
