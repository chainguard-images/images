terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "nemo" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  /*
  Unrecognized license reference: PROPRIETARY.
  */
  check-sbom = false # TODO(jason): Re-enable SBOM check

}

# TODO: These tests pass however we're running into CI issues related to disk space,
# caused by the nemo image being much larger than others. Disabling until issue is
# resolved.
# module "test" {
#   source = "./tests"
#   digest = module.nemo.image_ref
# }

resource "oci_tag" "latest" {
  # depends_on = [module.test]
  digest_ref = module.nemo.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  # depends_on = [module.test]
  digest_ref = module.nemo.dev_ref
  tag        = "latest-dev"
}

