variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["prometheus-pushgateway"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["prometheus-pushgateway-bitnami-compat"], var.extra_packages)
    }

    entrypoint = {
      command = "/opt/bitnami/pushgateway/bin/pushgateway"
    }
  })
}
