#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

cat > hello-world.rb <<EOF
# Exercise the gem
gem 'chronic', '~>0.6'
require 'chronic'

puts "Hello World. It is " + Chronic.parse('today').to_s
EOF

TMP=$(mktemp -d)

# Make this writeable by the nonroot container user
chmod 777 "${TMP}"

# Install the gem
docker run --rm -v "${TMP}:/home/nonroot" -v $(pwd)/hello-world.rb:/src/hello-world.rb \
  --entrypoint "gem" "${IMAGE_NAME}" install --user-install chronic

# Run the container
docker run --rm -v "${TMP}:/home/nonroot" -v $(pwd)/hello-world.rb:/src/hello-world.rb \
  --entrypoint "ruby" "${IMAGE_NAME}" \
  /src/hello-world.rb \
  | grep "Hello World"
