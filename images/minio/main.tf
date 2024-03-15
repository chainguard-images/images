terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  packages = {
    "minio" : {
      extra_packages : ["minio", "mc"],
      entrypoint : "/usr/bin/minio"
      repository = var.target_repository
    },
    "minio-client" : {
      extra_packages : ["mc", "bash"]
      entrypoint : "/usr/bin/mc"
      repository : "${var.target_repository}-client",
    },
  }
}

module "config" {
  for_each       = local.packages
  source         = "./config"
  entrypoint     = each.value["entrypoint"]
  extra_packages = each.value["extra_packages"]
}

module "latest" {
  for_each          = local.packages
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = each.value["repository"]
  config            = module.config[each.key].config

  build-dev = true
}


module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => module.latest[k].image_ref }
}

module "test-latest-dev" {
  source    = "./tests"
  check-dev = true
  digests   = { for k, v in module.latest : k => module.latest[k].dev_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.packages
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.packages
  depends_on = [module.test-latest-dev]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}

module "tagger" {
  for_each   = local.packages
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest]

  tags = {
    "latest"     = module.latest[each.key].image_ref
    "latest-dev" = module.latest[each.key].dev_ref
  }
}
