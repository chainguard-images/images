terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "az" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
}

module "test" {
  source = "./tests"
  digest = module.az.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.az.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.az.dev_ref
  tag        = "latest-dev"
}

