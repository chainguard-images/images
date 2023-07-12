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

module "latest-dev" {
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  config            = jsonencode(module.latest.config)
  extra_packages = concat(module.dev.extra_packages, [
    "crictl",
    "kubectl",
    "ctr",
  ])
}

module "latest-images" {
  source            = "../../tflib/publisher"
  target_repository = "${var.target_repository}-images"
  config            = file("${path.module}/configs/latest.images.apko.yaml")
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "k3s"
  config  = module.latest.config
}

module "version-tags-images" {
  source  = "../../tflib/version-tags"
  package = "k3s-images"
  config  = module.latest-images.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
    module.test-embedded,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-dev" => module.latest-dev.image_ref },
    # images is not a runnable image and does not have a dev variant, they are just image bits formatted in a way k3s knows how to load
    { for t in toset(concat(["latest"], module.version-tags-images.tag_list)) : "${t}-images" => module.latest-images.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-embedded.tag_list)) : t => module.latest-embedded.image_ref },
  )
}
