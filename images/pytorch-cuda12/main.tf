locals {
  versions = [
    "py3.11-pytorch-cuda-12.3",
  ]
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  extra_packages = [each.key, "py3.11-torchvision-cuda-12.3"]
  for_each       = toset(local.versions)
  source         = "./config"
}

module "versioned" {
  build-dev          = true
  check-sbom         = false
  config             = module.config[each.key].config
  extra_dev_packages = ["cuda-toolkit-12.3-dev", "bash"]
  for_each           = toset(local.versions)
  main_package       = each.key
  name               = basename(path.module)
  source             = "../../tflib/publisher"
  target_repository  = var.target_repository
}

module "test" {
  digest   = module.versioned[each.key].image_ref
  for_each = toset(local.versions)
  source   = "./tests"
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags       = merge([for v in local.versions : module.versioned[v].latest_tag_map]...)
}

