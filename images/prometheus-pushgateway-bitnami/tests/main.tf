terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

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
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
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
