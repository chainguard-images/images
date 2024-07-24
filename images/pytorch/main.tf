locals {
  full_versions = {
    "2.3.1-py3.11-cuda12.3-cudnn8" : { "cuda" : "12.3", "python" : "3.11" },
  }
  latest_version = "2.3.1-py3.11-cuda12.3-cudnn8"
  versions       = keys(local.full_versions)
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  environment = {
    "CUDA_VERSION" : "${each.value.cuda}",
    "LD_LIBRARY_PATH" : "/usr/local/cuda-${each.value.cuda}/lib:/usr/local/cudnn-8.9/lib64",
  }
  extra_packages = [
    "py${each.value.python}-pytorch-cuda-${each.value.cuda}",
    "py${each.value.python}-torchvision-cuda-${each.value.cuda}",
  ]
  for_each = local.full_versions
  source   = "./config"
}

module "versioned" {
  build-dev          = true
  check-sbom         = false
  config             = module.config[each.key].config
  extra_dev_packages = ["cuda-toolkit-${each.value.cuda}-dev", "bash"]
  for_each           = local.full_versions
  main_package       = "cuda-toolkit-${each.value.cuda}"
  name               = basename(path.module)
  source             = "../../tflib/publisher"
  target_repository  = var.target_repository
  update-repo        = each.key == local.latest_version
}

module "test" {
  digest   = module.versioned[each.key].image_ref
  for_each = local.full_versions
  source   = "./tests"
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags = merge(
    // pytorch has unusual tagging to better reflect upstream.
    // For the defined latest version, ensure latest/latest-dev tags exist
    // Note the versions from main package are ignored, using the fully qualified local variables instead
    { "latest" = module.versioned[local.latest_version].image_ref },
    { "latest-dev" = module.versioned[local.latest_version].dev_ref },
    [for k, v in local.full_versions : {
      for tag, ref in module.versioned[k].tag_map : "${k}" => ref if v.cuda == tag
  }]...)
}

