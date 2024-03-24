terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)

  default = ["dragonfly", "dragonfly-oci-compat"]
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  # Dragonfly expects to run as this user
  run-as = 10000
  uid    = 10000
  gid    = 1000
  name   = "dfly"
}

output "config" {
  value = jsonencode({
    contents = {
      packages     = var.extra_packages
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    accounts    = module.accts.block
    environment = var.environment
    entrypoint = {
      command = "/usr/bin/entrypoint.sh"
    }
    cmd = "dragonfly --logtostderr"
  })
}
