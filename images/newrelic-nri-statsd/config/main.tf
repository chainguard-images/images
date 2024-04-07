terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = [
    "newrelic-nri-statsd",
    # "newrelic-nri-statsd-compat",
    "busybox",
  ]
}
module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/home/nonroot/nri-statsd.sh"
    },
    work-dir = "/home/nonroot"
  })
}
