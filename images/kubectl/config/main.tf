module "accts" {
  source = "../../../../tflib/accts"
}

variable "entrypoint" {
  default     = "/usr/bin/kubectl"
  description = "Image entrypoint"
}

variable "command" {
  default     = "--help"
  description = "Image command"
}

variable "extra_env_variables" {
  default     = {}
  description = "Additional environment variables to set"
}

variable "extra_packages" {
  default     = ["kubectl-default"]
  description = "The additional packages to install (e.g. kubectl-default, kubectl-1.28-default)."
}

variable "extra_paths" {
  default     = []
  description = "The additional paths to add."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : var.entrypoint
    },
    "cmd" : var.command
    "accounts" : module.accts.block,
    "environment" : var.extra_env_variables
    "paths" : var.extra_paths
  })
}

