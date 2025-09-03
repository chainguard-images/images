terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" {
  source = "./config"

  extra_packages = [
    "gosu", # Needed by entrypoint
    "postgresql",
    "postgresql-client",
    "postgresql-oci-entrypoint",
    "postgresql-contrib",
    "libpq",
    "pgaudit",
  ]

  run-as = 0
  id     = 70
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  build-dev         = true
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
  # In refernced postgres test, we dynamically pass uid/gid for TLS test, hence we will have to handle it here too
  # Extract UID/GID directly from the latest config
  uid = jsondecode(module.latest-config.config).accounts.users[0].uid
  gid = jsondecode(module.latest-config.config).accounts.users[0].gid
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = {
    "latest"     = module.latest.image_ref
    "latest-dev" = module.latest.dev_ref
  }
}
