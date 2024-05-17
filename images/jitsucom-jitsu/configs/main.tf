terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = []
}

variable "name" {
  description = "The name of the component"
  default     = "console"
}

data "apko_config" "this" {
  config_contents = file("${path.module}/${var.name}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
