terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "harbor" {
  name             = "harbor-${random_pet.suffix.id}"
  namespace        = "harbor-core-${random_pet.suffix.id}"
  repository       = "https://helm.goharbor.io"
  chart            = "harbor"
  create_namespace = true

  values = [jsonencode({
    core = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.harbor.id
  namespace = helm_release.harbor.namespace
}
