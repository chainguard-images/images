terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "cloudwatch-runs" {
  digest      = var.digest
  script      = "./cloudwatch-runs.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "cloudwatch-exporter-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-cloudwatch-exporter"

  namespace        = "prometheus-cloudwatch-exporter"
  create_namespace = true

  set {
    name  = "image.repository"
    value = local.parsed.registry_repo
  }
  set {
    name  = "image.tag"
    value = local.parsed.pseudo_tag
  }
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.test.id
  namespace = helm_release.test.namespace
}
