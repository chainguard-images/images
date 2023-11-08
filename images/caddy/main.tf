terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "caddy-config" { source = "./config" }

module "caddy" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.caddy-config.config
  build-dev         = true

}

module "test-caddy" {
  source = "./tests"
  digest = module.caddy.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-caddy]
  digest_ref = module.caddy.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-caddy]
  digest_ref = module.caddy.dev_ref
  tag        = "latest-dev"
}

