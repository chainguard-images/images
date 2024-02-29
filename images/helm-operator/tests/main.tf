terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name  = "helm-operator-${random_pet.suffix.id}"
  chart = "https://bsgrigorov.github.io/helm-operator/helm-operator-0.0.2.tgz"

  values = [
    jsonencode({
      image = {
        operator   = "bsgrigorov/helm-operator"
        pullPolicy = "Always"
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
