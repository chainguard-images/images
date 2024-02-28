#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add helm

NAMESPACE=k8ssandra-system-logger

# Install CRDs
kubectl apply --force-conflicts --server-side -k https://github.com/k8ssandra/cass-operator/config/crd\?ref\=v1.19.0

defaultStorageClass=$(kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')

# Sample from: https://github.com/k8ssandra/cass-operator/blob/master/config/samples/example-cassdc-three-nodes-single-rack.yaml
cat <<EOF | kubectl apply -n ${NAMESPACE} -f -
apiVersion: cassandra.datastax.com/v1beta1
kind: CassandraDatacenter
metadata:
  name: dc1
spec:
  clusterName: development
  serverType: cassandra
  serverVersion: "4.1.2"
  dockerImageRunsAsCassandra: true
  managementApiAuth:
    insecure: {}
  size: 1
  storageConfig:
      cassandraDataVolumeClaimSpec:
        storageClassName: ${defaultStorageClass}
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 1Gi
  podTemplateSpec:
    spec:
      containers:
        - name: "cassandra"
      securityContext:
        runAsUser: 999
        runAsGroup: 999
  resources:
    requests:
      memory: 1Gi
      cpu: 100m
  racks:
    - name: rack1
  config:
    jvm-server-options:
      initial_heap_size: "1G"
      max_heap_size: "1G"
    cassandra-yaml:
      num_tokens: 16
      authenticator: PasswordAuthenticator
      authorizer: CassandraAuthorizer
      role_manager: CassandraRoleManager
EOF

sleep 10

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=cassandra --namespace ${NAMESPACE} --timeout=600s
