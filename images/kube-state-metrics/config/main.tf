module "accts" {
  name   = "kube-state-metrics"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kube-state-metrics"]
  description = "The additional packages to install (e.g. kube-state-metrics, kube-state-metrics-2.8)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/kube-state-metrics"
    },
    "accounts" : module.accts.block
  })
}

