terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "velero" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config

  build-dev = true

}

locals {
  velero-plugin-for-aws = provider::oci::get("cgr.dev/chainguard/velero-plugin-for-aws:latest")
}

module "test" {
  source = "./tests"
  digests = {
    velero                = module.velero.image_ref
    velero-plugin-for-aws = local.velero-plugin-for-aws.full_ref
  }
  target_repository = var.target_repository
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.velero.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.velero.dev_ref
  tag        = "latest-dev"
}

