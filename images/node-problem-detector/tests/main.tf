terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "node-problem-detector" {
  name             = "node-problem-detector"
  repository       = "https://charts.deliveryhero.io/"
  chart            = "node-problem-detector"
  namespace        = "node-problem-detector"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.node-problem-detector.id
  namespace = helm_release.node-problem-detector.namespace
}
