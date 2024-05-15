terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "prometheus-mongodb-exporter-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-mongodb-exporter"

  values = [jsonencode({
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
