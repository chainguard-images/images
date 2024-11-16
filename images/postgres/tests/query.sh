#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"postgres-${RANDOM}"}

docker run -e POSTGRES_PASSWORD=password -d --name $CONTAINER_NAME $IMAGE_NAME
sleep 10

trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT

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

# Create a new database
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE DATABASE testdb;"

# Create a new table and insert data in the new database
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));"
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "INSERT INTO test (name) VALUES ('example');"

# Create index, transaction and aggregate function
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "CREATE INDEX idx_name ON test (name);"
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "BEGIN; INSERT INTO test (name) VALUES ('transaction_example'); ROLLBACK;"
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -d testdb -c "SELECT COUNT(*) FROM test;"

# Create a new user and grant privileges
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "CREATE USER testuser WITH PASSWORD 'password';"
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "GRANT ALL PRIVILEGES ON DATABASE testdb TO testuser;"

# Drop the test database and user
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP DATABASE testdb;"
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -h 127.0.0.1 -c "DROP USER testuser;"

docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -t -c "show server_encoding;" | head -n 1 | grep UTF8

