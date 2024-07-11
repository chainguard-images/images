module "accts" {
  name   = "cluster-autoscaler"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["cluster-autoscaler", "cluster-autoscaler-compat"]
  description = "The additional packages to install (e.g. cluster-autoscaler. cluster-autoscaler-1.28)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/cluster-autoscaler"
    },
    "work-dir" : "/",
    "accounts" : module.accts.block
  })
}

