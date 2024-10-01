#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source "$LIBS/libs.sh"

apk add flux

# Follow the getting started guide: https://fluxcd.io/flux/get-started/

flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=1m

flux create kustomization podinfo \
  --target-namespace=default \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --wait=true \
  --interval=30m \
  --retry-interval=2m \
  --health-check-timeout=3m
