variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["kubernetes-dashboard"]
}

module "accts" { source = "../../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/share/kubernetes-dashboard/dashboard --insecure-bind-address=0.0.0.0 --bind-address=0.0.0.0"
    }
  })
}
