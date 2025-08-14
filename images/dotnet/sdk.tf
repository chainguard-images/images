module "sdk-config" {
  for_each = module.versions.versions
  source   = "./configs/sdk"

  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages         = ["${each.key}-sdk", "busybox", "tzdata"]
}

module "sdk-versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  eol               = each.value.eol
  name              = basename(path.module)
  target_repository = "${var.target_repository}-sdk"
  config            = module.sdk-config[each.key].config
  build-dev         = true
  main_package      = "${each.key}-sdk"
  origin_package    = each.key
  update-repo       = each.value.is_latest
}

module "sdk-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags = merge(
    [for k in module.versions.ordered_keys : module.sdk-versioned[k].latest_tag_map]...
  )
}
