terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digests to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module

  envs = {
    "IMAGE_REGISTRY"   = local.parsed.registry
    "IMAGE_REPOSITORY" = local.parsed.repo
    "IMAGE_TAG"        = local.parsed.pseudo_tag
  }
}

module "velero_cli_install" {
  source = "../../velero/tests/libs/install/cli"

  digests = {
    velero                = var.digest
    velero-plugin-for-aws = provider::oci::get("cgr.dev/chainguard/velero-plugin-for-aws:latest").full_ref
  }
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
      name = "Basic smoke test that the restore helper works"
      cmd  = "$WORK/docker-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
