terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "dev" { source = "../../tflib/dev-subvariant" }

locals {
  php_dev = concat(module.dev.extra_packages, ["composer"])
}

module "latest-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.latest.config)
  extra_packages = local.php_dev
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "php"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-latest-dev" {
  source    = "./tests"
  digest    = module.latest-dev.image_ref
  check-dev = true
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-fpm,
    module.test-fpm-dev,
    module.test-latest,
    module.test-latest-dev,
  ]

  tags = merge(
    # PHP fpm
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-fpm" => module.fpm.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-fpm-dev" => module.fpm-dev.image_ref },

    # PHP
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-dev" => module.latest-dev.image_ref },
  )
}
