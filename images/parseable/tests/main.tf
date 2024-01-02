terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./test.sh"
  working_dir = path.module
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name             = "parseable-${random_pet.suffix.id}"
  namespace        = "parseable-${random_pet.suffix.id}"
  repository       = "https://charts.parseable.io"
  chart            = "parseable"
  create_namespace = true

  values = [
    jsonencode({
      parseable = {
        image = {
          repository = data.oci_string.ref.registry_repo
          tag        = data.oci_string.ref.pseudo_tag
        }
        local = true
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
