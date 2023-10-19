#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TMPDIR=$(mktemp -d --tmpdir=$SCRIPT_DIR)

# Create a test cluster.
export CLUSTER_NAME=cilium-test
k3d cluster create $CLUSTER_NAME \
    --kubeconfig-switch-context=false \
    --config $SCRIPT_DIR/k3d.yaml

cleanup() {
    rm -rfv $TMPDIR
    # Clean up the cluster for local runs even in case of failures.
    # For CI we want it around for diagnostics.
    if [ -z "$CI" ]; then
        k3d cluster delete $CLUSTER_NAME
    fi
}

trap cleanup EXIT

# These settings come from
# https://docs.cilium.io/en/latest/installation/rancher-desktop/#configure-rancher-desktop
for node in $(kubectl get --context=k3d-$CLUSTER_NAME nodes -o jsonpath='{.items[*].metadata.name}'); do
    echo "Configuring node $node"
    docker exec -i $node /bin/sh <<-EOF
        mount bpffs -t bpf /sys/fs/bpf
        mount --make-shared /sys/fs/bpf
        mkdir -p /run/cilium/cgroupv2
        mount -t cgroup2 none /run/cilium/cgroupv2
        mount --make-shared /run/cilium/cgroupv2/
EOF
done


# Download the cilium CLI
pushd $TMPDIR
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
# These use the platform passed into Docker. It's still better to let Go
# translate that into its format than do any Bash-based translation here.
GOOS=$(go env GOOS || docker run cgr.dev/chainguard/go env GOOS)
GOARCH=$(go env GOARCH || docker run cgr.dev/chainguard/go env GOARCH)
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-${GOOS}-${GOARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-${GOOS}-${GOARCH}.tar.gz.sha256sum
tar -xzvf cilium-${GOOS}-${GOARCH}.tar.gz
rm cilium-${GOOS}-${GOARCH}.tar.gz{,.sha256sum}

# Install cilium
$TMPDIR/cilium install --context k3d-$CLUSTER_NAME \
    --helm-set image.override=$AGENT_IMAGE \
    --helm-set operator.image.override=$OPERATOR_IMAGE

# Verify the installation
#
# Note: the cilium connectivity test is highly dependent on network setup
#       on the host (see https://github.com/cilium/cilium-cli/issues/673),
#       so we don't run it here (yet).
$TMPDIR/cilium status --context k3d-$CLUSTER_NAME --wait

# Clean up
k3d cluster delete $CLUSTER_NAME
rm -rf $TMPDIR
