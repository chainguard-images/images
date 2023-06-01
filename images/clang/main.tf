terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  source  = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "dev" { source = "../../tflib/dev-subvariant" }

module "latest-dev" {
  source  = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
  extra_packages    = module.dev.extra_packages
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "clang-15"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "version-tags" {
  depends_on = [ module.test-latest ]
  for_each = toset(concat(["latest"], module.version-tags.tag_list))

  digest_ref = module.latest.image_ref
  tag        = each.key
}

module "test-latest-dev" {
  source = "./tests"
  digest = module.latest-dev.image_ref
}

resource "oci_tag" "version-tags-dev" {
  depends_on = [ module.test-latest-dev ]
  for_each   = toset(concat(["latest"], module.version-tags.tag_list))

  digest_ref = module.latest-dev.image_ref
  tag        = "${each.key}-dev"
}
