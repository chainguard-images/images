terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "melange" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "melange"
}

module "test" {
  source            = "./tests"
  digest            = module.melange.image_ref
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags = {
    "latest"     = module.melange.image_ref
    "latest-dev" = module.melange.dev_ref
  }
}
