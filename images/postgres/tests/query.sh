#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

image="$(get_test_image "postgres")"
container="postgres-${RANDOM}"

docker run -e POSTGRES_PASSWORD=password -d --name "$container" "$image"

trap "docker logs $container" EXIT

# Wait until the PostgreSQL server is ready to accept connections
tw dgrep "$container" -e "database system is ready to accept connections"

# Create a new database
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE DATABASE testdb;"

# Create a new table and insert data in the new database
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "INSERT INTO test (name) VALUES ('example');"

# Create index, transaction and aggregate function
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE INDEX idx_name ON test (name);"
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "BEGIN; INSERT INTO test (name) VALUES ('transaction_example'); ROLLBACK;"
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "SELECT COUNT(*) FROM test;"

# Create a new user and grant privileges
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE USER testuser WITH PASSWORD 'password';"
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "GRANT ALL PRIVILEGES ON DATABASE testdb TO testuser;"

# Drop the test database and user
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP DATABASE testdb;"
docker exec "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP USER testuser;"

docker exec "$container" /usr/bin/psql -U postgres -t -c "show server_encoding;" | head -n 1 | grep UTF8
