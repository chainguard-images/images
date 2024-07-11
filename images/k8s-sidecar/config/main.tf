module "accts" {
  name   = "k8s-sidecar"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["k8s-sidecar"]
  description = "The additional packages to install (e.g. k8s-sidecar)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "python -u /usr/share/app/sidecar.py"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "PYTHONUNBUFFERED" : "1"
    }
  })
}

