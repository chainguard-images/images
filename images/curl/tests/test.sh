#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x

source ../libs/libs.sh

image=$(echo "$IMAGES" | jq -r '.curl.ref')

# Test basic command
docker run --rm "$image" --version

GET_URL="https://raw.githubusercontent.com/chainguard-images/images/main/README.md"

docker run --rm "$image" "${GET_URL}" | grep -q "Chainguard Images"


# Now that the easy tests are done let's setup some scaffolding for another test.
# ----

docker network create curl-test

# Start local httpbin server using Python and gunicorn
docker run -d \
  --name httpbin-test \
  --network curl-test \
  --entrypoint sh \
  ${PYTHON_IMAGE} \
  -c "pip install --no-cache-dir httpbin gunicorn && python -m gunicorn -b 0.0.0.0:8080 httpbin:app"

# Cleanup afterwards
trap 'docker rm -f httpbin-test 2>/dev/null; docker network rm curl-test 2>/dev/null' EXIT

wait_for_httpbin() {
  docker ps --filter "name=httpbin-test" --filter "status=running" | grep -q httpbin-test
}

post() {
  docker run --rm --network curl-test "$image" -v --fail-with-body -H "Content-Type: application/json" \
    -d '{"name": "chainguard"}' \
    "http://httpbin-test:8080/post"
}

retry_until 30 1 wait_for_httpbin
retry_until 10 2 post

