#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x

CLONE_URL=${CLONE_URL:-"https://github.com/chainguard-images/.github.git"}

docker run --rm $IMAGE_NAME version

# make sure we can run ssh-keygen
(docker run --rm --entrypoint ssh-keyscan "${IMAGE_NAME}" -h || true) 2>&1 | grep 'usage: ssh-keyscan'

# make sure we can create ~/.kube
docker run --rm --entrypoint bash "${IMAGE_NAME}" -c \
    'mkdir ~/.kube && ls -la ~'

# make sure we can git clone something
docker run --rm --entrypoint bash "${IMAGE_NAME}" -c \
    'git clone --depth=1 '${CLONE_URL}' ~/test-clone && ls -la ~/test-clone'
