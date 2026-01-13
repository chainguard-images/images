terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  main_package      = "wait-for-it"
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = {
    "latest" = module.latest.image_ref
  }
}
