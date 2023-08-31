terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "tigera-operator" {
  name = "tigera-operator"

  repository       = "https://projectcalico.docs.tigera.io/charts"
  chart            = "tigera-operator"
  namespace        = "tigera-operator"
  create_namespace = true

  values = [jsonencode({
    tigeraOperator = {
      version  = data.oci_string.ref.pseudo_tag
      image    = data.oci_string.ref.repo
      registry = data.oci_string.ref.registry
    }
  })]
}

data "oci_exec_test" "install-calico" {
  depends_on = [resource.helm_release.tigera-operator]
  digest     = var.digest // Unused, but required by the data source.
  script     = "${path.module}/install-calico.sh"

  env {
    name  = "CALICO_NODE_DIGEST"
    value = data.oci_ref.calico["node"].digest
  }
  env {
    name  = "CALICO_CNI_DIGEST"
    value = data.oci_ref.calico["cni"].digest
  }
  env {
    name  = "CALICO_KUBE_CONTROLLERS_DIGEST"
    value = data.oci_ref.calico["kube-controllers"].digest
  }
  env {
    name  = "CALICO_CSI_DIGEST"
    value = data.oci_ref.calico["csi"].digest
  }
  env {
    name  = "CALICO_TYPHA_DIGEST"
    value = data.oci_ref.calico["typha"].digest
  }
  env {
    name  = "CALICO_POD2DAEMON_FLEXVOL_DIGEST"
    value = data.oci_ref.calico["pod2daemon-flexvol"].digest
  }
  env {
    name  = "CALICO_NODE_DRIVER_REGISTRAR_DIGEST"
    value = data.oci_ref.calico["node-driver-registrar"].digest
  }
}

locals {
  calico_images = [
    "node",
    "kube-controllers",
    "cni",
    "csi",
    "typha",
    "pod2daemon-flexvol",
    "node-driver-registrar",
  ]
}

data "oci_ref" "calico" {
  for_each = toset(local.calico_images)
  ref      = "cgr.dev/chainguard/calico-${each.value}"
}
