variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["nfs-subdir-external-provisioner", ]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, ["umount", "mount", "nfs-utils"])
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/nfs-subdir-external-provisioner"
    }
  })
}
