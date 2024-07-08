#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source "$LIBS/libs.sh"

cmd() {
  kubectl logs -n promtail -l "app.kubernetes.io/instance=${1}"
}

# TODO: Why tf I need this many retry when we use --wait
retry_until 5 2 cmd "${1}"

# TODO: this won't work if you have more than one Node, would want to 
# see this message for each Node
cmd "${1}" | grep "Starting Promtail"
