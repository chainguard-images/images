terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "step-ca" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config

  build-dev      = true
  extra_packages = ["step"]
}

module "test" {
  source = "./tests"
  digest = module.step-ca.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.step-ca.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.step-ca.dev_ref
  tag        = "latest-dev"
}

