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

data "oci_exec_test" "startup" {
  digest = var.digest
  script = "${path.module}/startup.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "fluent-bit" {
  name = "fluent-bit-${random_pet.suffix.id}"

  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.fluent-bit.id
}
