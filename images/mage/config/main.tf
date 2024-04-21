terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. go)."
  default     = ["go"]
}

locals { base_config = yamldecode(file("${path.module}/template.apko.yaml")) }

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.base_config,
    {
      // Allow injecting extra repositories and keyrings.
      contents = {
        packages     = local.base_config.contents.packages
      }
    },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
