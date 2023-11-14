terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "dynamic-localpv-provisioner" {
  name = "dynamic-localpv-provisioner"

  repository = "https://openebs.github.io/dynamic-localpv-provisioner"
  chart      = "localpv-provisioner"

  values = [jsonencode({
    localpv = {
      image = {
        registry   = join("", [data.oci_string.ref.registry, "/"])
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.dynamic-localpv-provisioner.id
}
