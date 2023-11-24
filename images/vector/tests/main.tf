terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "vector" {
  name       = "vector"
  repository = "https://helm.vector.dev"
  chart      = "vector"

  values = [jsonencode({
    localpv = {
      image = {
        registry   = join("", [data.oci_string.ref.registry, "/"])
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.vector.id
}
