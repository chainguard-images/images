#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v3.26.1
spec:
  images:
    - image: calico/cni
      digest: ${CALICO_CNI_DIGEST}
    - image: calico/node
      digest: ${CALICO_NODE_DIGEST}
    - image: calico/kube-controllers
      digest: ${CALICO_KUBE_CONTROLLERS_DIGEST}
    - image: calico/pod2daemon-flexvol
      digest: ${CALICO_POD2DAEMON_FLEXVOL_DIGEST}
    - image: calico/csi
      digest: ${CALICO_CSI_DIGEST}
    - image: calico/typha
      digest: ${CALICO_TYPHA_DIGEST}
    - image: calico/node-driver-registrar
      digest: ${CALICO_NODE_DRIVER_REGISTRAR_DIGEST}
    # This isn't used on Linux, it just needs to have a value.
    - image: calico/windows-upgrade
      digest: sha256:0000000000000000000000000000000000000000000000000000000000000000
EOF

cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
  registry: cgr.dev
  imagePath: chainguard
  imagePrefix: calico-
EOF

kubectl wait --for=condition=ready pod -n calico-system --all --timeout 120s
