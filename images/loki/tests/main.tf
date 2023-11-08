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

resource "helm_release" "loki" {
  name = "loki"

  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki"

  values = [jsonencode({
    loki = {
      commonConfig = {
        replication_factor = 1
      }
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
      storage = {
        type = "filesystem"
      }
    }
    singleBinary = {
      replicas   = 1
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.loki.id
}
