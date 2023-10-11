#!/usr/bin/env bash

#set -o errexit -o nounset -o errtrace -o pipefail -x
set -o errexit -o nounset -o errtrace -o pipefail

# A complete e2e test would need GitHub (or other provider) account, trusted domain, and  oauth app.
# This is a heavy setup lift (and IMO shouldn't be in the scope of one single test anyway) so here
# I am testing only that the proxy does in fact intercept a call to a specified endpoint to demand
# auth (but am not verifying successful auth and redirect)

container_name="testing-oauth2-redirect-interception"

# cookie-secret: Randomly generated (head -c32 /dev/urandom | base64), required by API but no functional utility here
# redirect-url: Oauth application's callback url
# upstream-file: Target of redirect
docker run --detach --name "${container_name}" -p ${FREE_PORT}:${FREE_PORT} "${IMAGE_NAME}" \
  --cookie-secure=false \
  --cookie-secret=RYC2VBUYWQ6aenOkoN6jELQsrjtmwb23a7NdtrLI0ao= \
  --upstream=file:///dev/null \
  --http-address=0.0.0.0:${FREE_PORT} \
  --redirect-url=http://localhost:${FREE_PORT}/oauth2/callback \
  --client-id=dummy-id \
  --client-secret=dummy-secret \
  --email-domain="*" \
  --provider=github \
  --scope=user:email
trap 'docker rm -f "${container_name}"' ERR


# Give the container sixty seconds to create and configure
# timeout function may not be available on infra, so until check + install is added we'll do manually
lookup_config_text="OAuthProxy configured for GitHub Client ID: dummy-id"
config_text_present=false
for i in {1..60}; do
  if ! docker logs "${container_name}" | grep -i "${lookup_config_text}"; then
    sleep 1;
  else
    config_text_present=true; break;
  fi
done
if ! "${config_text_present}"; then exit 1; fi


# curl the redirect url and confirm proxy intercepts request to demand GitHub auth
tmp_file=$(mktemp)

curl "http://localhost:${FREE_PORT}" -o "${tmp_file}"
lookup_intercept_text="Sign in with GitHub"
if ! grep -q "${lookup_intercept_text}" "${tmp_file}"; then
  exit 1
fi


# Force container removal
docker rm -f "${container_name}"

rm "${tmp_file}"
