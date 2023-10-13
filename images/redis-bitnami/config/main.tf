variable "name" {
  description = "Package name (e.g. cainjector, acmeresolver, controller, webhook)"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1001
  uid    = 1001
  gid    = 1001
  name   = "redis"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}${var.suffix}-bitnami-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/opt/bitnami/scripts/${var.name}/entrypoint.sh /opt/bitnami/scripts/${var.name}/run.sh"
    }
  })
}
