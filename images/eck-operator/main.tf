terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["eck-operator"])
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "eck-operator" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key

  /*
  Unrecognized license reference: Elastic License 2.0. license_expression must only use IDs from the license list or extracted licensing info, but is: Elastic License 2.0
  Unrecognized license reference: Elastic License 2.0. license_expression must only use IDs from the license list or extracted licensing info, but is: Elastic License 2.0
  No components with missing information.
  */
  check-sbom = false # TODO(jason): Re-enable SBOM check
}

module "test" {
  for_each = local.components
  source   = "./tests"
  digest   = module.eck-operator[each.key].image_ref
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.eck-operator[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.eck-operator[each.key].dev_ref
  tag        = "latest-dev"
}

