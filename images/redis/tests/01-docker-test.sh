#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source ../libs/libs.sh

image="$(get_test_image "redis")"
container="redis-smoketest-${RANDOM}"
volume="redis-data-${RANDOM}"

apk_add netcat-openbsd

# --- Utility functions ---

redis_cli() {
  docker exec $container redis-cli "${@}"
}

redis_ready() {
  redis_cli PING | grep "PONG"
}

# --- Smoke Tests ---
docker run --rm "$image" --version | grep -E "[0-9]+\.[0-9]+\.[0-9]+"
set +e
help_message=$(docker run --rm "$image" --help 2>&1)
set -e
echo "$help_message" | grep -F "Usage:"

docker run -d -p 6379:6379 \
  -v "$volume:/data" \
  --name "$container" "$image"

retry_until 5 2 redis_ready

tw dgrep "$container" --retry 5 --timeout 2s \
  -e "Server initialized" \
  -e " Ready to accept connections"

# Test basic connectivity using netcat

echo "PING" | nc -q 1 localhost 6379 | grep "+PONG"

(
  echo "SET mykey myvalue"
  echo "GET mykey"
  echo "QUIT"
) | nc localhost 6379 >${container}.txt

grep "myvalue" ${container}.txt

# --- Redis CLI tests ---

# Test basic SET/GET operations
redis_cli SET testkey testvalue
redis_cli GET testkey | grep "testvalue"

# Test key operations
redis_cli EXISTS testkey | grep "1"
redis_cli DEL testkey
redis_cli EXISTS testkey | grep "0"

# Test numeric operations
redis_cli SET counter 0
redis_cli INCR counter
redis_cli GET counter | grep "1"
redis_cli DECR counter
redis_cli GET counter | grep "0"

# create a key with expiration of 2 seconds
redis_cli SET tempkey tempvalue EX 2
sleep 3
redis_cli EXISTS tempkey | grep "0"

# Test list operations
redis_cli LPUSH mylist "item1"
redis_cli LLEN mylist | grep "1"
redis_cli LPUSH mylist "item2"
redis_cli LLEN mylist | grep "2"
redis_cli LPOP mylist | grep "item2"

# Test hash operations
redis_cli HSET user:1 name "John" age 30
redis_cli HGET user:1 name | grep "John"
redis_cli HGETALL user:1 | grep "John"

# Test set operations
redis_cli SADD myset "member1" "member2" "member2"
redis_cli SCARD myset | grep "2" # should only add unique members
redis_cli SISMEMBER myset "member1" | grep "1"

# Persistence test
redis_cli SET persistkey persistvalue
redis_cli SAVE
docker restart "$container"
retry_until 5 2 redis_ready

redis_cli GET persistkey | grep "persistvalue"

# --- Redis Authentication Test ---
# configure the container to require a password
password="P@ss${RANDOM}W0rd${RANDOM}"
redis_cli CONFIG SET requirepass "$password"

# Attempt to run a command without authentication
set +e
noauth_output=$(redis_cli PING 2>&1)
set -e
echo "$noauth_output" | grep "NOAUTH Authentication required"

# Authenticate and run a command
auth_output=$(redis_cli -a "$password" PING)
echo "$auth_output" | grep "PONG"

echo "All tests passed successfully!"
