variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "dotnet"
  source  = "../../tflib/versions"
}

module "runtime-version" {
  dotnet_major_version = each.value.version
  for_each             = module.versions.versions
  source               = "../dotnet/runtime-version"
}

module "config" {
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages = [
    // If no version provided, use default/latest version
    each.value.version == "" ? "aspnet-runtime" : "aspnet-${each.value.version}-runtime",
    "tzdata",
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = module.versions.versions
  main_package      = each.key
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "test" {
  digest   = module.versioned[each.key].image_ref
  for_each = module.versions.versions
  source   = "./tests"
}

module "tags" {
  depends_on             = [module.test]
  dev_ref                = module.versioned[each.key].dev_ref
  dotnet_major_version   = each.value.version
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  dotnet_stream          = module.runtime-version[each.key].dotnet_stream
  for_each               = module.versions.versions
  image_ref              = module.versioned[each.key].image_ref
  is_latest              = each.value.is_latest
  source                 = "../dotnet/tags"
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags = merge(
    [for k in module.versions.ordered_keys : module.tags[k].latest_tag_map]...
  )
}

