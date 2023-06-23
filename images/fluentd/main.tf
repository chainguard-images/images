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
    module.test-fourteen,
    module.test-fourteen-dev,
    module.test-fifteen,
    module.test-fifteen-dev,
  ]

  tags = merge(
    { for t in toset(concat(["edge"], module.version-tags-15.tag_list)) : t => module.fifteen.image_ref },
    { for t in toset(concat(["edge"], module.version-tags-15.tag_list)) : "${t}-dev" => module.fifteen-dev.image_ref },

    { for t in toset(concat(["latest"], module.version-tags-14.tag_list)) : t => module.fourteen.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-14.tag_list)) : "${t}-dev" => module.fourteen-dev.image_ref },
  )
}
