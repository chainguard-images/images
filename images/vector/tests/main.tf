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
  repository       = "https://helm.vector.dev"
  name             = "vector"
  chart            = "vector"
  namespace        = "vector-namespace"
  create_namespace = true
  timeout          = 120

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = "0.34.1"
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.vector.id
  namespace = helm_release.vector.namespace
}
