terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

module "accts" { source = "../../../tflib/accts" }

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = []
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/bin/blackbox_exporter"
    }
    cmd = "--config.file=/etc/blackbox_exporter/config.yml"
  })
}
