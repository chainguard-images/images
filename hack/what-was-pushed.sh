#!/usr/bin/env bash

# Note: this is dependent on using a localhost registry for TF_VAR_target_repository
# that is based on the "registry:2" image (the Docker distribution registry project)

set -e

REGISTRY_CONTAINER_ID=$(docker ps --format json | jq -r 'select(.Image | startswith("registry:")) | .ID')

docker logs $REGISTRY_CONTAINER_ID 2>/dev/null | \
    grep '"PUT /v2/.*/manifests/.*' | grep ' 201 ' | grep -v 'sha256:' | \
    sed -r "s|.*\"PUT /v2/(.*)/manifests/([^ ]*).*|$(echo $TF_VAR_target_repository | cut -d/ -f1)/\1:\2|" | \
    uniq | sort
