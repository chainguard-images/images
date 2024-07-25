terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = [""]
  description = "Additional packages to install."
  type        = list(string)
}

variable "extra_repositories" {
  default     = ["https://packages.cgr.dev/extras"]
  description = "The additional repositores to install from (e.g. extras)."
}

variable "extra_keyring" {
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
  description = "The additional keys to use (e.g. extras)."
}

variable "environment" {
  default = {}
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
      "PATH" : "/work:/usr/share/torchvision/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin",
      "CUDA_VERSION" : "12.3",
      "LD_LIBRARY_PATH" : "/usr/local/cuda-12.3/lib:/usr/local/cudnn-8.9/lib64",
    }, var.environment)
    entrypoint = {
      command = "/usr/share/torchvision/.venv/bin/python3"
    }
    archs    = ["x86_64"]
    work-dir = "/work"
  })
}

