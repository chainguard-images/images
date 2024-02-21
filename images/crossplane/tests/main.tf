terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    crossplane = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane"
  inventory = data.imagetest_inventory.this
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"

  values = {
    image = {
      repository = data.oci_string.ref["crossplane"].registry_repo
      tag        = data.oci_string.ref["crossplane"].pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Install crossplane",
      cmd  = module.helm_crossplane.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
