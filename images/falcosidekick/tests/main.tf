terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name             = "falcosidekick-${random_pet.suffix.id}"
  namespace        = "falcosidekick"
  repository       = "https://falcosecurity.github.io/charts/"
  chart            = "falcosidekick"
  create_namespace = true

  values = [
    jsonencode({
      containerName = "falcosidekick"
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = "latest"
      }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
