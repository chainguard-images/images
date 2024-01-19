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
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
