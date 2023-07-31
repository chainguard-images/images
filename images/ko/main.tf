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

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "ko"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "fips-config" {
  source       = "../../tflib/fips-variant"
  config       = yamldecode(file("${path.module}/configs/latest.apko.yaml"))
  replacements = { "ko" = "ko-fips" }
}

module "fips-latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = yamlencode(module.fips-config.config)
}

module "fips-version-tags" {
  source  = "../../tflib/version-tags"
  package = "ko-fips"
  config  = module.fips-latest.config
}

module "test-fips-latest" {
  source = "./tests"
  digest = module.fips-latest.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test-latest, module.test-fips-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["fips-latest"], module.fips-version-tags.tag_list)) : "fips-${t}" => module.fips-latest.image_ref },
  )
}
