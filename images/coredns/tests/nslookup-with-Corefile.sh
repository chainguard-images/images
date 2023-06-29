#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Don't use $(mktemp -d) since GHA doesn't like volume mounting tmpdir
TMPDIR="coredns-$FREE_PORT"
mkdir -p "$TMPDIR"

# Create a temporary file for stdout & stderr on txt record lookup
tmp_file=$TMPDIR/tmp_file
touch "$tmp_file"

cleanup() {
	rm -rf "$TMPDIR"
	rm -rf "$tmp_file"
}

trap cleanup EXIT

# Create Corefile
cat >$TMPDIR/Corefile <<EOF
.:53 {
    forward . 8.8.8.8 1.1.1.1
    log
    errors
    health
}

labs.hello.db.:53 {
    log
    errors
    health
    file /etc/master.db
}
EOF

# Create dummy A, CNAME, TXT record entries
cat >$TMPDIR/master.db <<EOF
labs.hello.db.              IN  SOA    dns.labs.hello.db. admin.labs.hello.db. 1675303881 7200 3600 1209600 3600
dns.labs.hello.db.          IN  A      192.168.1.3
node.labs.hello.db.         IN  A      192.168.1.10
mgmt.dns.labs.hello.db.     IN  CNAME  dns.labs.hello.db.
mgmt.node.labs.hello.db.    IN  CNAME  node.labs.hello.db.
dns.labs.hello.db.          IN  TXT    "Hello from dummy DNS server"
node.labs.hello.db.         IN  TXT    "Hello from dummy node"
EOF

# TODO: Check if nslookup is available on the host and if not, install it

# Run coredns with host port mapped to open port (only UDP needed here)
container_name="testing-coredns-txt-lookup-$FREE_PORT"
# Change the default sysctl to check that the binary has the
# appropriate "setcap" configured properly.
docker run --sysctl net.ipv4.ip_unprivileged_port_start=100 --name "${container_name}" -v "$(pwd)/${TMPDIR}":/etc -p $FREE_PORT:53/udp "${IMAGE_NAME}" -conf=/etc/Corefile -dns.port=53 &

# Coredns doesn't have any built in health check functions or API, so wait a moment for the docker container to become ready
sleep 5
# Do a txt record lookup and output stdout/stderr to temp file
nslookup -port=$FREE_PORT -q=TXT node.labs.hello.db 127.0.0.1 >"${tmp_file}" 2>&1

docker stop "${container_name}"
# Actually let's force removal no matter what
docker rm -f "${container_name}"

# And check the temporary file to confirm the lookup was successful and logged
lookup_text="Hello from dummy node"
if ! grep -q "${lookup_text}" "${tmp_file}"; then
	exit 1
fi
