terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. postgresql-15)."
}


module "accts" {
  source = "../../../../tflib/accts"
  run-as = "postgres"
  uid    = 65532
  gid    = 65532
  name   = "postgres"
}

variable "environment" {
  default = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "localedef",
        "glibc-locale-en"
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "PGDATA" : "/var/lib/postgresql/data",
      "LANG" : "en_US.UTF-8"
    }, var.environment)
    entrypoint = {
      command = "pg_ctl --help"
    }
    work-dir = "/home/postgres"
    paths = [{
      path        = "/var/lib/postgresql/data"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = parseint("777", 8)
      }, {
      path        = "/var/run/postgresql"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = parseint("777", 8)
    }]
    }
  )
}