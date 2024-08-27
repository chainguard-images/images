terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module

  envs = {
    "IMAGE_NAME" = var.digest
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "proxysql"
  namespace = "proxysql"
  git_repo  = "https://github.com/dysnix/charts.git"
  chart     = "dysnix/proxysql"
  patches   = ["$WORK/0001-remove-tag-as-annotation.patch"]

  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      tag        = local.parsed.pseudo_tag
    }
  }
}
