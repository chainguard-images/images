terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "./config"
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.config.config
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  target_repository = var.target_repository
}

resource "oci_tag" "latest" {
  digest_ref = module.latest.image_ref
  tag        = "latest"
  depends_on = [module.test-latest]
}
