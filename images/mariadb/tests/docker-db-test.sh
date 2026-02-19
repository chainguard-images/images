#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source ../libs/libs.sh

image="$(get_test_image "mariadb")"
container="mariadb-${RANDOM}"
db_password="secret"
test_db="testdb"
test_table="users"

docker run -d --name "$container" \
  -e MARIADB_ROOT_PASSWORD="$db_password" \
  "$image"

tw dgrep "$container" -e "ready for connections"

run_query() {
  docker exec "$container" mariadb -uroot -p"$db_password" \
    -N -e "$1"
}

# Verify version
run_query "SELECT VERSION();" | grep -E "^[0-9]+\.[0-9]+\.[0-9]+"

# Database operations
run_query "CREATE DATABASE $test_db;"
run_query "SHOW DATABASES;" | grep -F "$test_db"

run_query "CREATE TABLE $test_db.$test_table (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);"
run_query "SHOW TABLES IN $test_db;" | grep -F "$test_table"

run_query "INSERT INTO $test_db.$test_table (name, email) VALUES ('Alice', 'alice@example.com');"
run_query "INSERT INTO $test_db.$test_table (name, email) VALUES ('Bob', 'bob@example.com');"
run_query "INSERT INTO $test_db.$test_table (name, email) VALUES ('Charlie', 'charlie@example.com');"

run_query "SELECT COUNT(*) FROM $test_db.$test_table;" | grep -F "3"
run_query "SELECT name FROM $test_db.$test_table WHERE id = 1;" | grep -F "Alice"
run_query "SELECT email FROM $test_db.$test_table WHERE name = 'Bob';" | grep -F "bob@example.com"

run_query "UPDATE $test_db.$test_table SET email = 'alice.smith@example.com' WHERE name = 'Alice';"
run_query "SELECT email FROM $test_db.$test_table WHERE name = 'Alice';" | grep -F "alice.smith@example.com"

run_query "DELETE FROM $test_db.$test_table WHERE name = 'Charlie';"
run_query "SELECT COUNT(*) FROM $test_db.$test_table;" | grep -F "2"

# Transactions
run_query "START TRANSACTION;
  INSERT INTO $test_db.$test_table (name, email) VALUES ('David', 'david@example.com');
  COMMIT;"
run_query "SELECT name FROM $test_db.$test_table WHERE name = 'David';" | grep -F "David"

run_query "START TRANSACTION;
  INSERT INTO $test_db.$test_table (name, email) VALUES ('Eve', 'eve@example.com');
  ROLLBACK;"
run_query "SELECT COUNT(*) FROM $test_db.$test_table WHERE name = 'Eve';" | grep -F "0"

# Schema modification
run_query "ALTER TABLE $test_db.$test_table ADD COLUMN active BOOLEAN DEFAULT TRUE;"
run_query "DESCRIBE $test_db.$test_table;" | grep -F "active"
run_query "SELECT active FROM $test_db.$test_table WHERE name = 'Alice';" | grep -F "1"

run_query "DROP TABLE $test_db.$test_table;"
run_query "DROP DATABASE $test_db;"
