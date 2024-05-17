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

data "oci_exec_test" "healthy" {
  digest = var.digest
  script = "${path.module}/02-healthy.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "prometheus_community_pushgateway" {
  name             = "pushgateway-${random_pet.suffix.id}"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus-pushgateway"
  namespace        = "pushgateway-system-${random_pet.suffix.id}"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
      service = {
        type = "ClusterIP"
      }
    }),
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.prometheus_community_pushgateway.id
  namespace = helm_release.prometheus_community_pushgateway.namespace
}
