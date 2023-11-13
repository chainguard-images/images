terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "The name of the component (e.g. kubeflow-pipelines-apiserver)."
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = []
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.${var.name}.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
