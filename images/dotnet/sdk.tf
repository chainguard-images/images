module "sdk-config" {
  source = "./configs/sdk"

  dotnet_runtime_version = module.runtime-version.dotnet_runtime_version
  extra_packages         = ["dotnet-${var.dotnet_major_version}-sdk", "busybox", "tzdata"]
}

module "sdk-versioned" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-sdk"
  config            = module.sdk-config.config
  build-dev         = true
  main_package      = "dotnet-${var.dotnet_major_version}-sdk"
  origin_package    = "dotnet-${var.dotnet_major_version}"
  update-repo       = true
}

module "sdk-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = module.sdk-versioned.latest_tag_map
}
