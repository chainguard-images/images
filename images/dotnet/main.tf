variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "dotnet"
  source  = "../../tflib/versions"
}

module "runtime-version" {
  for_each             = module.versions.versions
  source               = "./runtime-version"
  dotnet_major_version = each.value.version
}

module "test-things" {
  for_each        = module.versions.versions
  source          = "./tests"
  test_repository = var.test_repository

  digests = {
    runtime = module.runtime-versioned[each.key].image_ref
    sdk     = module.sdk-versioned[each.key].image_ref
  }
}
