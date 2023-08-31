#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP="$(mktemp -d)"
pushd "${TMP}"

# Ever since
# https://github.com/projectcalico/calico/commit/3fb6b37f2c39fdc732d09167d207465d512fe68b,
# calico runs a `mount-bpffs` container on `calico-node` startup that attempts
# to set up a bpfs mount at /sys/fs. Even though it has `-best-effort`, this
# fails in k3d because of the way docker bind mounts inherit the host
# permissions by default. This results with a weird docker in docker only error
# traced back to the way /sys is mounted. To work around this, we simply mark
# the whole /sys mount as rshared. This is the same way kind gets around this
# in their custom entrypoint startup script, but k3d currently support custom
# entrypoint scripts so we hack it in here, until a future time where we can
# bake this in.
#
# Several references for the next poor soul: -
# https://github.com/docker/for-mac/issues/4454 -
# https://github.com/kubernetes-sigs/kind/blob/c13c54b9564aed8bc4f28b90af20a1100da66963/images/base/files/usr/local/bin/entrypoint#L53-L62
for name in $(docker ps --format '{{.Names}}'); do
	if [[ $name =~ k3d-.*-(server|agent)- ]]; then
		docker exec $name mount -o remount,ro /sys
		docker exec $name mount --make-rshared /
	fi
done

# This installs calico node, kube-controllers, and typha.
curl -o calico-typha.yaml https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico-typha.yaml
sed -i.bak "s|docker.io/calico/cni:.*|${CNI_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/node:.*|${NODE_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/kube-controllers:.*|${KUBE_CONTROLLERS_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/typha:.*|${TYPHA_IMAGE}|g" calico-typha.yaml
kubectl apply -f calico-typha.yaml

curl -o calico-csi.yaml https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/csi-driver.yaml
sed -i.bak "s|docker.io/calico/csi:.*|${CSI_IMAGE}|g" calico-csi.yaml
sed -i.bak "s|docker.io/calico/node-driver-registrar:.*|${CSI_NODE_DRIVER_REGISTRAR_IMAGE}|g" calico-csi.yaml
kubectl apply -f calico-csi.yaml

kubectl rollout status daemonset calico-node -n kube-system --timeout 60s
kubectl rollout status deployment calico-kube-controllers -n kube-system --timeout 60s
kubectl rollout status deployment calico-typha -n kube-system --timeout 60s
kubectl rollout status daemonset csi-node-driver -n calico-system --timeout 60s
