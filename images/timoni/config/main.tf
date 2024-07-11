module "accts" {
  source = "../../../tflib/accts"
}

variable "extra_packages" {
  default     = ["git", "kubectl-latest", "timoni"]
  description = "Additional packages to install."
  type        = list(string)
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/timoni"
    },
    "cmd" : "help",
    "accounts" : module.accts.block
  })
}

