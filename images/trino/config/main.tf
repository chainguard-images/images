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
    paths = [{
      path        = "/usr/lib/trino/"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493 // 0o755
      recursive   = true
      }, {

      path        = "/etc/trino/"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493 // 0o755
      recursive   = true
      }, {
      path        = "/data/trino"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511 // 0o777
      recursive   = true
    }]
    entrypoint = {
      command = "/usr/bin/run-trino"
    }
  })
}
