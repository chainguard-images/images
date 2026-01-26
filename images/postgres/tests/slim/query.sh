#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

config_dir="/tmp/config-${RANDOM}"

# Generate postgres config
mkdir -p $config_dir
tee "$config_dir/pg_hba.conf" <<'EOF'
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             0.0.0.0/0               md5
host    all             all             ::0/0                   md5
EOF

# Ensure correct ownership
chown -R $POSTGRES_UID:$POSTGRES_GID "$config_dir"

# Set correct file permissions
chmod 644 "$config_dir/pg_hba.conf"

chmod 700 /config  # Restrict access

# Move config to the mounted volume
cp -r "$config_dir"/* /config

chown -R $POSTGRES_UID:$POSTGRES_GID /config
chmod 644 /config/pg_hba.conf

CONTAINER_NAME=${CONTAINER_NAME:-"postgres-${RANDOM}"}

# Step 1: Initialize the database
# Run initdb to create the initial database cluster using the dev image
# The dev image includes initdb and necessary utilities for initialization
docker run --rm \
  -v "$DATA_VOLUME_ID:/var/lib/postgresql/data" \
  --user $POSTGRES_UID:$POSTGRES_GID \
  --entrypoint initdb \
  "$IMAGE_NAME_DEV" \
  -D /var/lib/postgresql/data --locale=C --encoding=UTF8

# Copy custom pg_hba.conf into the data directory
docker run --rm \
  -v "$DATA_VOLUME_ID:/var/lib/postgresql/data" \
  -v "$CONFIG_VOLUME_ID:/config" \
  --user $POSTGRES_UID:$POSTGRES_GID \
  --entrypoint cp \
  "$IMAGE_NAME_DEV" \
  /config/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf


# Step 2: Start PostgreSQL server
# Use the standard runtime image to run the postgres server
# Mount custom pg_hba.conf and set listen_addresses via command-line flag
docker run -d \
  --name "$CONTAINER_NAME" \
  -v "$DATA_VOLUME_ID:/var/lib/postgresql/data" \
  --user $POSTGRES_UID:$POSTGRES_GID \
  --entrypoint postgres \
  "$IMAGE_NAME" \
  -D /var/lib/postgresql/data

trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT

sleep 10

# Wait until the PostgreSQL server is ready to accept connections or timeout
for i in $(seq 1 10); do
  if docker logs $CONTAINER_NAME 2>&1 | grep "database system is ready to accept connections"; then
    break
  fi
  if [ $i -eq 10 ]; then
    echo "Timed out waiting for PostgreSQL to be ready"
    exit 1
  fi
  sleep 10
done

# Connect and set the password for the postgres user
docker exec $CONTAINER_NAME psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'password';"

# Create a new database
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE DATABASE testdb;"

# Create a new table and insert data in the new database
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "INSERT INTO test (name) VALUES ('example');"

# Create index, transaction and aggregate function
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE INDEX idx_name ON test (name);"
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "BEGIN; INSERT INTO test (name) VALUES ('transaction_example'); ROLLBACK;"
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "SELECT COUNT(*) FROM test;"

# Create a new user and grant privileges
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE USER testuser WITH PASSWORD 'password';"
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "GRANT ALL PRIVILEGES ON DATABASE testdb TO testuser;"

# Drop the test database and user
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP DATABASE testdb;"
docker exec -e PGPASSWORD=password $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP USER testuser;"

docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -t -c "show server_encoding;" | head -n 1 | grep UTF8