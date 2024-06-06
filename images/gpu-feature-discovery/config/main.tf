terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. gptscript)."
  default     = ["gpu-feature-discovery"]
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
      command = "gpu-feature-discovery"
    }
  })
}
