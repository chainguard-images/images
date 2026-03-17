terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" {
  source = "./config"

  extra_repositories = ["https://apk.cgr.dev/extra-packages"]
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.latest-config.config
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  image_version     = "latest"
  target_repository = var.target_repository
  test_repository   = var.test_repository
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = {
    "latest" = module.latest.image_ref
  }
}
