terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. postgresql-15)."
  default     = ["postgresql-15", "postgresql-15-client", "postgresql-15-oci-entrypoint", "postgresql-15-contrib", "libpq-15"]
}

variable "uid" {
  description = "The user ID of the postgres user."
  default     = 70
}

variable "gid" {
  description = "The group ID of the postgres group."
  default     = 70
}

variable "run-as" {
  description = "The user ID to run the postgres process as."
  default     = 0
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = var.run-as
  uid    = var.uid
  gid    = var.gid
  name   = "postgres"
}

variable "environment" {
  default = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "glibc-locale-en",
        "busybox",
        "su-exec",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "PGDATA" : "/var/lib/postgresql/data",
      "LANG" : "en_US.UTF-8"
    }, var.environment)
    entrypoint = {
      command = "/var/lib/postgres/initdb/postgresql-entrypoint.sh postgres"
    }
    work-dir = "/home/postgres"
    paths = [{
      path        = "/var/lib/postgresql/data"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
    }
  )
}
