#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

k3d cluster create cilium-test \
    --kubeconfig-switch-context=false \
    --config $SCRIPT_DIR/k3d.yaml

# These settings come from
# https://docs.cilium.io/en/latest/installation/rancher-desktop/#configure-rancher-desktop
for node in $(kubectl --context=k3d-cilium-test get nodes -o jsonpath='{.items[*].metadata.name}'); do
    echo "Configuring node $node"
    docker exec -i $node /bin/sh <<-EOF
        mount bpffs -t bpf /sys/fs/bpf
        mount --make-shared /sys/fs/bpf
        mkdir -p /run/cilium/cgroupv2
        mount -t cgroup2 none /run/cilium/cgroupv2
        mount --make-shared /run/cilium/cgroupv2/
EOF
done
