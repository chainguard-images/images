#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP=$(mktemp -d)

cat > $TMP/hello-world-dockerfile.rb <<EOF
# Exercise the gem
gem 'chronic', '~>0.6'
require 'chronic'

puts "Hello World. It is " + Chronic.parse('today').to_s
EOF

# The image can be used as a base image.
cat > $TMP/Dockerfile <<EOF
FROM ${IMAGE_NAME}
RUN ["gem", "install", "chronic", "--user-install"]

COPY ./hello-world-dockerfile.rb /home/nonroot/hello-world.rb

ENTRYPOINT ["ruby", "/home/nonroot/hello-world.rb"]
EOF

# Using registry.local:5000 as the FROM in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

docker build -t hello-gem $TMP/
docker run --rm hello-gem | grep "Hello World"
