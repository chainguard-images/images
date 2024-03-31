#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
# NS="tomcat-${FREE_PORT}"

function cleanup() {
    kubectl describe deployment -n ${NS} -A
    kubectl logs -n ${NAMESPACE} -l application=spilo -L spilo-role
    kubectl delete -f ${TMPDIR}/minimal-postgres-manifest.yaml -n ${NAMESPACE}
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

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

sleep 30

# check the deployed cluster
kubectl get postgresql

# check created database pods
kubectl get pods -l application=spilo -L spilo-role

# check created service resources
kubectl get svc -l application=spilo -L spilo-role


kubectl get pods -l application=spilo -l cluster-name=acid-minimal-cluster

kubectl port-forward svc/acid-minimal-cluster ${FREE_PORT}:5432



pid=$!
echo "Port-forward PID: $pid"
trap "echo 'Killing port-forward'; kill $pid" EXIT

sleep 10

export PGPASSWORD=$(kubectl get secret postgres.acid-minimal-cluster.credentials.postgresql.acid.zalan.do -o 'jsonpath={.data.password}' | base64 -d)
export PGSSLMODE=require
psql -U postgres
