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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

module "crossplane_harness" {
  source = "../../crossplane/tests/harness/"

  tests_path = path.module
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"

  values = {
    image = {
      repository = local.parsed["crossplane"].registry_repo
      tag        = local.parsed["crossplane"].pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = module.crossplane_harness.harness
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
