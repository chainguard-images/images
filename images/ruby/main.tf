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
    module.test-three-zero,
    module.test-three-zero-dev,
    module.test-three-one,
    module.test-three-one-dev,
    module.test-three-two,
    module.test-three-two-dev,
  ]

  tags = merge(
    { for t in toset(module.version-tags-3_0.tag_list) : t => module.three-zero.image_ref },
    { for t in toset(module.version-tags-3_0.tag_list) : "${t}-dev" => module.three-zero-dev.image_ref },
    { for t in toset(module.version-tags-3_1.tag_list) : t => module.three-one.image_ref },
    { for t in toset(module.version-tags-3_1.tag_list) : "${t}-dev" => module.three-one-dev.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-3_2.tag_list)) : t => module.three-two.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-3_2.tag_list)) : "${t}-dev" => module.three-two-dev.image_ref },
  )
}
