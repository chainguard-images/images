module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_env_variables" {
  default     = {}
  description = "Additional environment variables to set"
}

variable "extra_packages" {
  default     = ["kubectl-default"]
  description = "The additional packages to install (e.g. kubectl-default, kubectl-1.28-default)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/kubectl"
    },
    "cmd" : "help",
    "accounts" : module.accts.block,
    "environment" : var.extra_env_variables
  })
}

