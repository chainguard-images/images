terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    node             = string
    calicoctl        = string
    cni              = string
    kube-controllers = string
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
}
