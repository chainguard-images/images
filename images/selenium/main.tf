terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source         = "./config"
  extra_packages = ["docker-selenium-base"]
}

locals {
  mangled_repository = replace(var.target_repository, "/selenium", "/docker-selenium")

}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = local.mangled_repository
  config            = module.config.config
  build-dev         = true

  /*
  Unrecognized license reference: custom. license_expression must only use IDs from the license list or extracted licensing info, but is: custom
  Unrecognized license reference: LicenseRef-ubuntu-font. license_expression must only use IDs from the license list or extracted licensing info, but is: LicenseRef-ubuntu-font
  Components missing an supplier: libxxf86vm,libdaemon,fftw-single-libs,libxv
  */
  check-sbom = false # TODO(jason): Re-enable SBOM check
}

module "test" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}
