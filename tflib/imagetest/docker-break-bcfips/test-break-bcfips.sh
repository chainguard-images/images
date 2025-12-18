#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

source /imagetest/libs/libs.sh

test_image="$(get_test_image "test_image")"

# Parse environment variables for docker run
# ENV_VARS should be space-separated like "VAR1=value1 VAR2=value2"
parse_env_vars() {
  local env_vars=""
  if [ -n "${ENV_VARS:-}" ]; then
    for var in $ENV_VARS; do
      env_vars="$env_vars -e $var"
    done
  fi
  echo "$env_vars"
}

ENV_VARS=$(parse_env_vars)

# TODO @klrmngr: implement custom script functionality
# dev_image="$(get_test_image "dev_image")"

corrupt_bcfips_jar() {
  apk_add zip openjdk-21-jre-base

  # ideally what we would do is apk add bouncycastle-fips and corrupt the jar locally
  # this will only work if we have access to chainguard-private APK's, cleaner than copying out the jar.
  # would require changes in terraform-provider-imagetest
  # apk add --no-cache bouncycastle-fips

  # extract the bc-fips.jar
  docker cp $(docker create --rm $test_image):/usr/share/java/bouncycastle-fips/bc-fips.jar ./bc-fips.jar

  unzip bc-fips.jar -d bc-fips-extracted
  cp HMAC.SHA256 bc-fips-extracted/META-INF/HMAC.SHA256
  # this is the validation hmac that is checked
  # if we look at the decompiled bouncycastle code
  # org.bouncycastle/jcajce/provider/BouncyFipsProvider.class line ~600
  # when creating a new instance of BouncyFipsProvider it calls FipsStatus.isReady() to see if fips is ready
  # FipsStatus.isReady() is defined in org.bouncycastle/crypto/fips/FipsStatus.class line ~40, which calls checksumValidate(), defined in line ~70
  # checksumValidate() reads the HMAC.SHA256 file from META-INF and compares it to a computed HMAC of the rest of the jar contents

  cd bc-fips-extracted
  rm -f ../bc-fips.jar
  zip -r ../bc-fips.jar .
  cd ..

  # verify that bouncycastle can still function but will fail due to checksum error
  # see https://downloads.bouncycastle.org/fips-java/docs/BC-FJA-SecurityPolicy-2.1.0.pdf page 4
  { /usr/lib/jvm/java-21-openjdk/bin/java -cp bc-fips.jar org.bouncycastle.util.DumpInfo 2>&1 || true; } \
    | grep "Module checksum failed: SHA-256 digest error"
}

test_break_bcfips_jar() {
  echo "Testing that breaking BC-FIPS JAR integrity causes failure..."
  docker_cmd=(docker run --rm -v "$(pwd)/bc-fips.jar:/usr/share/java/bouncycastle-fips/bc-fips.jar")

  if [ -n "${ENV_VARS:-}" ]; then
    docker_cmd+=("${ENV_VARS}")
  fi
  
  if [ -n "${ENTRYPOINT:-}" ]; then
    image="$test_image"
    docker_cmd+=(--entrypoint="${ENTRYPOINT}")
  else
    image="$test_image"
  fi

  docker pull "$image"
  docker_cmd+=("$image")

  if [ -n "${ENTRYPOINT_ARGS:-}" ]; then
    docker_cmd+=($ENTRYPOINT_ARGS)
  fi

  output=$("${docker_cmd[@]}" 2>&1 || true)

  if echo "$output" | grep -q "${EXPECTED_PANIC_MESSAGE}"; then
    echo "Found expected error message containing: ${EXPECTED_PANIC_MESSAGE}"
  else
    echo "Expected to find: ${EXPECTED_PANIC_MESSAGE}"
    echo "Actual output: $output"
    echo $output | cat > out.log
    exit 1
  fi
}

main() {
  corrupt_bcfips_jar
  test_break_bcfips_jar
}

main "$@"
