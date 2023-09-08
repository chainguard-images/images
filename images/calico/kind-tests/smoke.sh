#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP="$(mktemp -d)"
pushd "${TMP}"

helm repo add podinfo https://stefanprodan.github.io/podinfo
helm upgrade -i smoke podinfo/podinfo --wait --wait-for-jobs --timeout 120s

# Turns out --wait doesn't actually wait
sleep 10

helm test smoke
