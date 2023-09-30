#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl port-forward -n trillian-system svc/trillian-log-server ${FREE_PORT}:8091 &
fwd_pid=$!
trap "kill -9 $fwd_pid" EXIT

curl -v --retry 10 --retry-all-errors "localhost:${FREE_PORT}/metrics"
