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

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name             = "qdrant-${random_pet.suffix.id}"
  namespace        = "qdrant-${random_pet.suffix.id}"
  repository       = "https://qdrant.to/helm"
  chart            = "qdrant"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
      readinessProbe = {
        enabled = false
      }
      startupProbe = {
        enabled = true
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
