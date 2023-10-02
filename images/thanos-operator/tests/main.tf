terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "thanos-operator" {
  name             = "thanos-operator"
  repository       = "https://kubernetes-charts.banzaicloud.com"
  chart            = "thanos-operator"
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
  name      = helm_release.thanos-operator.id
  namespace = helm_release.thanos-operator.namespace
}
