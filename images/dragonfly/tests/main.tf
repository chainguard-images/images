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

# The helm release includes a health and readiness check
resource "helm_release" "dragonfly" {
  name             = "dragonfly-${random_pet.suffix.id}"
  namespace        = "dragonfly"
  create_namespace = true
  repository       = "oci://ghcr.io/dragonflydb/dragonfly/helm"
  chart            = "dragonfly"
  version          = "v1.15.1"
  timeout          = 600

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.dragonfly.id
  namespace = helm_release.dragonfly.namespace
}
