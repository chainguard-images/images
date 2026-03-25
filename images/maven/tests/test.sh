#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source ../libs/libs.sh

IMAGE_NAME=$(get_test_image "maven")

# generate a pom.xml and App.java
docker run \
  -v mvn-archetype:/home/build \
  -v mvn-m2:/home/maven/.m2 \
  --workdir /home/build \
  "$IMAGE_NAME" \
  archetype:generate \
  -DgroupId=dev.chainguard \
  -DartifactId=hello-world \
  -Dversion=1.0 \
  -DarchetypeVersion=1.4 \
  -DinteractiveMode=false

# archetype:generate defaults to 1.7, but that's ooooold
docker run \
  -v mvn-archetype:/home/build \
  --entrypoint sh \
  "$IMAGE_NAME" \
  -c "sed 's#<maven.compiler.source>1.7#<maven.compiler.source>1.8#g' -i /home/build/hello-world/pom.xml && sed 's#<maven.compiler.target>1.7#<maven.compiler.target>1.8#g' -i /home/build/hello-world/pom.xml"

docker run \
  -v mvn-archetype:/home/build \
  -v mvn-m2:/home/maven/.m2 \
  --workdir /home/build/hello-world \
  "$IMAGE_NAME" \
  compile

docker run \
  -v mvn-archetype:/home/build \
  -v mvn-m2:/home/maven/.m2 \
  --workdir /home/build/hello-world \
  "$IMAGE_NAME" \
  exec:java -Dexec.mainClass="dev.chainguard.App" -q | grep 'Hello World!'
