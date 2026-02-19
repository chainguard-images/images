#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image="$(get_test_image "mariadb")"
container="mariadb-${RANDOM}"
db_password="secret"
cert_dir="/tmp/mariadb-certs-${RANDOM}"

# Generate certificates (RSA 4096, SHA256)
generate_certs() {
  mkdir -p "$cert_dir"

  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out "$cert_dir/ca.key"
  openssl req -x509 -new -nodes -key "$cert_dir/ca.key" -sha256 -days 365 \
    -out "$cert_dir/ca.pem" -subj "/CN=MariaDB Test CA"

  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out "$cert_dir/server-key.pem"
  openssl req -new -key "$cert_dir/server-key.pem" \
    -out "$cert_dir/server.csr" -subj "/CN=localhost"
  openssl x509 -req -in "$cert_dir/server.csr" -CA "$cert_dir/ca.pem" \
    -CAkey "$cert_dir/ca.key" -CAcreateserial \
    -out "$cert_dir/server-cert.pem" -days 365 -sha256

  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out "$cert_dir/client-key.pem"
  openssl req -new -key "$cert_dir/client-key.pem" \
    -out "$cert_dir/client.csr" -subj "/CN=localhost"
  openssl x509 -req -in "$cert_dir/client.csr" -CA "$cert_dir/ca.pem" \
    -CAkey "$cert_dir/ca.key" -CAcreateserial \
    -out "$cert_dir/client-cert.pem" -days 365 -sha256

  chmod 644 "$cert_dir"/*
}

generate_certs

# Start MariaDB with SSL required
docker run -d --name "$container" \
  -e MARIADB_ROOT_PASSWORD="$db_password" \
  -v "$cert_dir:/certs:ro" \
  "$image" \
  --require_secure_transport=ON \
  --ssl-ca=/certs/ca.pem \
  --ssl-cert=/certs/server-cert.pem \
  --ssl-key=/certs/server-key.pem

tw dgrep "$container" -e "ready for connections"

run_query() {
  docker exec "$container" mariadb -uroot -p"$db_password" \
    --ssl-ca=/certs/ca.pem \
    --ssl-cert=/certs/client-cert.pem \
    --ssl-key=/certs/client-key.pem \
    -N -e "$1"
}

# Verify TLS connection
run_query "SHOW STATUS LIKE 'Ssl_cipher';" | awk '{print $2}' | grep -E ".+"

# Verify version
run_query "SELECT VERSION();" | grep -E "^[0-9]+\.[0-9]+\.[0-9]+"

# Crypto functions
run_query "SELECT SHA2('test', 256);" | grep -E "^[a-f0-9]{64}$"
run_query "SELECT SHA2('test', 384);" | grep -E "^[a-f0-9]{96}$"
run_query "SELECT SHA2('test', 512);" | grep -E "^[a-f0-9]{128}$"

run_query "SELECT HEX(AES_ENCRYPT('secret', 'key'));" | grep -E "^[A-F0-9]+$"
run_query "SELECT AES_DECRYPT(AES_ENCRYPT('secret', 'key'), 'key');" | grep -F "secret"
