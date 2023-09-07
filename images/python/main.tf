terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" {
  source = "./config"

  extra_packages = ["python-3"]
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.latest-config.config
}

module "dev" { source = "../../tflib/dev-subvariant" }

module "latest-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.latest.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "py3-pip",
    "python3-dev"
  ])
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-latest-dev" {
  source = "./tests"

  check-dev = true # Check for PIP in dev variants.
  digest    = module.latest-dev.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest-dev]
  digest_ref = module.latest-dev.image_ref
  tag        = "latest-dev"
}
