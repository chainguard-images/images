terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  php_version = "php-8.4"
  source      = "./config"
}

module "latest" {
  config            = module.config.config
  main_package      = "wordpress"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  build-dev         = true
}

module "test-latest" {
  digest            = module.latest.image_ref
  source            = "./tests"
  target_repository = var.target_repository
}

module "test-latest-dev" {
  digest            = module.latest.dev_ref
  source            = "./tests"
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test-latest, module.test-latest-dev]
  source     = "../../tflib/tagger"
  tags = {
    "latest"     = module.latest.image_ref
    "latest-dev" = module.latest.dev_ref
  }
}
