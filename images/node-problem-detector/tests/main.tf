terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "node-problem-detector" {
  name             = "node-problem-detector"
  repository       = "https://charts.deliveryhero.io/"
  chart            = "node-problem-detector"
  namespace        = "node-problem-detector"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.node-problem-detector.id
  namespace = helm_release.node-problem-detector.namespace
}
