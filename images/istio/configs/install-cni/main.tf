terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. istio-install-cni, istio-cni...)"
  default = [
    "istio-install-cni",
    "istio-install-cni-compat",
    "istio-cni",
    "istio-cni-compat",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
