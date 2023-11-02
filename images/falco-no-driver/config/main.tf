variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "falco-no-driver",
  ]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/falco"
    }
    environment = {
      "HOST_ROOT" : "/host",
      "HOME" : "/root"
    }
  })
}
