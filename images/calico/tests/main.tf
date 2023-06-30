terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    node      = string
    calicoctl = string
  })
}

data "oci_exec_test" "helm" {
  digest = var.digests["node"]
  script = "${path.module}/helm.sh"
}
