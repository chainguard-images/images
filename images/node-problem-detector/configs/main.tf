terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. node-problem-detector, node-problem-detector-0.8, etc)."
  default = [
    "node-problem-detector",
    "node-problem-detector-compat",
    "health-checker",
    "log-counter",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
