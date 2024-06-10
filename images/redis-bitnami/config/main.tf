terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "Package name (e.g. cainjector, acmeresolver, controller, webhook)"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Additional environment variables to set."
  default     = {}
}

// Create a dummy config that includes redis, so we can extract the actual version.
data "apko_config" "for-getting-redis-version" {
  config_contents = jsonencode({
    contents = {
      packages = ["redis${var.suffix}"]
    }
  })
}

// Extract the redis version from the dummy config.
locals {
  // This finds the redis package in the dummy config, like "redis-7.2=7.2.5-r1"
  redis_package         = [for p in data.apko_config.for-getting-redis-version.config.contents.packages : p if startswith(p, "redis${var.suffix}=")][0]
  full_version          = split("=", local.redis_package)[1] // This extracts the version, like "7.2.5-r1"
  version_without_epoch = split("-", local.full_version)[0]  // This extracts the version without the epoch, like "7.2.5"
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1001
  uid    = 1001
  gid    = 1001
  name   = "redis"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}${var.suffix}-bitnami-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "BITNAMI_APP_NAME" : "redis"
      "APP_VERSION" : local.version_without_epoch
    }, var.environment)
    paths = [{
      path        = "/opt/bitnami"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
      },
      {
        path        = "/bitnami"
        type        = "directory"
        uid         = module.accts.block.run-as
        gid         = module.accts.block.run-as
        permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
        recursive   = true
    }]
    entrypoint = {
      command = "/bin/bash -c '/opt/bitnami/scripts/${var.name}/postunpack.sh && /opt/bitnami/scripts/${var.name}/entrypoint.sh && /opt/bitnami/scripts/${var.name}/run.sh'"
    }
  })
}
