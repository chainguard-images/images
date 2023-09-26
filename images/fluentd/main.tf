variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  fluentd_dev = [
    "build-base",
    "ruby3.2-bundler",
    "ruby-3.2-dev",
  ]

  splunk = [
    "ruby3.2-fluent-plugin-splunk-hec",
    "ruby3.2-fluent-plugin-prometheus",
    "ruby3.2-fluent-plugin-rewrite-tag-filter",
    "net-tools", # hostname command is required by rewrite-tag-filter plugin
  ]
}

module "latest" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = file("${path.module}/configs/latest.apko.yaml")
  extra_dev_packages = local.fluentd_dev
}

module "latest-splunk" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = file("${path.module}/configs/latest.apko.yaml")
  extra_packages     = local.splunk
  extra_dev_packages = local.fluentd_dev
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

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
    module.test-splunk,
  ]

  tags = merge(
    { for t in toset(concat(["edge", "latest"], module.version-tags-latest.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["edge", "latest"], module.version-tags-latest.tag_list)) : "${t}-dev" => module.latest.dev_ref },

    { for t in toset(concat(["latest"], module.version-tags-latest.tag_list)) : "${t}-splunk" => module.latest-splunk.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-latest.tag_list)) : "${t}-splunk-dev" => module.latest-splunk.dev_ref }
  )
}
