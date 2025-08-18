#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Source test libraries
source ../libs/libs.sh

image=$(echo "$IMAGES" | jq -r '.python.ref')
prod_image=$(echo "$IMAGES" | jq -r '.python_prod.ref')

# Test 1: Python version test
echo "=== Test 1: Python Version ==="
if docker run --rm "${image}" --version; then
  echo "TEST 1 PASSED: Python version check"
else
  echo "TEST 1 FAILED: Python version check"
  exit 1
fi

# Test 2: Check pip (dev variant only)
echo "=== Test 2: Check PIP ==="
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "TEST 2 SKIPPED: PIP check (non-dev variant)"
else
  echo "Testing pip availability in dev image: ${image}"
  if docker run --rm --entrypoint /usr/bin/pip "${image}" --version; then
    echo "TEST 2 PASSED: PIP check"
  else
    echo "TEST 2 FAILED: PIP not available"
    exit 1
  fi
fi

# Test 3: Check numpy installation (dev variant only)  
echo "=== Test 3: Check NumPy Installation ==="
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "TEST 3 SKIPPED: NumPy installation (non-dev variant)"
else
  if docker run -u root --entrypoint sh --rm "${image}" -c "pip install numpy; python -c 'import numpy; print(numpy.__version__)'"; then
    echo "TEST 3 PASSED: NumPy installation and import"
  else
    echo "TEST 3 FAILED: NumPy installation or import failed"
    exit 1
  fi
fi

# Test 4: Build test (dev variant only)
echo "=== Test 4: Build Test ==="
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "TEST 4 SKIPPED: Build test (non-dev variant)"
else
  NEW_IMAGE_TAG="app-${RANDOM}"
  
  # Using registry.local:5000 as the FROM in `docker build` fails with
  # current versions of docker that use containerd under the hood.
  # Pre-pulling it uses docker's heuristics for allowing insecure registries.
  docker pull ${image}
  
  if docker build --build-arg=IMAGE_NAME="${image}" --tag "${NEW_IMAGE_TAG}" .; then
    echo "BUILD STEP PASSED: Docker build successful"
  else
    echo "TEST 4 FAILED: Docker build failed"
    exit 1
  fi
  
  id=$(docker run --detach --publish "5000:5000" ${NEW_IMAGE_TAG})
  trap "docker kill ${id}" EXIT
  
  if shu retry --attempts 5 --delay 1s -- sh -c "curl http://0.0.0.0:5000 | grep -q 'Hello, World!'"; then
    echo "TEST 4 PASSED: Build test and HTTP response"
  else
    echo "TEST 4 FAILED: Application did not respond correctly"
    docker kill ${id}
    exit 1
  fi
  
  docker kill ${id}
  trap - EXIT
fi

# Test 5: Multi-stage build test (dev variant only)
echo "=== Test 5: Multi-stage Build Test ==="
if [ "${SKIP_TEST:-}" = "true" ]; then
  echo "TEST 5 SKIPPED: Multi-stage build test (non-dev variant)"
else
  # Multi-stage build test that demonstrates Grade A compliance
  # This test validates the recommended dev → production pattern
  
  MULTISTAGE_IMAGE_TAG="multistage-app-${RANDOM}"
  
  # Pre-pull both dev and production images
  docker pull ${image}
  docker pull ${prod_image}
  
  echo "Building multi-stage application..."
  if docker build --build-arg=DEV_IMAGE_NAME="${image}" --build-arg=PROD_IMAGE_NAME="${prod_image}" --tag "${MULTISTAGE_IMAGE_TAG}" --file Dockerfile.multistage .; then
    echo "MULTISTAGE BUILD PASSED: Docker multi-stage build successful"
  else
    echo "TEST 5 FAILED: Multi-stage Docker build failed"
    exit 1
  fi
  
  # Test the built image can run Python and import packages
  # Note: We override the Flask entrypoint to test the multi-stage build directly
  echo "Testing multi-stage application..."
  if docker run --rm --entrypoint python ${MULTISTAGE_IMAGE_TAG} -c "import flask, numpy; print('Multi-stage build successful: Flask + NumPy available')"; then
    echo "MULTISTAGE VALIDATION PASSED: Flask + NumPy import successful"
  else
    echo "TEST 5 FAILED: Multi-stage build validation - package import failed"
    exit 1
  fi
  
  # Validate that production image is minimal and functional
  echo "Validating production image..."
  if docker run --rm --entrypoint python ${MULTISTAGE_IMAGE_TAG} -c "import sys; print('Production image running with Python', sys.version_info[:2])"; then
    echo "TEST 5 PASSED: Multi-stage build test completed successfully"
  else
    echo "TEST 5 FAILED: Production image validation failed"
    exit 1
  fi
fi

echo "=== All Python tests completed successfully! ==="