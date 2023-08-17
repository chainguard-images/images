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
  node_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
  ]
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-nineteen,
    module.test-twenty,
    module.test-eighteen,
  ]

  tags = merge(
    # Node 19
    { for t in toset(module.nineteen-version-tags.tag_list) : t => module.nineteen.image_ref },
    { for t in toset(module.nineteen-version-tags.tag_list) : "${t}-dev" => module.nineteen-dev.image_ref },

    # Node 20
    { for t in toset(module.twenty-version-tags.tag_list) : t => module.twenty.image_ref },
    { for t in toset(module.twenty-version-tags.tag_list) : "${t}-dev" => module.twenty-dev.image_ref },

    # Node 18 (latest)
    { for t in toset(concat(["latest"], module.eighteen-version-tags.tag_list)) : t => module.eighteen.image_ref },
    { for t in toset(concat(["latest"], module.eighteen-version-tags.tag_list)) : "${t}-dev" => module.eighteen-dev.image_ref },

    # Node 18.16.0-r.2
    { for t in toset(concat(["latest"], module.eighteen-sixteen-zero-version-tags.tag_list)) : t => module.eighteen.image_ref },
    { for t in toset(concat(["latest"], module.eighteen-sixteen-zero-version-tags.tag_list)) : "${t}-dev" => module.eighteen-dev.image_ref },
  )
}
