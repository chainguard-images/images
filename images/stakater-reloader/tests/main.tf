terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

resource "helm_release" "stakater-reloader" {
  name = "stakater-reloader-${random_pet.suffix.id}"

  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"

  namespace        = "stakater-reloader-${random_pet.suffix.id}"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "reloader.deployment.image.tag"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
  set {
    name  = "reloader.deployment.image.name"
    value = element(split("@", var.digest), 0)
  }
}
