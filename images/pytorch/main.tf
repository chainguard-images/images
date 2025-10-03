terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  archs              = ["x86_64"]
  extra_repositories = ["https://apk.cgr.dev/extra-packages"]

  // These could be eventually generated with setproduct
  // TODO(pnasrat): move to version streams
  full_versions = {
    "py3.13-cuda12.8" : { "cuda" : "12.8", "python" : "3.13" },
  }

  versions = keys(local.full_versions)
  // Manually specify latest_version
  // pytorch versions are complicated by the matrix of cuda and cudnn support
  latest_version = "py3.13-cuda12.8"

  full_version_packages = {
    for k, v in local.full_versions : k => [
      # Allow running w/ older drivers (requires user to set LD_LIBRARY_PATH)
      "nvidia-cuda-compat-${v.cuda}",
      # For parity with upstream images
      "nvidia-cuda-cupti-${v.cuda}",
      "nvidia-libnvjpeg-${v.cuda}",
      "nvidia-libnpp-${v.cuda}",
      "py${v.python}-torch-cuda-${v.cuda}-bin",
      "py${v.python}-torchvision-cuda-${v.cuda}",
    ]
  }

  cudnn_version = {
    for k, v in data.apko_config.full_version_packages :
    k => [for p in v.config.contents.packages : p if startswith(p, "nvidia-cudnn-")][0]
  }
  cudnn_major_version = {
    for k, v in local.cudnn_version :
    k => split(".", split("=", v)[1])[0]
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

data "apko_config" "full_version_packages" {
  for_each = local.full_version_packages
  config_contents = jsonencode({
    archs = local.archs
    contents = {
      repositories = local.extra_repositories
      packages     = each.value
    }
  })
}

module "config" {
  for_each       = local.full_versions
  source         = "./config"
  cuda_version   = each.value.cuda
  cudnn_version  = local.cudnn_major_version[each.key]
  python_version = each.value.python
  archs          = local.archs

  extra_repositories = local.extra_repositories
  extra_packages     = local.full_version_packages[each.key]
  environment = {
    "CUDA_VERSION" : "${each.value.cuda}",
  }
}

module "versioned" {
  for_each          = local.full_versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = false # TODO(wojciechka): re-enable once CI is working consistently
  main_package      = "py${each.value.python}-torch-cuda-${each.value.cuda}-bin"
  check-sbom        = true
  # pytorch:TAG-dev is an AI training image
  extra_packages = [
    "python-${each.value.python}",
    "py${each.value.python}-torchvision-cuda-${each.value.cuda}",
  ]
  extra_dev_packages = ["bash", "cuda-toolkit-${each.value.cuda}-dev", "libtorchvision-cuda-${each.value.cuda}-dev", "py${each.value.python}-torch-cuda-${each.value.cuda}-dev", "py${each.value.python}-pip", "uv"]
  update-repo        = each.key == local.latest_version
  // These images are huge. Given them 40 minutes to pass the repro check
  reproduce_timeout = 2400
}

module "test" {
  for_each = local.full_versions
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  tags = merge(
    { "latest" = module.versioned[local.latest_version].image_ref },
    { "latest-dev" = module.versioned[local.latest_version].dev_ref },
  )
}
