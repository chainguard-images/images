terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["argocd", "repo-server"])
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = (each.key == "argocd" ? var.target_repository : "${var.target_repository}-repo-server")
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each = module.latest

  digest_ref = each.value.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each = module.latest

  digest_ref = each.value.dev_ref
  tag        = "latest-dev"
}
