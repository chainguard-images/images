terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    node                  = string
    cni                   = string
    kube-controllers      = string
    pod2daemon            = string
    csi                   = string
    typha                 = string
    node-driver-registrar = string
    calicoctl             = string
  })
}

data "oci_string" "image" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "calico"
  inventory = data.imagetest_inventory.this

  # Disable k3s' builtin (flannel) so we can later use the installed calico as the CNI
  disable_cni = true
}

module "tigera-operator" {
  source = "../../tigera-operator/tests/helm"
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Basic functionality of calico as a cni"

  steps = [
    {
      name = "Install tigera-operator"
      cmd  = module.tigera-operator.install_cmd
    },
    {
      name = "Install calico"
      # NOTE: The name of the ImageSet _must_ encode the version of the
      # tigera-operator to test against
      # NOTE: When bumping the tigera-operator version, make sure to check with
      # the ImageSet compatibility, as new images may have been added.
      # ref: https://docs.tigera.io/calico/latest/operations/image-options/imageset#create-an-imageset
      cmd = <<EOF
kubectl apply -f - <<EOm
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v${module.tigera-operator.tigera_version}
spec:
  images:
    - image: calico/node
      digest: ${data.oci_string.image["node"].digest}
    - image: calico/cni
      digest: ${data.oci_string.image["cni"].digest}
    - image: calico/kube-controllers
      digest: ${data.oci_string.image["kube-controllers"].digest}
    - image: calico/pod2daemon-flexvol
      digest: ${data.oci_string.image["pod2daemon"].digest}
    - image: calico/csi
      digest: ${data.oci_string.image["csi"].digest}
    - image: calico/typha
      digest: ${data.oci_string.image["typha"].digest}
    - image: calico/node-driver-registrar
      digest: ${data.oci_string.image["node-driver-registrar"].digest}
EOm

kubectl apply -f - <<EOm
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
  registry: ${data.oci_string.image["node"].registry}
  imagePath: ${split("/", data.oci_string.image["node"].repo)[0]}
  imagePrefix: calico-
EOm

kubectl wait --for=condition=Ready --timeout=5m installation default
      EOF
    },
    {
      # This means the our calico installation successfully registered itself
      # as a suitable CNI, and was used to create the network sandboxing for
      # the previously pending system pods.
      name = "Check that system pods get created with calico as the CNI"
      cmd  = <<EOF
kubectl wait --for=condition=Ready --timeout=5m pod -n kube-system --all
      EOF
    },
  ]
}
