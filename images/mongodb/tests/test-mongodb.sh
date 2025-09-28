#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Source imagetest libraries
source ../libs/libs.sh

# Extract image reference
image=$(get_test_image "mongodb")

echo "=== MongoDB functionality test started ==="

TMPDIR="$(mktemp -d)"
ID="$(date +%s)-$(shuf -i 1000-9999 -n 1 2>/dev/null || echo $((RANDOM % 9000 + 1000)))"
MONGOD_CONTAINER_NAME="mongod-${ID}"
MONGO_CONTAINER_NAME="mongo-${ID}"
MONGO_NET_NAME="mongo-net-${ID}"

cleanup() {
  docker stop "${MONGOD_CONTAINER_NAME}" 2>/dev/null || true
  docker container rm "${MONGOD_CONTAINER_NAME}" 2>/dev/null || true
  docker network rm "${MONGO_NET_NAME}" 2>/dev/null || true
  rm -rf "${TMPDIR}"
}
trap cleanup EXIT

echo "=== Setting up test environment ==="
chmod -R 777 "${TMPDIR}"

echo "=== Generating TLS certificates ==="
openssl genrsa 2048 > "${TMPDIR}/ca-key.pem"

openssl req -new -nodes -x509 \
  -days 2 \
  -key "${TMPDIR}/ca-key.pem" \
  -out "${TMPDIR}/ca-cert.pem" \
  -subj "/CN=mongo CA"
cat "${TMPDIR}/ca-key.pem" "${TMPDIR}/ca-cert.pem" > "${TMPDIR}/ca.pem"

# generate a key+cert to use with mongod
openssl req \
  -newkey rsa:2048 -nodes \
  -keyout "${TMPDIR}/privkey.pem" \
  -x509 -days 2 \
  -out "${TMPDIR}/cert.pem" \
  -CA "${TMPDIR}/ca-cert.pem" \
  -CAkey "${TMPDIR}/ca-key.pem" \
  -subj "/CN=mongod.local"
cat "${TMPDIR}/privkey.pem" "${TMPDIR}/cert.pem" > "${TMPDIR}/fullchain.pem"

echo "=== Setting up Docker network ==="
docker network create "${MONGO_NET_NAME}"

echo "=== Starting MongoDB with TLS ==="
# run mongod with tls required and our temporary key+cert
docker run -d \
  --name "${MONGOD_CONTAINER_NAME}" \
  -v "${TMPDIR}":/ssl \
  --hostname mongod.local \
  --network "${MONGO_NET_NAME}" \
  "${image}" \
    --dbpath /data \
    --bind_ip_all \
    --tlsAllowInvalidCertificates \
    --tlsCertificateKeyFile /ssl/fullchain.pem \
    --tlsCAFile /ssl/ca.pem \
    --tlsMode=requireTLS

echo "=== Waiting for MongoDB to be ready ==="
shu retry --attempts 12 --delay 5s -- \
  sh -c "docker logs '${MONGOD_CONTAINER_NAME}' | grep -qi 'listening'"

echo "=== MongoDB is listening ==="

# Check FIPS status if enabled
if [ "${FIPS_ENABLED:-0}" = "1" ]; then
  echo "=== Checking FIPS status ==="
  docker exec -t "${MONGOD_CONTAINER_NAME}" /usr/bin/openssl-fips-test
  echo "=== FIPS validation completed ==="
fi

echo "=== Testing MongoDB connectivity and basic operations ==="
# start another container with mongo (the shell) and connect to the TLS enabled mongod
DBS=$(docker run --rm -t \
  -v "${TMPDIR}":/ssl \
  --entrypoint=mongo \
  --hostname mongo.local \
  --network "${MONGO_NET_NAME}" \
  "${image}" \
    --tls \
    --tlsAllowInvalidCertificates \
    --tlsCAFile /ssl/ca.pem \
    --tlsCertificateKeyFile /ssl/fullchain.pem \
    --quiet \
    --host mongod.local \
    --eval "db.getMongo().getDBNames()")

echo "=== Verifying database list ==="
# the output from getDBNames is formatted exactly as shown inside the single quotes
echo "${DBS}" | grep -q '[ "admin", "config", "local" ]'

echo "=== Testing basic database operations ==="
# Test creating a collection and inserting data
docker run --rm -t \
  -v "${TMPDIR}":/ssl \
  --entrypoint=mongo \
  --hostname mongo.local \
  --network "${MONGO_NET_NAME}" \
  "${image}" \
    --tls \
    --tlsAllowInvalidCertificates \
    --tlsCAFile /ssl/ca.pem \
    --tlsCertificateKeyFile /ssl/fullchain.pem \
    --quiet \
    --host mongod.local \
    --eval "
      db = db.getSiblingDB('testdb');
      db.testcol.insertOne({name: 'test', value: 42});
      result = db.testcol.findOne({name: 'test'});
      if (result.value !== 42) {
        throw new Error('Insert/find test failed');
      }
      print('Database operations test passed');
    "

echo "=== All MongoDB tests completed successfully ==="