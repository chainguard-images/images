terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

# TODO: We should have virtual packages that we use here
# that the appropriate versions "provide".

variable "extra_packages" {
  description = "The additional packages to install (e.g. openjdk-17-default-jvm)."
  default     = ["openjdk-17-default-jvm"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
