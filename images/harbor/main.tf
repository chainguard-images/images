terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset([
    "core",
    "db",
    "jobservice",
    "portal",
    "registry",
    "registryctl",
    "trivy-adapter",
  ])

  packages = merge({
    for k, v in local.components : k => ["harbor-${k}"]
    }, {
    "core" : ["harbor"]
    }, {
    "trivy-adapter" : ["harbor-scanner-trivy", "trivy"]
  })

  repositories = {
    for k, v in local.components : k => "${var.target_repository}-${k}"
  }

  // Update this when PostgreSQL versions for the latest Harbor DB release change
  postgres_versions = ["13", "14"]
}

module "latest-config" {
  for_each          = local.components
  source            = "./config"
  component         = each.key
  postgres_versions = local.postgres_versions
  extra_packages    = local.packages[each.key]
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = module.latest-config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each   = local.components
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest]
  tags = {
    "latest"     = module.latest[each.key].image_ref
    "latest-dev" = module.latest[each.key].dev_ref
  }
}
