#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


kubectl get statefulsets -n $CASSANDRA_STATEFULSET_NAMESPACE cassandra

kubectl get pods -n $CASSANDRA_STATEFULSET_NAMESPACE --show-labels

# check that the cassandra cluster is ready
kubectl wait --for=condition=ready pod cassandra-0 --namespace $CASSANDRA_STATEFULSET_NAMESPACE