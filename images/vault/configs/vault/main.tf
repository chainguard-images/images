module "accts" {
  name   = "vault"
  run-as = 0
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install."
  type        = list(string)
}

output "config" {
  value = jsonencode({
    "contents" : {
      "repositories" : [
        "https://packages.cgr.dev/extras"
      ],
      "keyring" : [
        "https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"
      ],
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/docker-entrypoint.sh"
    },
    "cmd" : "server -dev",
    "accounts" : module.accts.block
  })
}

