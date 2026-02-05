#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

image="$(get_test_image "postgres")"
server_name="postgres_server-${RANDOM}"
client_name="postgres_client-${RANDOM}"
network_name="postgres_network-${RANDOM}"
certs_dir="/tmp/certs-${RANDOM}"
postgres_password="secret"

trap "docker logs $server_name" EXIT

# Generate root CA (FIPS-compliant: 4096-bit RSA key)
mkdir -p "$certs_dir"
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out "$certs_dir/ca.key"
openssl req -x509 -new -nodes -key "$certs_dir/ca.key" -sha256 -days 1024 -out "$certs_dir/ca.crt" -subj "/CN=localhost"

# Generate SSL certificates for server (FIPS-compliant: 4096-bit RSA key)
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out "$certs_dir/server.key"
openssl req -new -key "$certs_dir/server.key" -out "$certs_dir/server.csr" -subj "/CN=localhost"
openssl x509 -req -in "$certs_dir/server.csr" -CA "$certs_dir/ca.crt" -CAkey "$certs_dir/ca.key" -CAcreateserial -out "$certs_dir/server.crt" -days 365

# Ensure correct ownership and permissions
chown -R "$POSTGRES_UID:$POSTGRES_GID" "$certs_dir"
chmod 600 "$certs_dir/server.key"

# Create a Docker network
docker network create "$network_name"

# Start the PostgreSQL server with TLS enabled
docker run -d --name "$server_name" --network "$network_name" \
  -v "$certs_dir:/certs:rw" \
  -e POSTGRES_DB=postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD="$postgres_password" \
  --user "$POSTGRES_UID:$POSTGRES_GID" \
  "$image" \
  -c ssl=on \
  -c ssl_cert_file='/certs/server.crt' \
  -c ssl_key_file='/certs/server.key' \
  -c ssl_ca_file='/certs/ca.crt'

# Wait until the PostgreSQL server is ready to accept connections
tw dgrep "$server_name" -e "database system is ready to accept connections"

# Internal check (Ensures PostgreSQL has SSL enabled)
SSL_STATUS=$(docker exec "$server_name" psql -U postgres -t -A -c "SHOW ssl;")

if [[ "$SSL_STATUS" != "on" ]]; then
    exit 1
fi

# External client check (Ensures SSL connections are accepted)
client_output=$(docker run --rm --name "$client_name" --network "$network_name" -v "$certs_dir:/certs:rw" \
    --user "$POSTGRES_UID:$POSTGRES_GID" \
    -e PGPASSWORD="$postgres_password" --entrypoint psql "$image" \
    --host="$server_name" --port=5432 --username=postgres --dbname=postgres  \
    --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt \
    -t -A -c 'SHOW ssl;')

if [[ "$client_output" != "on" ]]; then
    exit 1
fi

# Additional Queries to Ensure SSL Database Operations
run_ssl_query() {
  local query="$1"
  docker run --rm --name "$client_name" --network "$network_name" \
    --user "$POSTGRES_UID:$POSTGRES_GID" \
    -v "$certs_dir:/certs:rw" \
    -e PGPASSWORD="$postgres_password" \
    --entrypoint psql "$image" \
    --host="$server_name" --port=5432 --username=postgres --dbname=postgres \
    --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt \
    -c "$query"
}

# Create a test table, insert a record, and verify retrieval over SSL
run_ssl_query "CREATE TABLE IF NOT EXISTS test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
run_ssl_query "INSERT INTO test (name) VALUES ('example');"
run_ssl_query "SELECT * FROM test;"
