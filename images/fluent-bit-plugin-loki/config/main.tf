module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["fluent-bit", "fluent-bit-compat", "fluent-bit-plugin-loki"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "fluent-bit -e /fluent-bit/bin/out_grafana_loki.so -c /fluent-bit/etc/fluent-bit-loki.conf"
    },
    "accounts" : module.accts.block
  })
}

