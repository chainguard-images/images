terraform {
  required_providers {
    apko = {
      source = "chainguard-dev/apko"
    }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest-alpine,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags-alpine.tag_list)) : t => module.latest-alpine.image_ref },
  )
}
