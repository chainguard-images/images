
start_detached() {
  # Find an unused tcp port (http)
  port_num=8080
  i=49152; while [ $i -ne 65535 ]; do
    if netstat -tln | grep :$i >/dev/null; then
      i=$(($i+1))
    else
      port_num=$i; break
    fi
  done


  # cookie-secret: Randomly generated (head -c32 /dev/urandom | base64), required by API but no functional utility here
  # redirect-url: Oauth application's callback url
  # upstream-file: Target of redirect
  docker run --detach -p $port_num:$port_num "${IMAGE_NAME}" \
    --cookie-secure=false \
    --cookie-secret=RYC2VBUYWQ6aenOkoN6jELQsrjtmwb23a7NdtrLI0ao= \
    --upstream=file:///dev/null \
    --http-address=0.0.0.0:$port_num \
    --redirect-url=http://localhost:${port_num}/oauth2/callback \
    --client-id=dummy-id \
    --client-secret=dummy-secret \
    --email-domain="*" \
    --provider=github \
    --scope=user:email
  sleep 2
}

TEST_kill_signal() {
  local -r signal="${1}"

  echo "${signal} Testing"
  local -r container_id=$(start_detached)

  # Attempt to kill the container with the specified signal
  docker kill "${container_id}" --signal "${signal}"

  # Wait for the container to die
  sleep 5

  # Check if container is still running
  # NOTE: The `grep` needs to be inside the conditional so it doesn't fail the
  #       script due to the `-o pipefail`
  if [ "$(docker ps --no-trunc | grep "${container_id}" | wc -l)" -ne "0" ]; then
    docker ps --no-trunc
    echo "${signal} Failed"
    exit 1;
  fi
  echo "${signal} Success"
}

TEST_kill_signal "SIGTERM"
TEST_kill_signal "SIGKILL"
