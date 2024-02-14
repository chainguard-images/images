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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]

    envs = {
      "AZURE_DIGEST"           = var.digests.family
      "AUTHORIZATION_DIGEST"   = var.digests.authorization
      "MANAGEDIDENTITY_DIGEST" = var.digests.managedidentity
      "SQL_DIGEST"             = var.digests.sql
      "STORAGE_DIGEST"         = var.digests.storage
    }
  }
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"
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
    {
      name = "Something"
      cmd  = "/tests/install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This can take a while since we're working in serial to avoid disk
    # pressure
    create = "15m"
  }
}
