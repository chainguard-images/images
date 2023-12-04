terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. kubectl-default, kubectl-1.28-default)."
  default = [
    "ruby3.2-fluentd-1.16",
    "ruby3.2-fluentd-1.16-logging-operator-compat",
    "libpq-11",
    "fluent-plugin-tag-normaliser",
    "fluent-plugin-detect-exceptions",
    "fluent-plugin-label-router",
    "fluent-plugin-prometheus",
  ]
}

variable "entrypoint" {
  description = "The image entrypoint"
  default = {
    command = "/bin/entrypoint.sh"
  }
}

variable "paths" {
  description = "File paths for the image"
  default     = []
}

variable "environment" {
  description = "Environment variables to add to the image"
  default     = {}
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "fluent"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts   = module.accts.block
    entrypoint = var.entrypoint
    paths = concat(var.paths, [
      {
        path        = "/fluentd/log",
        type        = "directory",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 493,
      },
      {
        path        = "/fluentd/etc",
        type        = "directory",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 493,
      },
      {
        path        = "/fluentd/plugins",
        type        = "directory",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 493,
      },
      {
        path        = "/buffers",
        type        = "directory",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 493,
      },
      {
        path        = "/etc/fluent/fluent.conf",
        type        = "empty-file",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 420,
      },
    ])
    environment = merge(var.environment, {
      "FLUENTD_CONF" : "fluent.conf",
      "LD_PRELOAD" : "",
    })
    cmd = "fluentd"
  })
}
