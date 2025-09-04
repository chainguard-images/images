variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "dotnet_major_version" {
  description = "The major version of .NET (e.g., '6', '8')."
  type        = string
  default     = "9"
}

module "runtime-version" {
  source               = "../dotnet/runtime-version"
  dotnet_major_version = var.dotnet_major_version
}

module "config" {
  source                 = "./config"
  dotnet_runtime_version = module.runtime-version.dotnet_runtime_version
  extra_packages         = ["aspnet-${var.dotnet_major_version}-runtime", "tzdata"]
}

module "versioned" {
  source = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "aspnet-${var.dotnet_major_version}-runtime"
}

module "test" {
  source = "./tests"
  digest = module.versioned.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  tags       = module.versioned.latest_tag_map
}
