#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TMPDIR=$(mktemp -d --tmpdir=$SCRIPT_DIR)

# Create a test cluster.
export CLUSTER_NAME=cilium-test
k3d cluster create $CLUSTER_NAME \
    --kubeconfig-switch-context=false \
    --config $SCRIPT_DIR/k3d.yaml

function cleanup() {
    set +e
    rm -rfv $TMPDIR
    # Clean up the cluster for local runs even in case of failures.
    # For CI we want it around for diagnostics.
    if [ -z "$CI" ]; then
        k3d cluster delete $CLUSTER_NAME
    fi
    kill $PORT_FORWARD_PID &>/dev/null
}
trap cleanup EXIT

# Attempt to copy out the registries.yaml file from the K3s cluster
# in the active context. If it doesn't exist, that's fine.
node=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
docker cp -q $node:/etc/rancher/k3s/registries.yaml $TMPDIR || true
# If we have a registries.yaml file, copy it to our nodes.
if [ -f "$TMPDIR/registries.yaml" ]; then
    for node in $(kubectl get --context=k3d-$CLUSTER_NAME nodes -o jsonpath='{.items[*].metadata.name}'); do
        echo "Configuring pull creds for $node"
        docker cp -q $TMPDIR/registries.yaml $node:/etc/rancher/k3s/registries.yaml
    done
fi
# Restart the cluster to pickup the pull credentials
k3d cluster stop $CLUSTER_NAME
k3d cluster start $CLUSTER_NAME

# These settings come from
# https://docs.cilium.io/en/latest/installation/rancher-desktop/#configure-rancher-desktop
for node in $(kubectl get --context=k3d-$CLUSTER_NAME nodes -o jsonpath='{.items[*].metadata.name}'); do
    echo "Configuring mounts for $node"
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
    --helm-set hubble.relay.enabled=true \
    --helm-set hubble.ui.enabled=true \
    --helm-set image.override=$AGENT_IMAGE \
    --helm-set hubble.relay.image.override=$HUBBLE_RELAY_IMAGE \
    --helm-set hubble.ui.frontend.image.override=$HUBBLE_UI_IMAGE \
    --helm-set hubble.ui.backend.image.override=$HUBBLE_UI_BACKEND_IMAGE \
    --helm-set operator.image.override=$OPERATOR_IMAGE

$TMPDIR/cilium status --context k3d-$CLUSTER_NAME --wait

QUAY_IMAGES=$($TMPDIR/cilium status --context k3d-$CLUSTER_NAME -o json | grep quay.io || true )
if [ -n "$QUAY_IMAGES" ]; then
    echo "error: quay.io images were pulled, but should have been overridden"
    echo "$QUAY_IMAGES"
    exit 1
fi

# Run the network connectivity test suite
$TMPDIR/cilium connectivity test --context k3d-$CLUSTER_NAME \
    `# Use 8.8.8.8 and 8.8.4.4 because the default IPs` \
    `# 1.1.1.1 and 1.0.0.1 are usually blocked by firewalls` \
    --external-cidr 8.0.0.0/8 \
    --external-ip 8.8.8.8 \
    --external-other-ip 8.8.4.4 \
    --test \!no-unexpected-packet-drops

# Test the hubble UI
kubectl --context k3d-$CLUSTER_NAME create configmap cypress --from-file $SCRIPT_DIR/cypress
kubectl --context k3d-$CLUSTER_NAME apply -f $SCRIPT_DIR/cypress.yaml
kubectl --context k3d-$CLUSTER_NAME wait \
    --for=condition=complete \
    --timeout=5m \
    job/cypress

# Clean up
k3d cluster delete $CLUSTER_NAME
rm -rf $TMPDIR
