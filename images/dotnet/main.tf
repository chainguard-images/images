variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "dotnet_major_version" {
  description = "The major version of .NET (e.g., '6', '8')."
  type        = string
  default     = "9"
}

module "runtime-version" {
  source               = "./runtime-version"
  dotnet_major_version = var.dotnet_major_version
}

module "test-things" {
  source          = "./tests"
  test_repository = var.test_repository

  digests = {
    runtime = module.runtime-versioned.image_ref
    sdk     = module.sdk-versioned.image_ref
  }
}
