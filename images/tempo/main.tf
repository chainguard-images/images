terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "tempo-config" { source = "./configs/tempo" }

module "tempo" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.tempo-config.config
  build-dev         = true
}

module "test" {
  source = "./tests"
  digests = {
    tempo = module.tempo.image_ref
  }
}

resource "oci_tag" "latest" {
  for_each = {
    tempo = module.tempo.image_ref
  }
  depends_on = [module.test]

  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each = {
    tempo = module.tempo.dev_ref
  }
  depends_on = [module.test]

  digest_ref = each.value
  tag        = "latest-dev"
}

