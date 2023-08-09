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
    module.test-twenty,
    module.test-twenty-one,
  ]

  tags = merge(
    # 1.19
    { for t in module.version-tags-19.tag_list : t => module.nineteen.image_ref },
    { for t in module.version-tags-19.tag_list : "${t}-dev" => module.nineteen-dev.image_ref },

    # 1.20
    { for t in module.version-tags-20.tag_list : t => module.twenty.image_ref },
    { for t in module.version-tags-20.tag_list : "${t}-dev" => module.twenty-dev.image_ref },

    # 1.21
    { for t in concat(["latest"], module.version-tags-21.tag_list) : t => module.twenty-one.image_ref },
    { for t in concat(["latest"], module.version-tags-21.tag_list) : "${t}-dev" => module.twenty-one-dev.image_ref },
  )
}
