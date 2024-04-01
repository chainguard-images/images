variable "name" {
  description = "Package name"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = []
}

variable "entrypoint" {
  description = "The entrypoint to use for the image"
  type        = string
}

module "accts" {
  source = "../../../tflib/accts"
  # speaker seems to only want to run as root
  run-as = var.name == "metallb-speaker" ? 0 : 65534
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}${var.suffix}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
  })
}
