#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

function cleanup() {
    kubectl logs -n ${NAMESPACE} -l application=spilo 
    kubectl delete -f ${TMPDIR}/minimal-postgres-manifest.yaml -n ${NAMESPACE}
    
    echo "Deleting services..."
    kubectl delete service -n ${NAMESPACE} acid-minimal-cluster
    kubectl delete service -n ${NAMESPACE} acid-minimal-cluster-config
    kubectl delete service -n ${NAMESPACE} acid-minimal-cluster-repl

    echo "Cleaning up any remaining pods..."
    kubectl delete pod -n ${NAMESPACE} -l 'application=spilo,cluster-name=acid-minimal-cluster'
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

echo "Checking if the Postgres-operator is ready."
kubectl wait --for=condition=available --timeout=150s deployment.apps/${NAME} -n ${NAMESPACE}
echo "Postgres-operator is ready."

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

# Retry mechanism
max_attempts=5
attempt_num=1
success=false

while [ $attempt_num -le $max_attempts ]; do
    echo "Attempt $attempt_num of $max_attempts: Checking if the cluster is ready."
    if kubectl logs -n ${NAMESPACE} deployment.apps/${NAME} | grep -q "cluster has been created"; then
        echo "Cluster is ready."
        success=true
        break
    else
        echo "Cluster not ready yet. Retrying in 30 seconds..."
        sleep 30
    fi
    ((attempt_num++))
done

if [ "$success" = false ]; then
    echo "Cluster failed to be ready after $max_attempts attempts. Exiting."
    exit 1
fi

