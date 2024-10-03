module "accts" {
  source = "../../../../tflib/accts"
}

variable "extra_packages" {
  default     = ["argo-events", "argo-events-compat"]
  description = "The additional packages to install "
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "argo-events"
    },
    "accounts" : module.accts.block
  })
}

