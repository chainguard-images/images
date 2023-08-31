terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
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

data "oci_exec_test" "install" {
  digest = var.digests["node"]
  script = "${path.module}/install.sh"

  env {
    name  = "REGISTRY"
    value = data.oci_string.image["node"].registry
  }
  env {
    name  = "REPOSITORY"
    value = split("/", data.oci_string.image["node"].repo)[0]
  }

  env {
    name  = "NODE_DIGEST"
    value = data.oci_string.image["node"].digest
  }
  env {
    name  = "CNI_DIGEST"
    value = data.oci_string.image["cni"].digest
  }
  env {
    name  = "KUBE_CONTROLLERS_DIGEST"
    value = data.oci_string.image["kube-controllers"].digest
  }
  env {
    name  = "POD2DAEMON_FLEXVOL_DIGEST"
    value = data.oci_string.image["pod2daemon"].digest
  }
  env {
    name  = "CSI_DIGEST"
    value = data.oci_string.image["csi"].digest
  }
  env {
    name  = "TYPHA_DIGEST"
    value = data.oci_string.image["typha"].digest
  }
  env {
    name  = "NODE_DRIVER_REGISTRAR_DIGEST"
    value = data.oci_string.image["node-driver-registrar"].digest
  }
}
