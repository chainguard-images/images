terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "main_package" {
  description = "The main package to install."
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["tini", "bash", "busybox"]
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
  description = "Additional environment variables to set"
  default     = {}
  type        = map(string)
}

module "accts" {
  source = "../../../tflib/accts"
  # kibana expects to run as this user
  run-as = 1000
  uid    = 1000
  gid    = 1000
  name   = "kibana"
}

# aarch64 fails to build in Github for 7.x, so that architecture is excluded here
output "config" {
  value = jsonencode({
    archs = (var.main_package == "kibana-7") ? ["x86_64"] : ["x86_64", "aarch64"]
    contents = {
      packages     = concat([var.main_package], var.extra_packages)
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    paths = [
      {
        path        = "/usr/share/kibana",
        type        = "directory",
        recursive   = true,
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 493,
      }
    ]
    accounts    = module.accts.block
    environment = var.environment
    entrypoint = {
      command = "/sbin/tini -g --"
    }
    cmd = "/usr/share/kibana/bin/kibana"
  })
}
