#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# This test is designed to emulate the Hugo Quickstart application
# which is outlined here:
# https://gohugo.io/getting-started/quick-start/#commands

TMP=$(mktemp -d)
sudo chown -R 65532:65532 "${TMP}"

# Use the hugo application to bootstrap a directory structure for us.
docker run --rm -v "${TMP}:/hugo/quickstart" "${IMAGE_NAME}" new site quickstart

# Link in the "ananke" theme (per the quickstart)
# We do this via containers because volume permissions are a nightmare.
docker run --rm -v "${TMP}:/hugo/quickstart" --workdir=/hugo/quickstart \
       cgr.dev/chainguard/git:latest-glibc init

docker run --rm -v "${TMP}:/hugo/quickstart" --workdir=/hugo/quickstart \
       cgr.dev/chainguard/git:latest-glibc-dev submodule add https://github.com/theNewDynamic/gohugo-theme-ananke "themes/ananke"

docker run --rm -v "${TMP}:/hugo/quickstart" --workdir=/hugo/quickstart \
       cgr.dev/chainguard/busybox:latest-glibc /bin/sh -c "echo \"theme = 'ananke'\" >> config.toml"

# Start the container with a name, and detach so we can then poke at it.
docker run --name "hugo-${FREE_PORT}" --detach --rm -v "${TMP}:/hugo/quickstart" -p ${FREE_PORT}:8080 \
  --workdir /hugo/quickstart \
  "${IMAGE_NAME}" \
  server --bind 0.0.0.0 --port 8080

# Give it a moment to start up.
sleep 5

# Check that it's up!
curl -v http://localhost:${FREE_PORT}

# Kill the detached hugo container
docker rm -f "hugo-${FREE_PORT}"
