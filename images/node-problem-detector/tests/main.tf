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

resource "helm_release" "node-problem-detector" {
  name             = "npd-${random_pet.suffix.id}"
  repository       = "https://charts.deliveryhero.io/"
  chart            = "node-problem-detector"
  namespace        = "npd-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}
