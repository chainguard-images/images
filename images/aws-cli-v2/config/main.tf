module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["aws-cli-v2"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "aws"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "LD_LIBRARY_PATH" : "/usr/lib/aws-cli"
    }
  })
}

