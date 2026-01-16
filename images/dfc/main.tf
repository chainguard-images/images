variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  packages = {
    "dfc" : {
      extra_packages : ["dfc"],
      entrypoint : "/usr/bin/dfc",
      cmd : "--help",
      repository : var.target_repository,
    },
    "dfc-mcp" : {
      extra_packages : ["dfc-mcp-server"],
      entrypoint : "/usr/bin/dfc-mcp-server",
      cmd : "",
      repository : "${var.target_repository}-mcp",
    },
  }
}

module "config" {
  cmd            = each.value["cmd"]
  entrypoint     = each.value["entrypoint"]
  extra_packages = each.value["extra_packages"]
  for_each       = local.packages
  source         = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = local.packages
  main_package      = local.packages[each.key].extra_packages[0]
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = each.value["repository"]
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

