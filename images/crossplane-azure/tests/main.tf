terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    family          = string
    authorization   = string
    managedidentity = string
    sql             = string
    storage         = string
  })
}

module "crossplane_harness" {
  source = "../../crossplane/tests/harness/"

  tests_path = path.module

  envs = {
    "AZURE_DIGEST"           = var.digests.family
    "AUTHORIZATION_DIGEST"   = var.digests.authorization
    "MANAGEDIDENTITY_DIGEST" = var.digests.managedidentity
    "SQL_DIGEST"             = var.digests.sql
    "STORAGE_DIGEST"         = var.digests.storage
  }
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"
}

resource "imagetest_feature" "basic" {
  harness     = module.crossplane_harness.harness
  name        = "Basic"
  description = "Basic functionality of the crossplane-azure images."

  steps = [
    {
      name = "Install crossplane",
      cmd  = module.helm_crossplane.install_cmd
    },
    {
      name = "Basic smoke test that providers install"
      cmd  = "/tests/install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This can take a while since we're working in serial to avoid disk
    # pressure
    create = "20m"
  }
}
