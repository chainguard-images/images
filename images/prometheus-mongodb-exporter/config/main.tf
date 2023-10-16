terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = ["prometheus-mongodb-exporter"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/latest.apko.yaml")
  extra_packages = concat(
    var.extra_packages,
    ["prometheus-mongodb-exporter-bitnami-compat"],
  )
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
