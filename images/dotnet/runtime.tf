module "runtime-config" {
  source = "./configs/runtime"

  dotnet_runtime_version = module.runtime-version.dotnet_runtime_version
  extra_packages         = ["dotnet-${var.dotnet_major_version}-runtime", "busybox", "tzdata"]
}

module "runtime-versioned" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-runtime"
  config            = module.runtime-config.config
  build-dev         = true
  main_package      = "dotnet-${var.dotnet_major_version}-runtime"
  origin_package    = "dotnet-${var.dotnet_major_version}"
  update-repo       = true
}

module "runtime-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = module.runtime-versioned.latest_tag_map
}
