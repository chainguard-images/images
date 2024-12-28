#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

server_name="postgres_server-${RANDOM}"
client_name="postgres_client-${RANDOM}"
network_name="postgres_network-${RANDOM}"
certs_dir="/tmp/certs-${RANDOM}"
postgres_password="secret"

# Function to clean up resources in case of an error
cleanup() {
	echo "Cleaning up..."
	docker rm -f $server_name $client_name
	docker network rm $network_name
	rm -rf $certs_dir
}
trap cleanup EXIT

# Generate root CA
mkdir -p $certs_dir
openssl genpkey -algorithm RSA -out $certs_dir/ca.key
openssl req -x509 -new -nodes -key $certs_dir/ca.key -sha256 -days 1024 -out $certs_dir/ca.crt -subj "/CN=localhost"

# Generate SSL certificates for server
openssl genpkey -algorithm RSA -out $certs_dir/server.key
openssl req -new -key $certs_dir/server.key -out $certs_dir/server.csr -subj "/CN=localhost"
openssl x509 -req -in $certs_dir/server.csr -CA $certs_dir/ca.crt -CAkey $certs_dir/ca.key -CAcreateserial -out $certs_dir/server.crt -days 365

# Create a Docker network
docker network create $network_name

# Start the PostgreSQL server with TLS enabled
docker run --rm -d --name $server_name --network $network_name -v $(pwd)/$certs_dir:/certs -e POSTGRES_PASSWORD="$postgres_password" -e POSTGRES_SSL_CERT_FILE=/certs/server.crt -e POSTGRES_SSL_KEY_FILE=/certs/server.key $IMAGE_NAME
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

# Verify SSL configuration
docker exec $server_name cat /var/lib/postgresql/data/postgresql.conf | grep ssl
docker exec $server_name cat /var/lib/postgresql/data/pg_hba.conf | grep ssl

# Run the client in another container on the same network
docker run --rm --name $client_name --network $network_name -v $(pwd)/$certs_dir:/certs -e PGPASSWORD="$postgres_password" --entrypoint psql $IMAGE_NAME --host=$server_name --port=5432 --username=postgres --dbname=postgres --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt -c 'SELECT 1'

# Additional queries to ensure database operations over SSL
docker run --rm --name $client_name --network $network_name -v $(pwd)/$certs_dir:/certs -e PGPASSWORD="$postgres_password" --entrypoint psql $IMAGE_NAME --host=$server_name --port=5432 --username=postgres --dbname=postgres --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt -c 'CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));'
docker run --rm --name $client_name --network $network_name -v $(pwd)/$certs_dir:/certs -e PGPASSWORD="$postgres_password" --entrypoint psql $IMAGE_NAME --host=$server_name --port=5432 --username=postgres --dbname=postgres --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt -c "INSERT INTO test (name) VALUES ('example');"
docker run --rm --name $client_name --network $network_name -v $(pwd)/$certs_dir:/certs -e PGPASSWORD="$postgres_password" --entrypoint psql $IMAGE_NAME --host=$server_name --port=5432 --username=postgres --dbname=postgres --set=sslmode=require --set=sslcert=/certs/server.crt --set=sslkey=/certs/server.key --set=sslrootcert=/certs/ca.crt -c 'SELECT * FROM test;'
