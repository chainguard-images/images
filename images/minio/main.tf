variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  packages = {
    "minio" : {
      extra_packages : ["minio", "mc", "coreutils", "bash-binsh"],
      entrypoint : "/usr/bin/minio"
      repository = var.target_repository
    },
    "minio-client" : {
      extra_packages : ["mc", "bash", "coreutils"]
      entrypoint : "/usr/bin/mc"
      repository : "${var.target_repository}-client",
    },
  }
}

module "config" {
  entrypoint     = each.value["entrypoint"]
  extra_packages = each.value["extra_packages"]
  for_each       = local.packages
  source         = "./config"
}

module "versioned" {
  banned_license_exceptions = ["AGPL-3.0"]
  build-dev                 = true
  config                    = module.config[each.key].config
  for_each                  = local.packages
  main_package              = local.packages[each.key].extra_packages[0]
  name                      = basename(path.module)
  source                    = "../../tflib/publisher"
  target_repository         = each.value["repository"]
}

module "test" {
  digests = { for k, v in module.versioned : k => module.versioned[k].image_ref }
  source  = "./tests"
}

module "test-dev" {
  check-dev = true
  digests   = { for k, v in module.versioned : k => module.versioned[k].dev_ref }
  source    = "./tests"
}

module "tagger" {
  depends_on = [module.test, module.test-dev]
  for_each   = local.packages
  source     = "../../tflib/tagger"
  tags       = module.versioned[each.key].latest_tag_map
}

