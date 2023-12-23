terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. postgresql-15)."
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
  uid    = 70
  gid    = 70
  name   = "postgres"
}

variable "environment" {
  default = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "glibc-locale-en", # required for initdb entrypoint
        "busybox",         # required for initdb entrypoint
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "PGDATA" : "/var/lib/postgresql/data",
      "LANG" : "en_US.UTF-8"
    }, var.environment)
    entrypoint = {
      command = "/usr/bin/postgresql-entrypoint.sh postgres"
    }
    work-dir = "/home/postgres"
    paths = [{
      path        = "/var/lib/postgresql/data"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/var/run/postgresql"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
    }
  )
}
