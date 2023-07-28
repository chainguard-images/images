#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

cat > hello-world.rb <<EOF
puts "Hello World"
EOF

docker run --rm -v $(pwd)/hello-world.rb:/src/hello-world.rb \
  --entrypoint "ruby" "${IMAGE_NAME}" \
  /src/hello-world.rb \
  | grep "Hello World"
