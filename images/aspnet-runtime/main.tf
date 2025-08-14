variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "dotnet"
  source  = "../../tflib/versions"
}

module "runtime-version" {
  for_each             = module.versions.versions
  source               = "../dotnet/runtime-version"
  dotnet_major_version = each.value.version
}

module "config" {
  for_each               = module.versions.versions
  source                 = "./config"
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages         = ["aspnet-${each.value.version}-runtime", "tzdata"]
}

module "versioned" {
  for_each = module.versions.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.key
}

module "test" {
  for_each = module.versions.versions
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  tags = merge(
    [for k in module.versions.ordered_keys : module.versioned[k].latest_tag_map]...
  )
}
