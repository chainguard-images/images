module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["argo-workflow-cli", "argo-workflows-known-hosts"]
  description = "The additional packages to install "
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "argo"
    },
    "accounts" : module.accts.block
  })
}

