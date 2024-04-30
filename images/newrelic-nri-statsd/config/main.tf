terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "newrelic-nri-statsd",
  ]
}
module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, [
        "busybox",
      ])
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/home/nonroot/nri-statsd.sh"
    },
    work-dir = "/home/nonroot"
  })
}
