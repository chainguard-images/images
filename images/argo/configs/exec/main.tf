module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["argo-workflow-executor", "argo-workflow-executor-compat", "argo-workflows-known-hosts"]
  description = "The additional packages to install "
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "argoexec"
    },
    "accounts" : module.accts.block
  })
}

