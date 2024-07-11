terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    velero                = string
    velero-plugin-for-aws = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "velero_cli_install" {
  source = "./libs/install/cli"

  digests = var.digests

  plugins = [
    var.digests["velero-plugin-for-aws"],
  ]
}

resource "imagetest_feature" "basic" {
  harness     = module.cluster_harness.harness
  name        = "Basic"
  description = "Basic functionality of velero."

  steps = [
    {
      name = "Install velero with the cli"
      cmd  = module.velero_cli_install.cmd
    },
    {
      name = "Basic smoke test that providers install"
      cmd  = "$WORK/docker-test.sh"
    },
    {
      name = "Basic smoke test that csi plugin works install"
      cmd  = "$WORK/csi-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
