terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  extra_packages = [
    "nodejs-lts",
    "busybox",
    "npm"
  ]
  source = "../node/config"
}

module "config-next" {
  extra_packages = [
    "nodejs-lts"
  ]
  source = "../node/config"
}

module "versioned" {
  build-dev = true
  config    = module.config.config
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
  ]
  main_package      = "nodejs-20"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = true
}

module "next" {
  build-dev = true
  config    = module.config-next.config
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
    "npm",
    "busybox",
  ]
  main_package      = ""
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = false
}

module "test-versioned" {
  digest = module.versioned.image_ref
  source = "../node/tests"
}

module "test-next" {
  digest = module.next.image_ref
  source = "../node/tests"
}

module "tagger" {
  depends_on = [module.test-versioned, module.test-next]
  source     = "../../tflib/tagger"
  tags = merge(
    {
      "next"     = module.next.image_ref,
      "next-dev" = module.next.dev_ref,
    },
    module.versioned.latest_tag_map
  )
}

