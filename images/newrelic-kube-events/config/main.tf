terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["newrelic-nri-kube-events"]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "nri-kube-events"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, [
        "tini",
        "busybox",
      ])
    }
    accounts = module.accts.block
    # This entire string is required for the entrypoint, the chart relies
    # on it being there
    entrypoint = {
      command = "/sbin/tini -- /usr/bin/nri-kube-events"
    }
    environment = {
      "METADATA" = true,
    }
  })
}
