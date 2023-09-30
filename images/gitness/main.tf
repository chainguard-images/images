terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "gitness-config" { source = "./config" }

module "gitness" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.gitness-config.config
  build-dev         = true
}

module "test-gitness" {
  source = "./tests"
  digest = module.gitness.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-gitness]
  digest_ref = module.gitness.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-gitness]
  digest_ref = module.gitness.dev_ref
  tag        = "latest-dev"
}
