terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "six-dot-two-compat" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.config.config
}

module "test-six-dot-two-compat" {
  source = "./tests"
  digest = module.six-dot-two-compat.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-six-dot-two-compat]
  digest_ref = module.six-dot-two-compat.image_ref
  tag        = "latest"
}
