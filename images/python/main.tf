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
  extra_dev_packages = [
    "build-base",
    "py3-pip",
    "python3-dev",
    "uv"
  ]
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  target_repository = var.target_repository
  name              = "python-latest-prod"
}

module "test-latest-dev" {
  source            = "./tests"
  check-dev         = true # Check for PIP in dev variants.
  digest            = module.latest.dev_ref
  prod_digest       = module.latest.image_ref
  target_repository = var.target_repository
  name              = "python-latest-dev"
}

module "tagger" {
  depends_on = [module.test-latest, module.test-latest-dev]
  source     = "../../tflib/tagger"
  tags = {
    "latest"     = module.latest.image_ref
    "latest-dev" = module.latest.dev_ref
  }
}
