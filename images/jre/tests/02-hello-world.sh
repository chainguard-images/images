#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

cat > HelloWorld.java <<EOF
class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
EOF

TMP=$(mktemp -d)

# Make this writeable by the nonroot container user
chmod 777 "${TMP}"

docker run --rm -v $(pwd)/HelloWorld.java:/src/HelloWorld.java -v "${TMP}:/tmp" \
  `# Build using the latest JDK image` \
  --entrypoint "javac" cgr.dev/chainguard/jdk \
  `# Targeting Java 11 so that all our JREs can run the produced .class file` \
  -source 11 -target 11 \
  /src/HelloWorld.java -d /tmp

# Now we have the .class file, run it to test our JRE.
docker run --rm -v "${TMP}:/tmp" --entrypoint "java" "${IMAGE_NAME}" -cp /tmp HelloWorld
