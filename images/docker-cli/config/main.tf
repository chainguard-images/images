module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

variable "extra_packages" {
  default     = ["docker-cli"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/docker"
    },
    "accounts" : module.accts.block
  })
}
