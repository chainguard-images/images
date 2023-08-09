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
    module.test-alpine,
  ]

  tags = {
    "latest" : module.alpine.image_ref,
  }
}
