terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "kubewatch" {
  name = "kubewatch"

  repository = "https://robusta-charts.storage.googleapis.com"
  chart      = "kubewatch"

  namespace        = "kubewatch"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
    }),
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kubewatch.id
  namespace = helm_release.kubewatch.namespace
}
