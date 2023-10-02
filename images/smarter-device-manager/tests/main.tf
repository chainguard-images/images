terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "server" {
  digest = var.digest
  script = "${path.module}/01-docker.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "smarter-device-manager-${random_pet.suffix.id}" # The Helm release name
  repository = "https://charts.gabe565.com"                    # The Helm repo URL
  chart      = "smarter-device-manager"                # The Chart to install

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
