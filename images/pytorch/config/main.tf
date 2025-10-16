terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)

  # torchvision is currently built on top of torch and should include all the packages we expect from it
  default = [""]
}

variable "cuda_version" {
  description = "CUDA toolkit version"
  default     = "12.6"
}

variable "cudnn_version" {
  description = "CuDNN version"
  default     = "9"
}

variable "python_version" {
  description = "Python version"
  default     = "3"
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = []
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = []
}

variable "environment" {
  default = {}
}

variable "archs" {
  description = "The architectures to build for."
  type        = list(string)
  default     = ["amd64"]
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages     = var.extra_packages
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/cuda-${var.cuda_version}/bin",
      "CUDA_VERSION" : "${var.cuda_version}",
      "NVIDIA_VISIBLE_DEVICES" : "all",
      "NVIDIA_DRIVER_CAPABILITIES" : "compute,utility",
    }, var.environment)
    entrypoint = {
      command = "/usr/bin/python${var.python_version}"
    }
    archs    = var.archs
    work-dir = "/work"
    layering = {
      strategy = "origin"
      budget   = 10
    }
  })
}
