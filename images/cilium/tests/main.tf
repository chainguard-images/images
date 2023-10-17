terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    operator = string
  })
}

data "oci_exec_test" "operator-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.operator
}

# TODO:
# To run this test, we need to create a cluster that looks like this
#
# k3d cluster create -i cgr.dev/chainguard/k3s:latest \
#     --k3s-arg '--disable=traefik@server:*' \
#     --k3s-arg '--disable=metrics-server@server:*' \
#     --k3s-arg '--disable-network-policy@server:*' \
#     --k3s-arg '--flannel-backend=none@server:*' \
#
# for node in k3d-k3s-default-server-0; do
#   docker exec -i $node /bin/sh <<-EOF
#       mount bpffs -t bpf /sys/fs/bpf
#       mount --make-shared /sys/fs/bpf
#       mkdir -p /run/cilium/cgroupv2
#       mount -t cgroup2 none /run/cilium/cgroupv2
#       mount --make-shared /run/cilium/cgroupv2/
#
#
# resource "helm_release" "cilium" {
#   repository       = "https://helm.cilium.io"
#   chart            = "cilium"
#   name             = "cilium"
#   namespace        = "kube-system"

#   values = [jsonencode({
#     operator = {
#       image = {
#         override = var.digests.operator
#       }
#       replicas = 1
#     }
#   })]
# }
