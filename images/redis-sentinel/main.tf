terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "six-dot-two-compat" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/6.2.apko.yaml")
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "redis-sentinel-6.2-compat"
  config  = module.six-dot-two-compat.config
}

module "test-six-dot-two-compat" {
  source = "./tests"
  digest = module.six-dot-two-compat.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test-six-dot-two-compat]

  tags = merge(
    { for t in toset(concat(["six-dot-two-compat"], module.version-tags.tag_list)) : t => module.six-dot-two-compat.image_ref },
  )
}
