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

resource "helm_release" "stakater-reloader" {
  name = "stakater-reloader-${random_pet.suffix.id}"

  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"

  namespace        = "stakater-reloader-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    reloader = {
      deployment = {
        image = {
          tag  = data.oci_string.ref.pseudo_tag
          name = data.oci_string.ref.registry_repo
        }
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.stakater-reloader.id
  namespace = helm_release.stakater-reloader.namespace
}
