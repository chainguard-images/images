terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "../node/config"
  extra_packages = [
    "nodejs-lts",
    "busybox",
    "npm"
  ]
}

module "config-next" {
  source = "../node/config"
  extra_packages = [
    "nodejs-lts"
  ]
}

module "versioned" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "nodejs-lts"
  update-repo       = true
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
  ]
}

module "next" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config-next.config
  build-dev         = true
  update-repo       = false
  main_package      = ""
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
    "npm",
    "busybox",
  ]
}

module "test-versioned" {
  source = "../node/tests"
  digest = module.versioned.image_ref
}

module "test-next" {
  source = "../node/tests"
  digest = module.next.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned, module.test-next]
  tags = merge(
    {
      "next"     = module.next.image_ref,
      "next-dev" = module.next.dev_ref,
    },
    module.versioned.latest_tag_map
  )
}
