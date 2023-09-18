terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "dev" { source = "../../tflib/dev-subvariant" }

locals {
  fluentd_dev = concat(module.dev.extra_packages, [
    "build-base",
    "ruby3.2-bundler",
    "ruby-3.2-dev",
  ])
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
  ]

  tags = merge(
    { for t in toset(concat(["edge"], module.version-tags-latest.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["edge"], module.version-tags-latest.tag_list)) : "${t}-dev" => module.latest-dev.image_ref },

    { for t in toset(concat(["latest"], module.version-tags-latest.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-latest.tag_list)) : "${t}-dev" => module.latest-dev.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-latest.tag_list)) : "${t}-splunk" => module.latest-splunk.image_ref }
  )
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "latest-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.latest.config)
  extra_packages = local.fluentd_dev
}

module "latest-splunk" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.latest.config)
  extra_packages = ["ruby3.2-fluent-plugin-splunk-hec", "fluent-plugin-out-http"]
}

module "version-tags-latest" {
  source  = "../../tflib/version-tags"
  package = "ruby3.2-fluentd"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-splunk" {
  source = "./tests/splunk"
  digest = module.latest-splunk.image_ref
}
