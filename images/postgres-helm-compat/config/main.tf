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
  run-as = 1001
  uid    = 1001
  gid    = 1001
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
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "PGDATA" : "/opt/bitnami/postgresql/data",
      "LANG" : "en_US.UTF-8"
      "BITNAMI_APP_NAME" : "postgresql",
    }, var.environment)
    entrypoint = {
      command = "/opt/bitnami/scripts/postgresql/entrypoint.sh /opt/bitnami/scripts/postgresql/run.sh"
    }
    paths = [{
      path        = "/opt/bitnami/postgresql/data"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      }, {
      path        = "/opt/bitnami/postgresql/tmp"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      }, {
      path        = "/opt/bitnami/postgresql/logs"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      }, {
      path        = "/opt/bitnami/postgresql/conf"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      recursive   = true
    }]
    }
  )
}
