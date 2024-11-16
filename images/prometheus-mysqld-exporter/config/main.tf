locals {
  baseline_packages = ["busybox"]
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default = ["prometheus-mysqld-exporter"]
  type    = list(string)
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/mysqld_exporter"
    },
    "accounts" : module.accts.block
  })
}


