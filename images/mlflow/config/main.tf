terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["mlflow"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "nonroot"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/share/mlflow/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    }, var.environment)
    entrypoint = {
      command = "/usr/share/mlflow/bin/python3"
    }
    work-dir = "/home/nonroot"
  })
}
