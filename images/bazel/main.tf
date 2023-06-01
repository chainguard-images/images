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

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "bazel-6"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "version-tags" {
  depends_on = [ module.test-latest ]
  for_each   = toset(concat(["latest"], module.version-tags.tag_list))

  digest_ref = module.latest.image_ref
  tag        = each.key
}
