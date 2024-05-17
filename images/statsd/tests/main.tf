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

resource "helm_release" "helm" {
  name             = "statsd-${random_pet.suffix.id}"
  namespace        = "statsd-${random_pet.suffix.id}"
  repository       = "https://keyporttech.github.io/helm-charts"
  chart            = "statsd"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
