#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

OPERATOR_NAMESPACE="mariadb-system"
TEST_NAMESPACE="mariadb-test"
MARIADB_NAME="mariadb-test"
ROOT_PASSWORD="testpass123"

# Verify operator is running
kubectl wait --for=condition=available deployment/mariadb-operator \
  -n $OPERATOR_NAMESPACE --timeout=120s

kubectl create namespace $TEST_NAMESPACE

kubectl create secret generic mariadb-root-secret \
  --from-literal=password=$ROOT_PASSWORD \
  -n $TEST_NAMESPACE

# Deploy MariaDB instance using the image under test
#
# TLS Workaround:
# The Chainguard MariaDB image is missing /etc/mysql/my.cnf with '!includedir /etc/mysql/conf.d/'
# that the official MariaDB Docker image has. The mariadb-operator mounts its TLS config at
# /etc/mysql/conf.d/, but without that includedir directive, MariaDB never reads it.
#
# To avoid a breaking change to the image, we work around this by passing SSL cert paths
# directly to mariadbd via 'args'. The operator still mounts certs at /etc/pki/ when
# tls.enabled=true - we just reference them via command line args instead of config file.
kubectl apply -f - <<EOF
apiVersion: k8s.mariadb.com/v1alpha1
kind: MariaDB
metadata:
  name: $MARIADB_NAME
  namespace: $TEST_NAMESPACE
spec:
  image: ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
  rootPasswordSecretKeyRef:
    name: mariadb-root-secret
    key: password
  database: testdb
  tls:
    enabled: true
  args:
    - "--ssl-cert=/etc/pki/server.crt"
    - "--ssl-key=/etc/pki/server.key"
    - "--ssl-ca=/etc/pki/ca.crt"
  storage:
    size: 1Gi
    volumeClaimTemplate:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi
  resources:
    requests:
      cpu: 100m
      memory: 512Mi
    limits:
      cpu: 1000m
      memory: 1Gi
  service:
    type: ClusterIP
  podSecurityContext:
    runAsUser: 999
    runAsGroup: 999
    fsGroup: 999
EOF

# Wait for MariaDB to be ready
kubectl wait --for=condition=Ready mariadb/$MARIADB_NAME \
  -n $TEST_NAMESPACE --timeout=300s

# Verify pod is running
kubectl wait --for=condition=Ready pod/${MARIADB_NAME}-0 \
  -n $TEST_NAMESPACE --timeout=60s

# Run SQL query helper (all queries use TLS)
run_query() {
  kubectl exec -n $TEST_NAMESPACE ${MARIADB_NAME}-0 -- \
    mariadb -uroot -p${ROOT_PASSWORD} -h 127.0.0.1 --ssl -N -e "$1"
}

# Verify database connectivity and run CRUD tests
run_query "SELECT VERSION();" | grep -E "^[0-9]+\.[0-9]+\.[0-9]+"

run_query "CREATE DATABASE IF NOT EXISTS crud_test;"
run_query "SHOW DATABASES;" | grep -F "crud_test"

run_query "CREATE TABLE crud_test.items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);"

run_query "INSERT INTO crud_test.items (name) VALUES ('test-item-1');"
run_query "INSERT INTO crud_test.items (name) VALUES ('test-item-2');"

run_query "SELECT COUNT(*) FROM crud_test.items;" | grep -F "2"
run_query "SELECT name FROM crud_test.items WHERE id = 1;" | grep -F "test-item-1"

run_query "UPDATE crud_test.items SET name = 'updated-item' WHERE id = 1;"
run_query "SELECT name FROM crud_test.items WHERE id = 1;" | grep -F "updated-item"

run_query "DELETE FROM crud_test.items WHERE id = 2;"
run_query "SELECT COUNT(*) FROM crud_test.items;" | grep -F "1"

run_query "DROP DATABASE crud_test;"

# Cryptographic function tests (FIPS-approved algorithms only for compatibility)
# SHA2 - FIPS approved algorithms
run_query "SELECT SHA2('test', 256);" | grep -E "^[a-f0-9]{64}$"
run_query "SELECT SHA2('test', 384);" | grep -E "^[a-f0-9]{96}$"
run_query "SELECT SHA2('test', 512);" | grep -E "^[a-f0-9]{128}$"

# AES encryption - FIPS approved
run_query "SELECT HEX(AES_ENCRYPT('secret', 'key'));" | grep -E "^[A-F0-9]+$"
run_query "SELECT AES_DECRYPT(AES_ENCRYPT('secret', 'key'), 'key');" | grep -F "secret"

# Verify TLS is enabled (have_ssl should be YES)
run_query "SHOW VARIABLES LIKE 'have_ssl';" | grep -F "YES"

# Verify TLS connection is using strong cipher
run_query "SHOW STATUS LIKE 'Ssl_cipher';" | grep -E "TLS_AES|ECDHE"
