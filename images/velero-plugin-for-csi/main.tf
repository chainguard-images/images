terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset(["velero-plugin-for-csi"])
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "velero-plugin-for-csi" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key
}

data "oci_ref" "velero" {
  ref = "cgr.dev/chainguard/velero:latest"
}

data "oci_ref" "velero-plugin-for-aws" {
  ref = "cgr.dev/chainguard/velero-plugin-for-aws:latest"
}

module "test" {
  source = "./tests"
  digests = {
    velero                = "${data.oci_ref.velero.ref}@${data.oci_ref.velero.digest}"
    velero-plugin-for-aws = "${data.oci_ref.velero-plugin-for-aws.ref}@${data.oci_ref.velero-plugin-for-aws.digest}"
    velero-plugin-for-csi = module.velero-plugin-for-csi["velero-plugin-for-csi"].image_ref
  }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.velero-plugin-for-csi[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.velero-plugin-for-csi[each.key].dev_ref
  tag        = "latest-dev"
}

