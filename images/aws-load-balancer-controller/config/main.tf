module "accts" {
  name   = "aws-load-balancer-controller"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["aws-load-balancer-controller"]
  description = "The additional packages to install (e.g. aws-load-balancer-controller)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/controller"
    },
    "accounts" : module.accts.block
  })
}

