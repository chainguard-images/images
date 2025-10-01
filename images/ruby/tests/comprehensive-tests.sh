#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Source test libraries
source ../libs/libs.sh

image=$(echo "$IMAGES" | jq -r '.ruby.ref')

# Test 1: Basic usage test (irb version)
echo "=== Test 1: IRB Version Check ==="
if docker run --rm --entrypoint irb "${image}" -v; then
  echo "TEST 1 PASSED: IRB version check"
else
  echo "TEST 1 FAILED: IRB version check"
  exit 1
fi

# Test 2: Default run (usage message)
echo "=== Test 2: Default Usage Test ==="
if docker run --rm "${image}"; then
  echo "TEST 2 PASSED: Default usage"
else
  echo "TEST 2 FAILED: Default usage"
  exit 1
fi

# Test 3: Hello World with Gem Installation
echo "=== Test 3: Hello World with Gem Installation ==="
TMP=$(mktemp -d)
trap "rm -rf ${TMP}" EXIT

# Make this writeable by the nonroot container user
chmod 777 "${TMP}"

cat > ${TMP}/hello-world.rb <<EOF
# Exercise the gem
gem 'chronic', '~>0.6'
require 'chronic'

puts "Hello World. It is " + Chronic.parse('today').to_s
EOF

# Install the gem
echo "Installing chronic gem..."
if docker run --rm -v "${TMP}:/home/nonroot" -v "${TMP}/hello-world.rb:/src/hello-world.rb" \
  --entrypoint "gem" "${image}" install --user-install chronic; then
  echo "Gem installation successful"
else
  echo "TEST 3 FAILED: Gem installation failed"
  exit 1
fi

# Run the container with the gem
echo "Running hello-world script..."
if docker run --rm -v "${TMP}:/home/nonroot" -v "${TMP}/hello-world.rb:/src/hello-world.rb" \
  --entrypoint "ruby" "${image}" \
  /src/hello-world.rb \
  | grep "Hello World"; then
  echo "TEST 3 PASSED: Hello World with gem installation"
else
  echo "TEST 3 FAILED: Hello World script did not produce expected output"
  exit 1
fi

# Test 4: Base Image Test (Dockerfile build)
echo "=== Test 4: Base Image Test ==="
DOCKERFILE_TMP=$(mktemp -d)
trap "rm -rf ${TMP} ${DOCKERFILE_TMP}" EXIT

cat > ${DOCKERFILE_TMP}/hello-world-dockerfile.rb <<EOF
# Exercise the gem
gem 'chronic', '~>0.6'
require 'chronic'

puts "Hello World. It is " + Chronic.parse('today').to_s
EOF

# The image can be used as a base image.
cat > ${DOCKERFILE_TMP}/Dockerfile <<EOF
FROM ${image}
RUN ["gem", "install", "chronic", "--user-install"]

COPY ./hello-world-dockerfile.rb /home/nonroot/hello-world.rb

ENTRYPOINT ["ruby", "/home/nonroot/hello-world.rb"]
EOF

# Using registry.local:5000 as the FROM in docker build fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${image}

echo "Building hello-gem image..."
if docker build -t hello-gem ${DOCKERFILE_TMP}/; then
  echo "Docker build successful"
else
  echo "TEST 4 FAILED: Docker build failed"
  exit 1
fi

echo "Running hello-gem container..."
if docker run --rm hello-gem | grep "Hello World"; then
  echo "TEST 4 PASSED: Base image test"
else
  echo "TEST 4 FAILED: hello-gem container did not produce expected output"
  exit 1
fi

# Cleanup
rm -rf ${TMP} ${DOCKERFILE_TMP}
trap - EXIT

echo "=== All Ruby tests completed successfully! ==="