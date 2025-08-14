module "runtime-config" {
  for_each = module.versions.versions
  source   = "./configs/runtime"

  dotnet_runtime_version = module.runtime-version[each.key].dotnet_runtime_version
  extra_packages         = ["${each.key}-runtime", "busybox", "tzdata"]
}

module "runtime-versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  eol               = each.value.eol
  name              = basename(path.module)
  target_repository = "${var.target_repository}-runtime"
  config            = module.runtime-config[each.key].config
  build-dev         = true
  main_package      = "${each.key}-runtime"
  origin_package    = each.key
  update-repo       = each.value.is_latest
}

module "runtime-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags = merge(
    [for k in module.versions.ordered_keys : module.runtime-versioned[k].latest_tag_map]...
  )
}
