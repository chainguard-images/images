terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. gptscript)."
  default     = ["nvidia-gpu-operator"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
  uid    = 65532
  gid    = 65532
  name   = "nonroot"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts    = module.accts.block
    environment = var.environment
    entrypoint = {
      command = "gpu-operator"
    }
  })
}
