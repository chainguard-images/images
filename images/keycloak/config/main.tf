terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = ["keycloak"]
}

variable "environment" {
  default = {}
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "busybox",
      ], var.extra_packages)
    }
    accounts = module.accts.block

    paths = [{
      path        = "/usr/share/java/keycloak"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      recursive   = true
    }]
    environment = var.environment
    entrypoint = {
      command = "/usr/bin/kc.sh"
    }
  })
}
