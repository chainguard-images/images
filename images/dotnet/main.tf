variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  default_latest_version = "10"
}

module "versions" {
  package = "dotnet-${local.default_latest_version}"
  source  = "../../tflib/versions"
}

module "runtime-version" {
  dotnet_major_version = each.value.version
  for_each             = module.versions.versions
  source               = "./runtime-version"
}

module "test-things" {
  digests = {
    runtime = module.runtime-versioned[each.key].image_ref
    sdk     = module.sdk-versioned[each.key].image_ref
  }
  for_each        = module.versions.versions
  source          = "./tests"
  test_repository = var.test_repository
}

