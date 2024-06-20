variable "name" {
  description = "Package name (e.g. cainjector, acmeresolver, controller, webhook)"
}

variable "suffix" {
  default     = ""
  description = "Package name suffix (e.g. version stream)"
}

variable "extra_packages" {
  default     = []
  description = "Additional packages to install."
  type        = list(string)
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        var.name == "cmctl" ? "${var.name}${var.suffix}" : "cert-manager${var.suffix}-${var.name}",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${var.name}"
    }
  })
}

