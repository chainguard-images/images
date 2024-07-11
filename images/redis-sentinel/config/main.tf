module "accts" {
  name   = "redis"
  source = "../../../tflib/accts"
}

variable "extra_packages" {
  default     = ["redis-sentinel-6.2-compat"]
  description = "Additional packages to install."
  type        = list(string)
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/opt/bitnami/scripts/redis-sentinel/entrypoint.sh"
    },
    "cmd" : "/opt/bitnami/scripts/redis-sentinel/run.sh",
    "accounts" : module.accts.block,
    "environment" : {
      "BITNAMI_APP_NAME" : "redis-sentinel"
    },
    "paths" : [
      {
        "path" : "/opt/bitnami",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/bitnami/redis-sentinel",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

