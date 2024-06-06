terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset([
    "console",
    "rotor",
  ])

  # Upstream images are named `jitsucom-{component}`.
  mangled_repository = replace(var.target_repository, "/jitsucom-jitsu", "/jitsucom")

}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each       = local.components
  source         = "./configs"
  name           = each.key
  extra_packages = ["jitsucom-jitsu-${each.key}"]
}

module "jitsucom-jitsu" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${local.mangled_repository}-${each.key}"
  config            = module.config[each.key].config

  build-dev    = true
  main_package = "jitsucom-jitsu-${each.key}"
}

module "test" {
  source  = "./tests"
  digests = { for k, v in module.jitsucom-jitsu : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.jitsucom-jitsu[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.jitsucom-jitsu[each.key].dev_ref
  tag        = "latest-dev"
}

