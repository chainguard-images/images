module "runtime-config" {
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages         = ["${each.key}-runtime", "busybox", "tzdata"]
  for_each               = module.versions.versions
  source                 = "./configs/runtime"
}

module "runtime-versioned" {
  build-dev         = true
  config            = module.runtime-config[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = "${each.key}-runtime"
  name              = basename(path.module)
  origin_package    = each.key
  source            = "../../tflib/publisher"
  target_repository = "${var.target_repository}-runtime"
  update-repo       = each.value.is_latest
}

module "runtime-tags" {
  depends_on             = [module.test-things]
  dev_ref                = module.runtime-versioned[each.key].dev_ref
  dotnet_epoch           = module.runtime-version[each.key].dotnet_epoch
  dotnet_major_version   = each.value.version
  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  dotnet_stream          = module.runtime-version[each.key].dotnet_stream
  for_each               = module.versions.versions
  image_ref              = module.runtime-versioned[each.key].image_ref
  is_latest              = each.value.is_latest
  source                 = "./tags"
}

module "runtime-tagger" {
  depends_on = [module.test-things]
  source     = "../../tflib/tagger"
  tags = merge(
    [for k in module.versions.ordered_keys : module.runtime-tags[k].latest_tag_map]...
  )
}

