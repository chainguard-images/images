module "accts" {
  name   = "vault"
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["libcap", "vault-k8s"]
  description = "The additional packages to install."
  type        = list(string)
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/vault-k8s"
    },
    "accounts" : module.accts.block
  })
}

