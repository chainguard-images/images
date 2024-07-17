terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    apko = { source = "chainguard-dev/apko" }
  }
}

// Create a dummy config that includes 'cassandra;, so we can extract the actual cassandra version below.
data "apko_config" "for-getting-cassandra-version" {
  config_contents = jsonencode({
    contents = {
      packages = ["cassandra"]
    }
  })
}

// Extract the cassandra version from the dummy config.
locals {
  // This finds the cassandra package in the dummy config, like "cassandra-4.0=4.0.12-r1"
  cassandra_package     = [for p in data.apko_config.for-getting-cassandra-version.config.contents.packages : p if startswith(p, "cassandra")][0]
  full_version          = split("=", local.cassandra_package)[1] // This extracts the version, like "4.0.12-r1"
  version_without_epoch = split("-", local.full_version)[0]      // This extracts the version without the epoch, like "4.0.12"
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "./config"
  environment = {
    "CASSANDRA_VERSION" : local.version_without_epoch
  }
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  cassandra_version = local.version_without_epoch
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}
