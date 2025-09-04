module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["helm", "kubectl-latest"]
  description = "The additional packages to install (e.g. helm)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/helm"
    },
    "cmd" : "help",
    "accounts" : module.accts.block
  })
}

