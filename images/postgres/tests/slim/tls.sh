#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

server_name="postgres_server-${RANDOM}"
client_name="postgres_client-${RANDOM}"
network_name="postgres_network-${RANDOM}"
certs_dir="/tmp/certs-${RANDOM}"
postgres_password="password"

# Function to clean up resources in case of an error
cleanup() {
	echo "Cleaning up..."
	docker rm -f $server_name $client_name
	docker network rm $network_name
	rm -rf $certs_dir
}
trap cleanup EXIT

# Generate root CA (FIPS-compliant: 4096-bit RSA key)
mkdir -p $certs_dir
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out $certs_dir/ca.key
openssl req -x509 -new -nodes -key $certs_dir/ca.key -sha256 -days 1024 -out $certs_dir/ca.crt -subj "/CN=localhost"

# Generate SSL certificates for server (FIPS-compliant: 4096-bit RSA key)
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out $certs_dir/server.key
openssl req -new -key $certs_dir/server.key -out $certs_dir/server.csr -subj "/CN=localhost"
openssl x509 -req -in $certs_dir/server.csr -CA $certs_dir/ca.crt -CAkey $certs_dir/ca.key -CAcreateserial -out $certs_dir/server.crt -days 365

# Ensure correct ownership
chown -R $POSTGRES_UID:$POSTGRES_GID "$certs_dir"

# Set correct file permissions
chmod 600 "$certs_dir/server.key"  # PostgreSQL requires 600
chmod 644 "$certs_dir/server.crt"
chmod 644 "$certs_dir/ca.crt"

chmod 700 /certs  # Restrict access

# Move certs to the mounted volume
cp -r "$certs_dir"/* /certs

chown -R $POSTGRES_UID:$POSTGRES_GID /certs
chmod 600 /certs/server.key
chmod 644 /certs/server.crt
chmod 644 /certs/ca.crt

# Create a Docker network
docker network create $network_name

# Copy SSL certificates into the data directory
docker run --rm \
  -v "$DATA_VOLUME_ID:/var/lib/postgresql/data" \
  -v "$CERTS_VOLUME_ID:/certs" \
  --user $POSTGRES_UID:$POSTGRES_GID \
  --entrypoint cp \
  "$IMAGE_NAME_DEV" \
  /certs/server.key /certs/server.crt /certs/ca.crt /var/lib/postgresql/data/

# Start the PostgreSQL server with TLS enabled
docker run -d --name "$server_name" --network "$network_name" \
  -v "$DATA_VOLUME_ID:/var/lib/postgresql/data" \
  --user $POSTGRES_UID:$POSTGRES_GID \
  --entrypoint postgres \
  "$IMAGE_NAME" \
  -D /var/lib/postgresql/data \
  -c ssl=on \
  -c ssl_cert_file='/var/lib/postgresql/data/server.crt' \
  -c ssl_key_file='/var/lib/postgresql/data/server.key' \
  -c ssl_ca_file='/var/lib/postgresql/data/ca.crt'

sleep 10

# Wait until the PostgreSQL server is ready to accept connections or timeout
for i in $(seq 1 10); do
  if docker logs $server_name 2>&1 | grep "database system is ready to accept connections"; then
    break
  fi
  if [ $i -eq 10 ]; then
    echo "Timed out waiting for PostgreSQL to be ready"
    exit 1
  fi
  sleep 10
done

# Internal check (Ensures PostgreSQL has SSL enabled)
SSL_STATUS=$(docker exec "$server_name" psql -U postgres -t -A -c "SHOW ssl;")
echo "PostgreSQL Internal SSL Status: $SSL_STATUS"

if [[ "$SSL_STATUS" != "on" ]]; then
    echo "SSL is NOT enabled in PostgreSQL! Exiting..."
    exit 1
fi
echo "SSL is enabled inside PostgreSQL."

# External client check (Ensures SSL connections are accepted)
client_output=$(docker run --rm --name "$client_name" --network "$network_name" -v "$CERTS_VOLUME_ID:/certs:rw" \
    --user "$POSTGRES_UID:$POSTGRES_GID" \
    -e PGPASSWORD="$postgres_password" --entrypoint psql "$IMAGE_NAME" \
    --host="$server_name" --port=5432 --username=postgres --dbname=postgres  \
    --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt \
    -t -A -c 'SHOW ssl;')

echo "PostgreSQL SSL Status from Client Perspective: $client_output"

if [[ "$client_output" != "on" ]]; then
    echo "Client could not establish an SSL connection! Exiting..."
    exit 1
fi
echo "Client successfully connected via SSL."


# Additional Queries to Ensure SSL Database Operations
function run_ssl_query() {
  local query="$1"
  docker run --rm --name "$client_name" --network "$network_name" \
    --user $POSTGRES_UID:$POSTGRES_GID \
    -v "$CERTS_VOLUME_ID:/certs:rw" \
    -e PGPASSWORD="$postgres_password" \
    --entrypoint psql "$IMAGE_NAME" \
    --host="$server_name" --port=5432 --username=postgres --dbname=postgres \
    --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt \
    -c "$query"
}

# Create a test table, insert a record, and verify retrieval over SSL
run_ssl_query "CREATE TABLE IF NOT EXISTS test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
run_ssl_query "INSERT INTO test (name) VALUES ('example');"
run_ssl_query "SELECT * FROM test;"