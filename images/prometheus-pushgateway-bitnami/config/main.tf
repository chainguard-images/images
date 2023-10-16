variable "name" {
  description = "Package name (e.g. prometheus-pushgateway)"
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

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}${var.suffix}-bitnami-compat"], var.extra_packages)
    }

    entrypoint = {
      command = "/opt/bitnami/pushgateway/bin/pushgateway"
    }
  })
}
