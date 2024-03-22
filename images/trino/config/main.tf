variable "environment" {
  description = "The environment variables to set in the final image"
  type        = map(string)
  # CATALOG_MANAGEMENT variable as defined in the upstream container:
  # https://github.com/trinodb/trino/blob/d3b901f83e663dcbfed3e4868a2bc40919deb9c5/core/docker/Dockerfile#L34
  default = {
    "CATALOG_MANAGEMENT" : "static"
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["trino"]
}

variable "extra_plugins" {
  description = "The additional packages to install"
  type        = list(string)
  default = [
    "trino-plugin-memory",
    "trino-plugin-jmx",
    "trino-plugin-tpcds",
    "trino-plugin-tpch",
    "trino-plugin-exchange-filesystem",
  ]
}

variable "packages" {
  description = "List of packages as runtime dependencies for Atlantis"
  type        = list(string)
  default = [
    "trino-oci-entrypoint",
    "busybox",
  ]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "trino"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.packages, var.extra_packages, var.extra_plugins)
    }
    accounts = module.accts.block
    paths = [
      {
        path        = "/usr/lib/trino/"
        type        = "directory"
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = 493 // 0o755
        recursive   = true
      },
      {
        path        = "/etc/trino/"
        type        = "directory"
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = 493 // 0o755
        recursive   = true
      },
      {
        path        = "/data/trino"
        type        = "directory"
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = 511 // 0o777
        recursive   = true
      }
    ]
    environment = var.environment
    entrypoint = {
      command = "/usr/bin/run-trino"
    }
  })
}
