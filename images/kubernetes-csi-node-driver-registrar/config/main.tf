terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. kubernetes-csi-node-driver-registrar, kubernetes-csi-node-driver-registrar-2.8)."
  default     = ["kubernetes-csi-node-driver-registrar", "kubernetes-csi-node-driver-registrar-compat"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
