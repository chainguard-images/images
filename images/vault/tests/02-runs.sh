#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Run the vault container in the background and make sure it works using the API
docker run -d --name vault --cap-add IPC_LOCK -p 8200:8200 "${IMAGE_NAME}" server -dev -dev-root-token-id=root

sleep 5

# Exec into the container and run the vault status command
docker exec vault vault status --address http://127.0.0.1:8200
