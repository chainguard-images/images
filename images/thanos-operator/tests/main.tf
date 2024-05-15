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

resource "helm_release" "thanos-operator" {
  name             = "thanos-operator"
  repository       = "https://kubernetes-charts.banzaicloud.com"
  chart            = "thanos-operator"
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
  name      = helm_release.thanos-operator.id
  namespace = helm_release.thanos-operator.namespace
}
