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
  name             = "falcosidekick-${random_pet.suffix.id}"
  namespace        = "falcosidekick-${random_pet.suffix.id}"
  repository       = "https://falcosecurity.github.io/charts/"
  chart            = "falcosidekick"
  create_namespace = true

  values = [
    jsonencode({
      containerName = "falcosidekick"
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
