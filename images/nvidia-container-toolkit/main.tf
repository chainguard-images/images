terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "nvidia-container-toolkit" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true

  /*
  Unrecognized license reference: PROPRIETARY. license_expression must only use IDs from the license list or extracted licensing info, but is: PROPRIETARY
  */
  check-sbom = false # TODO(jason): Re-enable SBOM check
}

module "test" {
  source = "./tests"
  digest = module.nvidia-container-toolkit.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.nvidia-container-toolkit.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.nvidia-container-toolkit.dev_ref
  tag        = "latest-dev"
}
