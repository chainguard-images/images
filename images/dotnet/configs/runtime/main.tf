module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dotnet-9-runtime"]
  description = "The additional packages to install (e.g. dotnet-runtime)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/dotnet"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block
  })
}

