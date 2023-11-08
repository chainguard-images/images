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

resource "helm_release" "atlantis" {
  name             = "runatlantis-${random_pet.suffix.id}"
  namespace        = "runatlantis-system-${random_pet.suffix.id}"
  repository       = "https://runatlantis.github.io/helm-charts"
  chart            = "atlantis"
  create_namespace = true
  timeout          = 600

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
      pullPolicy = "Always"
    }
  })]

  set {
    name  = "github.user"
    value = "not_used_tacocat_user"
  }

  set {
    name  = "github.token"
    value = "not_used_tacocat_token"
  }

  set {
    name  = "github.secret"
    value = "not_used_tacocat_shhhh"
  }

  set {
    name  = "orgAllowlist"
    value = "not_used_tacocat_user"
  }
}

module "helm_cleanup_atlantis" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.atlantis.id
  namespace = helm_release.atlantis.namespace
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME version"
}
