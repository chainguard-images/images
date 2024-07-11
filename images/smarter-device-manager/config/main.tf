module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["smarter-device-manager"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/smarter-device-management"
    },
    "cmd" : "-config=/etc/smarter-device-manager/conf.yaml -logtostderr=true -v=2",
    "accounts" : module.accts.block
  })
}

