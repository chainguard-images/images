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
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.latest.config)
  extra_packages = module.dev.extra_packages
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "ingress-nginx-controller"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  image_tag = module.version-tags.tag_list[2] #[id=1,1.8,1.8.0,1.8.0-r3] need 1.8.0 for helm 
  digest = module.latest.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-dev" => module.latest-dev.image_ref },
  )
}
