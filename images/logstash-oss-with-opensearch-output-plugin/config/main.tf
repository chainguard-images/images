terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "openjdk-17-default-jvm",
    # See the logstash package if you want to know more about this. The way
    # logstash does plugins is by using bundler to create an environment with
    # the right gems.
    "logstash-8-with-output-opensearch",
    "logstash-8-env2yaml",
    "logstash-8-compat",
    # Logstash is basically composed of a bunch of wrapper scripts to set up an
    # environment and then execute the proper code. It fails with a bunch of
    # 'command not found' errors if busybox is missing and a 'docker-entrypoint
    # not found' if bash is missing.
    "busybox",
    "bash",
  ]
}

variable "entrypoint" {
  description = "The image entrypoint"
  default = {
    command = "/usr/bin/docker-entrypoint"
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
  name   = "logstash"
  gid    = 1000
  uid    = 1000
  run-as = 1000
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge(var.environment, {
      "LS_JAVA_HOME"      = "/usr/lib/jvm/default-jvm",
      "ELASTIC_CONTAINER" = "true"
      "LANG"              = "en_US.UTF-8"
    })
    paths = concat(var.paths, [
      {
        path        = "/usr/share/logstash",
        type        = "directory",
        uid         = module.accts.block.run-as,
        gid         = module.accts.block.run-as,
        permissions = 502, # o766
        recursive   = true,
      },
      {
        path        = "/usr/share/logstash/logs",
        type        = "directory",
        uid         = 1000,
        gid         = 1000,
        permissions = 502, # o766
        recursive   = true,
      },
      {
        path        = "/usr/share/logstash/bin",
        type        = "directory",
        uid         = 1000,
        gid         = 1000,
        permissions = 493, # o755
        recursive   = true,
      },
      {
        path        = "/opt/logstash",
        type        = "hardlink",
        source      = "/usr/share/logstash",
        uid         = 1000,
        gid         = 1000,
        permissions = 502, # o766
      },
    ])
    entrypoint = var.entrypoint
  })
}
