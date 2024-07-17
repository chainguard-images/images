#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Global variables for retries
RETRIES=10
RETRY_DELAY_SECONDS=15

# Creds for tests
CASSANDRA_USER=cassandra
CASSANDRA_USER_BASE64=Y2Fzc2FuZHJh

CASSANDRA_PASSWORD=TestPassword123
CASSANDRA_PASSWORD_BASE64=VGVzdFBhc3N3b3JkMTIz

# Function to retry a command until it succeeds or reaches max attempts
retry_command() {
    apk add uuidgen

    local max_attempts=$1
    local interval=$2
    local description=$3
    local cmd="${@:4}"
    local attempt=1
    local log_file="/tmp/test_retry_command_$(uuidgen).log"

    echo "Retrying: $description"
    > "$log_file"  # Clear log file at the start
    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt: $cmd"
        if eval $cmd &> "$log_file"; then
            echo "Success on attempt $attempt for: $description"
            return 0
        else
            echo "Failure on attempt $attempt for: $description"
            sleep $interval
        fi
        ((attempt++))
    done

    cat "$log_file"
    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}

# Creates a secret for accessing Cassandra. base64 encoded.
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: cassandra-secret
type: Opaque
data:
  username: ${CASSANDRA_USER_BASE64}
  password: ${CASSANDRA_PASSWORD_BASE64}
  jmxUser: ${CASSANDRA_USER_BASE64}
  jmxPassword: ${CASSANDRA_PASSWORD_BASE64}
EOF


# Deploys a new instance of Cassandra, with our cgr image, using the operator.
TEST_create_cassandra_cluster() {
  kubectl apply -f - <<-EOF
  apiVersion: k8ssandra.io/v1alpha1
  kind: K8ssandraCluster 
  metadata:
    name: cassandra-cluster
  spec:
    cassandra:
      serverVersion: ${CASSANDRA_VERSION}
      serverImage: ${IMAGE}
      superuserSecretRef:
        name: cassandra-secret
      datacenters:
        - metadata:
            name: k3d
          size: 1
          storageConfig:
            cassandraDataVolumeClaimSpec:
              storageClassName: local-path
              accessModes:
                - ReadWriteOnce
              resources:
                requests:
                  storage: 1Gi
          config:
            jvmOptions:
              heapSize: 2Gi
EOF

  # Wait for statefulset to deploy
  retry_command 8 30 "Cassandra stateful set readiness" "kubectl rollout status -w statefulset/cassandra-cluster-k3d-default-sts --timeout 3m"

  # Ensure images where overriden with cgr images
  IMAGE=$(kubectl get pod cassandra-cluster-k3d-default-sts-0 -o jsonpath='{.spec.containers[?(@.name=="cassandra")].image}')
  if [ $IMAGE != $IMAGE ]; then
    echo "ERROR: Image mismatch. Expected to be deployed using: ${IMAGE}, but got ${IMAGE}"
    exit 1
  fi

  # Even though the statefulset may show as ready, cassandra IS VERY SLOW at
  # becoming operstional. Typically another 1-2 minutes delay could be needed.
  retry_command 20 30 "cqlsh readiness check" "kubectl exec -i cassandra-cluster-k3d-default-sts-0 -- cqlsh -u ${CASSANDRA_USER} -p ${CASSANDRA_PASSWORD}"
}

TEST_read_write_data() {
  # Create a keyspace and table, insert data, and query it
  kubectl exec -i cassandra-cluster-k3d-default-sts-0 -- cqlsh -u $CASSANDRA_USER -p $CASSANDRA_PASSWORD <<-EOF
  CREATE KEYSPACE testkeyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
  USE testkeyspace;
  CREATE TABLE users (user_id UUID PRIMARY KEY, name text);
  INSERT INTO users (user_id, name) VALUES (uuid(), 'Chainguard');
  SELECT * FROM users;
EOF
  sleep 5

  # Check if the data was inserted and queried correctly
  RESULT=$(kubectl exec cassandra-cluster-k3d-default-sts-0 -- cqlsh -u $CASSANDRA_USER -p $CASSANDRA_PASSWORD -e "USE testkeyspace; SELECT * FROM users;")
  if [[ "$RESULT" != *"Chainguard"* ]]; then
    echo "Error: Data insertion/query failed"
    kubectl logs "$POD_NAME"
    kubectl delete pod "$POD_NAME"
    exit 1
  fi
  }

TEST_create_cassandra_cluster
TEST_read_write_data
