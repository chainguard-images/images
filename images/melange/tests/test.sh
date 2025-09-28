#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Source imagetest libraries
source ../libs/libs.sh

# Extract image reference
image=$(get_test_image "melange")

echo "=== Testing melange version ==="
docker run --rm "${image}" version

echo "=== Testing melange help ==="
docker run --rm "${image}" --help

echo "=== Testing melange build functionality ==="

# Create a temporary working directory for build artifacts
BUILD_DIR=$(mktemp -d)
trap "rm -rf ${BUILD_DIR}" EXIT

# Copy the minimal.yaml config to the build directory
cp minimal.yaml "${BUILD_DIR}/"

echo "=== Running melange build with minimal config ==="
# Test melange build functionality with privileged Docker
# The build should produce an APK file in the output directory
docker run --rm --privileged=true \
  -v "${BUILD_DIR}:/work" \
  -w /work \
  "${image}" build minimal.yaml --arch=$(uname -m) --out-dir /work/output

echo "=== Verifying build output ==="
# Check that the build produced APK files
if [ -d "${BUILD_DIR}/output" ]; then
  echo "Build output directory contents:"
  ls -la "${BUILD_DIR}/output/"
  # Look for APK files
  find "${BUILD_DIR}/output" -name "*.apk" -type f | head -5
else
  echo "ERROR: Output directory was not created"
  exit 1
fi

echo "=== All melange tests completed successfully ==="