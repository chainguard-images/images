#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

PATH="${PATH}:/usr/share/java/zookeeper/bin"
ZK_PORT=$(shuf -i 1024-65535 -n 1)

dump_logs() {
  kubectl logs -n "${NAMESPACE}" pod/"${NAME}"-0
}

trap "dump_logs" EXIT

kubectl wait -n "${NAMESPACE}" --for=condition=ready pod/"${NAME}"-0

forward_port() {
  kubectl port-forward -n "${NAMESPACE}" pod/"${NAME}"-0 "${ZK_PORT}":2181 &
  sleep 5
}

create_node() {
  apk add zookeeper

  zkCli.sh -server localhost:"${ZK_PORT}" version
  zkCli.sh -server localhost:"${ZK_PORT}" create /testNode
  zkCli.sh -server localhost:"${ZK_PORT}" get /testNode
  zkCli.sh -server localhost:"${ZK_PORT}" delete /testNode
}

forward_port
create_node
