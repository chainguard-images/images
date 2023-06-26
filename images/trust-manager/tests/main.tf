terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

resource "helm_release" "trust-manager" {
  name       = "trust-manager-${random_pet.suffix.id}"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "trust-manager"

  set {
    name  = "image.repository"
    value = element(split("@", var.digest), 0)
  }
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
}
