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
    "trino-plugin-exchange-hdfs",
    "trino-plugin-exchange-filesystem",
    "trino-plugin-delta-lake",
    "trino-plugin-redis",
    "trino-plugin-kafka",
    "trino-plugin-resource-group-managers",
    "trino-plugin-blackhole",
    "trino-plugin-elasticsearch",
    "trino-plugin-geospatial",
    "trino-plugin-hive",
    "trino-plugin-http-event-listener",
    "trino-plugin-local-file",
    "trino-plugin-password-authenticators",
    "trino-plugin-postgresql",
    "trino-plugin-prometheus",
    "trino-plugin-example-http",
    "trino-plugin-mysql",
    "trino-plugin-mysql-event-listener",
    "trino-plugin-sqlserver",
  ]
}

variable "packages" {
  # https://github.com/runatlantis/atlantis/blob/main/Dockerfile#L44
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
