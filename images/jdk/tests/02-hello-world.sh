#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

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

docker run --rm -v $(pwd)/HelloWorld.java:/src/HelloWorld.java -v "${TMP}:/tmp" --entrypoint "javac" "${IMAGE_NAME}" /src/HelloWorld.java -d /tmp

docker run --rm -v "${TMP}:/tmp" --entrypoint "java" "${IMAGE_NAME}" -cp /tmp HelloWorld
