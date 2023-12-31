terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  jdks = toset(["11", "17", "21"])
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each       = local.jdks
  source         = "./config"
  extra_packages = ["maven", "openjdk-${each.key}", "openjdk-${each.key}-default-jvm"]
  java_home      = "/usr/lib/jvm/java-${each.key}-openjdk"
}

module "maven" {
  for_each          = local.jdks
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
}

module "test" {
  for_each = local.jdks
  source   = "./tests"
  digest   = module.maven[each.key].image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test]

  tags = {
    "openjdk-11" : module.maven["11"].image_ref
    "openjdk-11-dev" : module.maven["11"].dev_ref

    "openjdk-17" : module.maven["17"].image_ref
    "openjdk-17-dev" : module.maven["17"].dev_ref

    "openjdk-21" : module.maven["21"].image_ref
    "openjdk-21-dev" : module.maven["21"].dev_ref

    # TODO: Update these to point to openjdk-21
    "latest" : module.maven["17"].image_ref
    "latest-dev" : module.maven["17"].dev_ref
  }
}
