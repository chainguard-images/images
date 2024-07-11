locals {
  baseline_packages = ["ca-certificates", "curl"]
}

module "accts" {
  name   = "php"
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["php", "php-fpm"]
  description = "The additional packages to install (e.g. php-fpm)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "type" : "service-bundle",
      "services" : {
        "php-fpm" : "/usr/sbin/php-fpm"
      }
    },
    "work-dir" : "/app",
    "accounts" : module.accts.block,
    "environment" : {
      "PATH" : "/usr/sbin:/sbin:/usr/bin:/bin"
    },
    "paths" : [
      {
        "path" : "/app",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

