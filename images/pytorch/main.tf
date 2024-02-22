terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  versions = [
    "pytorch-cuda12",
  ]
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}


module "config" {
  for_each       = toset(local.versions)
  source         = "./config"
  extra_packages = [each.key, "busybox", "bash"]
}

module "versioned" {
  for_each = toset(local.versions)
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.key
}

module "test" {
  for_each = toset(local.versions)
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  tags       = merge([for v in local.versions : module.versioned[v].latest_tag_map]...)
}
