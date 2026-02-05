#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

image="$(get_test_image "postgres")"
dev_image="$(get_test_image "postgres-dev")"
container="postgres-${RANDOM}"
config_dir="/tmp/config-${RANDOM}"
data_volume="postgres-data-${RANDOM}"

trap "docker logs $container" EXIT

# Create a docker volume for data persistence
docker volume create "$data_volume"

# Generate postgres config
mkdir -p "$config_dir"
tee "$config_dir/pg_hba.conf" <<'EOF'
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               md5
host    all             all             ::0/0                   md5
EOF

# Ensure correct ownership and permissions
chown -R "$POSTGRES_UID:$POSTGRES_GID" "$config_dir"

# Step 1: Initialize the database
# Run initdb to create the initial database cluster using the dev image
# The dev image includes initdb and necessary utilities for initialization
docker run --rm \
  -v "$data_volume:/var/lib/postgresql/data" \
  --user "$POSTGRES_UID:$POSTGRES_GID" \
  --entrypoint initdb \
  "$dev_image" \
  -D /var/lib/postgresql/data --locale=C --encoding=UTF8

# Copy custom pg_hba.conf into the data directory
docker run --rm \
  -v "$data_volume:/var/lib/postgresql/data" \
  -v "$config_dir:/config" \
  --user "$POSTGRES_UID:$POSTGRES_GID" \
  --entrypoint cp \
  "$dev_image" \
  /config/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf


# Step 2: Start PostgreSQL server
# Use the standard runtime image to run the postgres server
docker run -d \
  --name "$container" \
  -v "$data_volume:/var/lib/postgresql/data" \
  --user "$POSTGRES_UID:$POSTGRES_GID" \
  --entrypoint postgres \
  "$image" \
  -D /var/lib/postgresql/data

# Wait until the PostgreSQL server is ready to accept connections
tw dgrep "$container" -e "database system is ready to accept connections"

# Connect and set the password for the postgres user
docker exec "$container" psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'password';"

# Create a new database
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE DATABASE testdb;"

# Create a new table and insert data in the new database
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "INSERT INTO test (name) VALUES ('example');"

# Create index, transaction and aggregate function
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE INDEX idx_name ON test (name);"
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "BEGIN; INSERT INTO test (name) VALUES ('transaction_example'); ROLLBACK;"
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "SELECT COUNT(*) FROM test;"

# Create a new user and grant privileges
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE USER testuser WITH PASSWORD 'password';"
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "GRANT ALL PRIVILEGES ON DATABASE testdb TO testuser;"

# Drop the test database and user
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP DATABASE testdb;"
docker exec -e PGPASSWORD=password "$container" /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP USER testuser;"

docker exec "$container" /usr/bin/psql -U postgres -t -c "show server_encoding;" | head -n 1 | grep UTF8
