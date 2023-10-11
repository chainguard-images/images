terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source   = "./config"
  rootless = false
}

module "latest" {
  source = "../../tflib/publisher"

  name              = "buildkit"
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "buildkitd"
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

/*

This doesn't work yet - missing package dependencies: https://github.com/wolfi-dev/os/pull/6616

module "config-rootless" {
  source   = "./config"
  rootless = true
}

module "rootless" {
  source   = "../../tflib/publisher"

  name               = "buildkit-rootless"
  target_repository  = var.target_repository
  config             = module.config-rootless.config
  build-dev = true
  main_package       = "buildkitd"
}

*/

module "tagger" {
  source = "../../tflib/tagger"

  tags = merge(
    /*
    { for t in module.rootless.tag_list : "${t}-rootless" => module.rootless.image_ref },
    { for t in module.rootless.tag_list : "${t}-rootless-dev" => module.rootless.image_ref },
    {
      
      "rootless": module.rootless.image_ref,
      "rootless-dev": module.rootless.dev_ref,
    },
    */

    { for t in module.latest.tag_list : "${t}" => module.latest.image_ref },
    { for t in module.latest.tag_list : "${t}-dev" => module.latest.image_ref },
    {
      "latest" : module.latest.image_ref,
      "latest-dev" : module.latest.dev_ref,
    },

  )
}
