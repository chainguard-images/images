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
    calicoctl             = string
    cni                   = string
    kube-controllers      = string
    csi                   = string
    typha                 = string
    node-driver-registrar = string
  })
}

data "oci_exec_test" "install" {
  digest = var.digests["node"]
  script = "${path.module}/install.sh"

  env {
    name  = "NODE_IMAGE"
    value = var.digests["node"]
  }
  env {
    name  = "CNI_IMAGE"
    value = var.digests["cni"]
  }
  env {
    name  = "KUBE_CONTROLLERS_IMAGE"
    value = var.digests["kube-controllers"]
  }
  env {
    name  = "CSI_IMAGE"
    value = var.digests["csi"]
  }
  env {
    name  = "TYPHA_IMAGE"
    value = var.digests["typha"]
  }
  env {
    name  = "CSI_NODE_DRIVER_REGISTRAR_IMAGE"
    value = var.digests["node-driver-registrar"]
  }
}
