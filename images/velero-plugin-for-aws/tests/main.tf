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

variable "init_container_name" {
  description = "Init container name to override"
  default     = "testing-velero-plugin-for-aws:unused"
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
  source = "../../velero/tests/libs/install/cli"

  digests = var.digests

  plugins = [
    var.digests["velero-plugin-for-aws"],
  ]
}

resource "imagetest_feature" "basic" {
  harness     = module.cluster_harness.harness
  name        = "Basic"
  description = "Basic functionality of the velero helm chart."

  steps = [
    {
      name = "Install velero with the cli"
      cmd  = module.velero_cli_install.cmd
    },
    {
      name = "Basic smoke test that providers install"
      cmd  = "$WORK/docker-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
