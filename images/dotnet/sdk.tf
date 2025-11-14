locals {
  default_latest_version = "10"
}

module "sdk-config" {
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages = [
    // When being used from public image build, each.key is missing the version number.
    // Inject the default latest version when missing
    each.key == "dotnet" ? "${each.key}-${local.default_latest_version}-sdk" : "${each.key}-sdk",
    "busybox",
    "tzdata",
  ]
  for_each = module.versions.versions
  source   = "./configs/sdk"
}

module "sdk-versioned" {
  build-dev         = true
  config            = module.sdk-config[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = "${each.key}-sdk"
  name              = basename(path.module)
  origin_package    = each.key
  source            = "../../tflib/publisher"
  target_repository = "${var.target_repository}-sdk"
  update-repo       = each.value.is_latest
}

module "sdk-tagger" {
  depends_on = [module.test-things]
  source     = "../../tflib/tagger"
  tags = merge(
    [for k in module.versions.ordered_keys : module.sdk-versioned[k].latest_tag_map]...
  )
}

