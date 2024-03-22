locals {
  # the controller doesn't need anything, but speaker and its containers rely on the extras here
  extra_packages = var.main_package != "metallb-controller" ? ["busybox", "bash", "python3", "metallb-frr-compat", "tini"] : []
}

variable "main_package" {
  description = "Main package to install"
  type        = string
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  # speaker seems to only want to run as root
  run-as = var.main_package == "metallb-speaker" ? 0 : 65534
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([var.main_package], local.extra_packages, var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${var.main_package}"
    }
  })
}
