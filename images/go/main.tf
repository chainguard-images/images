terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "dev" { source = "../../tflib/dev-subvariant" }

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-nineteen,
    module.test-nineteen-dev,
    module.test-twenty,
    module.test-twenty-dev,
    module.test-twenty-one,
    module.test-twenty-one-dev,
  ]

  tags = merge(
    # 1.19
    { for t in toset(module.version-tags-19.tag_list) : t => module.nineteen.image_ref },
    { for t in toset(module.version-tags-19.tag_list) : "${t}-dev" => module.nineteen-dev.image_ref },

    # 1.21
    # TODO(mattmoor): Move this below (and switch latest) once 1.21 is no longer an "RC"
    { for t in toset(module.version-tags-21.tag_list) : t => module.twenty-one.image_ref },
    { for t in toset(module.version-tags-21.tag_list) : "${t}-dev" => module.twenty-one-dev.image_ref },

    # 1.20
    { for t in toset(concat(["latest"], module.version-tags-20.tag_list)) : t => module.twenty.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-20.tag_list)) : "${t}-dev" => module.twenty-dev.image_ref },
  )
}
