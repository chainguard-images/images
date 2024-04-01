#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

function cleanup() {
    kubectl logs -n ${NAMESPACE} -l application=spilo 
    kubectl delete -f ${TMPDIR}/minimal-postgres-manifest.yaml -n ${NAMESPACE}
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

sleep 30 

# ref from here: https://raw.githubusercontent.com/zalando/postgres-operator/master/manifests/minimal-postgres-manifest.yaml
cat <<EOF > "${TMPDIR}/minimal-postgres-manifest.yaml"
apiVersion: "acid.zalan.do/v1"
kind: postgresql
metadata:
  name: acid-minimal-cluster
spec:
  teamId: "acid"
  volume:
    size: 1Gi
  numberOfInstances: 2
  users:
    zalando:  # database owner
    - superuser
    - createdb
    foo_user: []  # role for application foo
  databases:
    foo: zalando  # dbname: owner
  preparedDatabases:
    bar: {}
  postgresql:
    version: "16"
EOF

kubectl create -f "${TMPDIR}/minimal-postgres-manifest.yaml" -n ${NAMESPACE}

sleep 120

kubectl logs -n ${NAMESPACE} deployment.apps/${NAME} | grep "cluster has been created"
