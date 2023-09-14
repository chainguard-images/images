terraform {
  required_providers {
    apko = {
      source                = "chainguard-dev/apko"
      configuration_aliases = [apko.alpine]
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
    module.test-wolfi,
  ]

  tags = {
    "latest-glibc" : module.wolfi.image_ref,
    "latest" : module.alpine.image_ref,
  }
}
