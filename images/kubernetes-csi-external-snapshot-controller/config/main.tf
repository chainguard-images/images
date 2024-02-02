variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["kubernetes-csi-external-snapshot-controller"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/snapshot-controller"
    }
  })
}
