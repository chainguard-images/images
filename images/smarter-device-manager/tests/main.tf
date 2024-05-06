terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "server" {
  digest = var.digest
  script = "${path.module}/01-docker.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "smarter-device-manager-${random_pet.suffix.id}"
  repository = "https://charts.gabe565.com"
  chart      = "smarter-device-manager"

  values = [jsonencode({
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
