#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

cat > hello-world-with-openssl.rb <<EOF
# httparty.rb
require 'httparty'

response = HTTParty.get('https://example.com')
puts response.body if response.code == 200
EOF

TMP=$(mktemp -d)
chmod 777 "${TMP}"

docker run --rm -v $(pwd)/hello-world-with-openssl.rb:/src/hello-world-with-openssl.rb \
                -v "${TMP}:/tmp" \
                --entrypoint gem   \
                "${IMAGE_NAME}" "install" "httpparty" --install-dir  /tmp


docker run --rm  -v $(pwd)/hello-world-with-openssl.rb:/src/hello-world-with-openssl.rb \
                 -v "${TMP}:/tmp" \
                 -e GEM_PATH=/tmp \
                --entrypoint ruby   \
                  "${IMAGE_NAME}" "/src/hello-world-with-openssl.rb"  | grep "<h1>Example Domain</h1>"
