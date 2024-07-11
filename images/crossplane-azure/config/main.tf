locals {
  baseline_packages = ["crossplane-provider-azure"]
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["crossplane-provider-azure-family"]
  description = "The additional packages to install (e.g. crossplane-provider-azure-{family,authorization,managedidentity,sql,storage})."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/provider"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "TERRAFORM_NATIVE_PROVIDER_PATH" : "/usr/bin/terraform-provider-azurerm",
      "TERRAFORM_PROVIDER_SOURCE" : "hashicorp/azurerm",
      "TERRAFORM_PROVIDER_VERSION" : "0.0.0",
      "TERRAFORM_VERSION" : "0.0.0"
    }
  })
}

